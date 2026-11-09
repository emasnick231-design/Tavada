import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/features/profile/domain/entities/account_settings.dart';
import 'package:tavada_eats/features/profile/presentation/bloc/notification_preferences_bloc.dart';
import 'package:tavada_eats/features/profile/presentation/widgets/profile_widgets.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Category checkboxes for one notification channel.
class NotificationChannelPage extends StatelessWidget {
  const NotificationChannelPage({required this.channel, super.key});

  /// `push`, `whatsapp` or `email` (route parameter).
  final String channel;

  @override
  Widget build(BuildContext context) {
    final value = NotificationChannel.values
        .where((c) => c.name == channel)
        .firstOrNull;
    if (value == null) {
      return AppScaffold(
        appBar: const AppTopBar(),
        body: ErrorStateView(message: context.l10n.errorNotFound),
      );
    }
    return BlocProvider(
      create: (_) =>
          NotificationPreferencesBloc(sl())
            ..add(const NotificationPreferencesStarted()),
      child: _ChannelView(channel: value),
    );
  }
}

class _ChannelView extends StatelessWidget {
  const _ChannelView({required this.channel});

  final NotificationChannel channel;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final categories = <(NotificationCategory, String, String)>[
      (
        NotificationCategory.orderStatus,
        l10n.notificationsOrderStatus,
        l10n.notificationsOrderStatusBody,
      ),
      (
        NotificationCategory.promotions,
        l10n.notificationsPromotions,
        l10n.notificationsPromotionsBody,
      ),
      (
        NotificationCategory.recommendations,
        l10n.notificationsRecommendations,
        l10n.notificationsRecommendationsBody,
      ),
      (
        NotificationCategory.reminders,
        l10n.notificationsReminders,
        l10n.notificationsRemindersBody,
      ),
    ];
    return BlocConsumer<
      NotificationPreferencesBloc,
      NotificationPreferencesState
    >(
      listenWhen: (a, b) => a.saveStatus != b.saveStatus,
      listener: (context, state) {
        if (state.saveStatus.isSuccess) {
          AppToast.show(
            context,
            l10n.notificationsSaved,
            type: ToastType.success,
          );
          context.pop();
        } else if (state.saveStatus.isFailure) {
          AppToast.show(
            context,
            state.saveFailure!.localizedMessage(l10n),
            type: ToastType.error,
          );
        }
      },
      builder: (context, state) {
        final bloc = context.read<NotificationPreferencesBloc>();
        final edited = state.edited[channel]?.categories ?? const {};
        final saved = state.saved[channel]?.categories ?? const {};
        final dirty =
            !(edited.length == saved.length && edited.containsAll(saved));
        return AccountFormScaffold(
          title: l10n.notificationsCategoriesTitle,
          children: [
            // A failed load gets a message + retry, not an endless skeleton.
            if (state.status.isFailure)
              ErrorStateView(
                failure: state.failure,
                compact: true,
                onRetry: () => bloc.add(const NotificationPreferencesStarted()),
              )
            else
              for (final (category, title, body) in categories)
                AppSkeleton(
                  enabled: !state.status.isSuccess,
                  child: InkWell(
                    onTap: () => bloc.add(
                      NotificationCategoryToggled(channel, category),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSpacing.xl,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: colors.divider),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(title, style: AppTypography.bodyMedium),
                                const SizedBox(height: AppSpacing.sm),
                                Text(
                                  body,
                                  style: AppTypography.caption.copyWith(
                                    color: colors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: AppSpacing.lg),
                          AppCheckbox(
                            value: edited.contains(category),
                            onChanged: (_) => bloc.add(
                              NotificationCategoryToggled(channel, category),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            const SizedBox(height: AppSpacing.xxl),
            AppButton(
              label: l10n.commonSaveChanges,
              isLoading: state.saveStatus.isSubmitting,
              onPressed: dirty
                  ? () => bloc.add(NotificationChannelSaved(channel))
                  : null,
            ),
          ],
        );
      },
    );
  }
}
