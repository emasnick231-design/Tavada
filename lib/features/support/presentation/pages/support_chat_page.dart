import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/session/session_cubit.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/core/utils/formatters.dart';
import 'package:tavada_eats/features/support/domain/entities/chat.dart';
import 'package:tavada_eats/features/support/presentation/bloc/support_chat_cubit.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Live chat with a support agent.
class SupportChatPage extends StatelessWidget {
  const SupportChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final name = context.read<SessionCubit>().state.user?.firstName;
    return BlocProvider(
      create: (_) {
        final cubit = SupportChatCubit(sl(), customerName: name);
        unawaited(cubit.load());
        return cubit;
      },
      child: const _ChatView(),
    );
  }
}

class _ChatView extends StatefulWidget {
  const _ChatView();

  @override
  State<_ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<_ChatView> {
  final _controller = TextEditingController();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final hasText = _controller.text.trim().isNotEmpty;
      if (hasText != _hasText) setState(() => _hasText = hasText);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _send() {
    final text = _controller.text;
    if (text.trim().isEmpty) return;
    _controller.clear();
    unawaited(context.read<SupportChatCubit>().send(text: text));
  }

  Future<void> _attach() async {
    final XFile? file;
    try {
      file = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxWidth: 1600,
      );
    } on PlatformException {
      // Photo permission denied / picker unavailable.
      if (mounted) {
        AppToast.show(
          context,
          context.l10n.chatPhotoAccessDenied,
          type: ToastType.error,
        );
      }
      return;
    }
    if (file == null || !mounted) return;
    await context.read<SupportChatCubit>().send(imagePath: file.path);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    return BlocBuilder<SupportChatCubit, SupportChatState>(
      builder: (context, state) {
        final agent = state.agent;
        final messages = state.messages;
        return AppScaffold(
          appBar: AppTopBar(
            alwaysShowDivider: true,
            title: agent == null
                ? l10n.chatTitle
                : l10n.chatWithAgent(agent.name),
          ),
          body: Column(
            children: [
              Expanded(
                child: switch (state.status) {
                  _ when state.status.isFailure && state.thread == null =>
                    ErrorStateView(
                      failure: state.failure,
                      onRetry: context.read<SupportChatCubit>().load,
                    ),
                  // First load: a spinner, not "no messages yet".
                  _ when messages.isEmpty && state.status.isBusy =>
                    const Center(child: CircularProgressIndicator()),
                  // Figma places the empty state in the upper half.
                  _ when messages.isEmpty && !state.agentTyping => Align(
                    alignment: const Alignment(0, -0.35),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.xxl),
                        child: Column(
                          children: [
                            Assets.images.illustrations.supportChat
                                .image(height: 120)
                                .popIn(),
                            const SizedBox(height: AppSpacing.lg),
                            Text(
                              l10n.chatEmpty,
                              textAlign: TextAlign.center,
                              style: AppTypography.bodyMedium.copyWith(
                                color: colors.textSecondary,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  _ => _MessageList(
                    messages: messages,
                    agent: agent,
                    agentTyping: state.agentTyping,
                  ),
                },
              ),
              _Composer(
                controller: _controller,
                canSend: _hasText,
                onSend: _send,
                onAttach: _attach,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _MessageList extends StatelessWidget {
  const _MessageList({
    required this.messages,
    required this.agent,
    required this.agentTyping,
  });

  final List<ChatMessage> messages;
  final SupportAgent? agent;
  final bool agentTyping;

  @override
  Widget build(BuildContext context) {
    // Newest at the bottom: build reversed so the list starts scrolled there.
    final items = <Widget>[
      if (agentTyping && agent != null) _AgentTyping(agent: agent!),
      for (var i = messages.length - 1; i >= 0; i--) ...[
        _Bubble(message: messages[i], agent: agent),
        if (i == 0 ||
            !_sameDay(messages[i - 1].createdAt, messages[i].createdAt))
          _DaySeparator(date: messages[i].createdAt),
      ],
    ];
    return ListView.builder(
      reverse: true,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.gutter,
        AppSpacing.lg,
        AppSpacing.gutter,
        AppSpacing.lg,
      ),
      itemCount: items.length,
      itemBuilder: (_, i) => items[i],
    );
  }

  static bool _sameDay(DateTime a, DateTime b) {
    final x = a.toLocal();
    final y = b.toLocal();
    return x.year == y.year && x.month == y.month && x.day == y.day;
  }
}

class _DaySeparator extends StatelessWidget {
  const _DaySeparator({required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      child: Row(
        children: [
          Expanded(child: Divider(color: colors.divider)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Text(
              Formatters.relative(date.toLocal(), context.l10n),
              style: AppTypography.bodySmall.copyWith(
                color: colors.textSecondary,
              ),
            ),
          ),
          Expanded(child: Divider(color: colors.divider)),
        ],
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({required this.message, required this.agent});

  final ChatMessage message;
  final SupportAgent? agent;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final m = message;
    final mine = m.isMine;
    final time = DateTime.now().difference(m.createdAt).inMinutes < 1
        ? l10n.commonJustNow
        : Formatters.time(m.createdAt.toLocal(), locale: l10n.localeName);
    final meta = AppTypography.caption.copyWith(color: colors.textTertiary);
    final failed = m.deliveryStatus == MessageDeliveryStatus.failed;

    final bubble = Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.sizeOf(context).width * 0.72,
      ),
      padding: m.hasImage
          ? const EdgeInsets.all(AppSpacing.xs)
          : const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
            ),
      decoration: BoxDecoration(
        color: mine ? colors.surfaceInverse : colors.surfaceMuted,
        borderRadius: AppRadii.xxxlAll,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (m.hasImage)
            ClipRRect(
              borderRadius: AppRadii.xxlAll,
              child:
                  m.imagePath!.startsWith('assets/') ||
                      m.imagePath!.startsWith('http')
                  ? AppImage(m.imagePath!, width: 200, height: 200)
                  : Image.file(
                      File(m.imagePath!),
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
            ),
          if (m.text != null)
            Padding(
              padding: m.hasImage
                  ? const EdgeInsets.all(AppSpacing.sm)
                  : EdgeInsets.zero,
              child: Text(
                m.text!,
                style: AppTypography.bodyLarge.copyWith(
                  color: mine ? colors.textInverse : colors.textPrimary,
                ),
              ),
            ),
        ],
      ),
    );

    if (mine) {
      return Padding(
        padding: const EdgeInsets.only(top: AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(time, style: meta),
            const SizedBox(height: AppSpacing.xs),
            GestureDetector(
              onTap: failed
                  ? () => context.read<SupportChatCubit>().retry(m)
                  : null,
              child: AnimatedOpacity(
                duration: AppDurations.fast,
                opacity: m.deliveryStatus == MessageDeliveryStatus.sending
                    ? 0.6
                    : 1,
                child: bubble,
              ),
            ),
            if (failed)
              Padding(
                padding: const EdgeInsets.only(top: AppSpacing.xs),
                child: Text(
                  l10n.chatSendFailed,
                  style: AppTypography.caption.copyWith(color: colors.error),
                ),
              ),
          ],
        ).entrance(offsetY: 0.2),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppAvatar(
            imageUrl: agent?.avatarUrl,
            size: AppSizes.avatarSm,
            showOnlineIndicator: agent?.isOnline ?? false,
          ),
          const SizedBox(width: AppSpacing.md),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.72,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          m.authorName ?? agent?.name ?? '',
                          style: AppTypography.labelLarge,
                        ),
                      ),
                      Text(time, style: meta),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                bubble,
              ],
            ),
          ),
        ],
      ).entrance(offsetY: 0.2),
    );
  }
}

class _AgentTyping extends StatelessWidget {
  const _AgentTyping({required this.agent});

  final SupportAgent agent;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.md),
      child: Semantics(
        label: context.l10n.chatTyping(agent.name),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppAvatar(
              imageUrl: agent.avatarUrl,
              size: AppSizes.avatarSm,
              showOnlineIndicator: agent.isOnline,
            ),
            const SizedBox(width: AppSpacing.md),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(agent.name, style: AppTypography.labelLarge),
                const SizedBox(height: AppSpacing.xs),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.sm,
                  ),
                  decoration: BoxDecoration(
                    color: colors.surfaceMuted,
                    borderRadius: AppRadii.lgAll,
                  ),
                  child: BouncingDots(
                    color: colors.textTertiary,
                    dotSize: 5,
                    spacing: 3,
                  ),
                ),
              ],
            ),
          ],
        ),
      ).entrance(),
    );
  }
}

class _Composer extends StatelessWidget {
  const _Composer({
    required this.controller,
    required this.canSend,
    required this.onSend,
    required this.onAttach,
  });

  final TextEditingController controller;
  final bool canSend;
  final VoidCallback onSend;
  final VoidCallback onAttach;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    return Container(
      color: colors.surface,
      padding: EdgeInsets.fromLTRB(
        AppSpacing.gutter,
        AppSpacing.sm,
        AppSpacing.gutter,
        MediaQuery.paddingOf(context).bottom + AppSpacing.sm,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AppIconButton(
            icon: Assets.icons.plusLinear,
            tooltip: l10n.chatAttachPhoto,
            onPressed: onAttach,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: TextField(
              controller: controller,
              minLines: 1,
              maxLines: 5,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => onSend(),
              style: AppTypography.bodyMedium,
              decoration: InputDecoration(
                hintText: l10n.chatHint,
                filled: true,
                fillColor: colors.surfaceMuted,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.md,
                ),
                border: const OutlineInputBorder(
                  borderRadius: AppRadii.xxxlAll,
                  borderSide: BorderSide.none,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: AppRadii.xxxlAll,
                  borderSide: BorderSide.none,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: AppRadii.xxxlAll,
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          AnimatedSize(
            duration: AppDurations.fast,
            child: canSend
                ? Padding(
                    padding: const EdgeInsets.only(left: AppSpacing.sm),
                    child: PressableScale(
                      onTap: onSend,
                      child: Container(
                        width: AppSizes.circleButton,
                        height: AppSizes.circleButton,
                        decoration: BoxDecoration(
                          color: colors.brand,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: AppIcon(
                          Assets.icons.plainBold,
                          size: AppSizes.iconMd,
                          color: colors.onBrand,
                        ),
                      ),
                    ).popIn(),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
