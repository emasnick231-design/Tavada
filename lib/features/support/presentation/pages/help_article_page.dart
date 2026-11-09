import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/features/support/domain/entities/help.dart';
import 'package:tavada_eats/features/support/domain/repositories/support_repositories.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Help article with "Was this helpful?" and "Chat with a person".
class HelpArticlePage extends StatefulWidget {
  const HelpArticlePage({required this.articleId, super.key});

  final String articleId;

  @override
  State<HelpArticlePage> createState() => _HelpArticlePageState();
}

class _HelpArticlePageState extends State<HelpArticlePage> {
  ViewStatus _status = ViewStatus.loading;
  HelpArticle? _article;
  Failure? _failure;
  bool? _helpful;

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  Future<void> _load() async {
    setState(() => _status = ViewStatus.loading);
    final result = await sl<HelpRepository>().getArticle(widget.articleId);
    if (!mounted) return;
    setState(() {
      result.fold(
        (f) {
          _status = ViewStatus.failure;
          _failure = f;
        },
        (article) {
          _status = ViewStatus.success;
          _article = article;
        },
      );
    });
  }

  Future<void> _vote({required bool helpful}) async {
    if (_helpful != null) return;
    setState(() => _helpful = helpful);
    AppToast.show(context, context.l10n.helpThanks);
    await sl<HelpRepository>().sendArticleFeedback(
      widget.articleId,
      helpful: helpful,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final article = _article;
    if (article == null) {
      return AppScaffold(
        appBar: const AppTopBar(),
        body: _status.isFailure
            ? ErrorStateView(failure: _failure, onRetry: _load)
            : const Center(child: CircularProgressIndicator()),
      );
    }
    Widget vote({required bool helpful}) {
      final selected = _helpful == helpful;
      // Figma: filled thumbs — orange "Yes", grey "No".
      final icon = helpful ? Assets.icons.likeBold : Assets.icons.dislikeBold;
      return PressableScale(
        onTap: () => _vote(helpful: helpful),
        enabled: _helpful == null,
        child: AnimatedContainer(
          duration: AppDurations.fast,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.md - 1,
          ),
          decoration: BoxDecoration(
            color: selected ? colors.brandSubtle : colors.surface,
            borderRadius: AppRadii.lgAll,
            border: Border.all(color: selected ? colors.brand : colors.border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppIcon(
                icon,
                size: AppSizes.iconMd,
                color: helpful || selected ? colors.brand : colors.textDisabled,
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                helpful ? l10n.helpYes : l10n.helpNo,
                style: AppTypography.labelMedium,
              ),
            ],
          ),
        ),
      );
    }

    return AppScaffold(
      bottomBar: StickyBottomBar(
        showShadow: false,
        child: AppButton(
          label: l10n.helpChatWithPerson,
          onPressed: () => context.push(AppRoutes.supportChat),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.gutter,
            AppSpacing.lg,
            AppSpacing.gutter,
            AppSpacing.xxl,
          ),
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: AppBackButton(),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(article.title, style: AppTypography.headlineLarge).entrance(),
            const SizedBox(height: AppSpacing.xl),
            // Figma: copy on a 20pt gutter, the vote block lower.
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
              child: Text(
                article.body,
                style: AppTypography.bodyMedium.copyWith(
                  color: colors.textSecondary,
                  fontWeight: FontWeight.w400,
                ),
              ).entrance(index: 1),
            ),
            const SizedBox(height: AppSpacing.huge),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
              child: Text(
                l10n.helpWasHelpful,
                style: AppTypography.bodyMedium.copyWith(
                  color: colors.textSecondary,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.xxl + AppSpacing.xs),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
              child: Row(
                children: [
                  vote(helpful: true),
                  const SizedBox(width: AppSpacing.xxl),
                  vote(helpful: false),
                ],
              ),
            ).entrance(index: 2),
          ],
        ),
      ),
    );
  }
}
