import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/features/profile/domain/entities/account_settings.dart';
import 'package:tavada_eats/features/profile/presentation/bloc/notification_preferences_bloc.dart';
import 'package:tavada_eats/features/profile/presentation/widgets/profile_widgets.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

String notificationChannelLabel(AppLocalizations l10n, NotificationChannel c) =>
    switch (c) {
      NotificationChannel.push => l10n.notificationsPush,
      NotificationChannel.whatsapp => l10n.notificationsWhatsapp,
      NotificationChannel.email => l10n.notificationsEmail,
    };

/// Push / WhatsApp / Email — each opens its category toggles.
class NotificationPreferencesPage extends StatelessWidget {
  const NotificationPreferencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          NotificationPreferencesBloc(sl())
            ..add(const NotificationPreferencesStarted()),
      child: const _PreferencesView(),
    );
  }
}

class _PreferencesView extends StatelessWidget {
  const _PreferencesView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<
      NotificationPreferencesBloc,
      NotificationPreferencesState
    >(
      builder: (context, state) {
        if (state.status.isFailure) {
          return AppScaffold(
            appBar: const AppTopBar(),
            body: ErrorStateView(
              failure: state.failure,
              onRetry: () => context.read<NotificationPreferencesBloc>().add(
                const NotificationPreferencesStarted(),
              ),
            ),
          );
        }
        return AccountFormScaffold(
          title: l10n.notificationsTitle,
          subtitle: l10n.notificationsSubtitle,
          children: [
            for (final channel in NotificationChannel.values)
              AppSkeleton(
                enabled: !state.status.isSuccess,
                child: SettingsRow(
                  label: notificationChannelLabel(l10n, channel),
                  // Figma: plain navigation rows with a chevron only.
                  verticalPadding: AppSpacing.xxl,
                  trailing: const _Chevron(),
                  onTap: () async {
                    await context.push(
                      AppRoutes.notificationChannel(channel.name),
                    );
                    if (context.mounted) {
                      context.read<NotificationPreferencesBloc>().add(
                        const NotificationPreferencesStarted(),
                      );
                    }
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}

class _Chevron extends StatelessWidget {
  const _Chevron();

  @override
  Widget build(BuildContext context) => Icon(
    Icons.chevron_right_rounded,
    color: context.colors.textSecondary,
  );
}
