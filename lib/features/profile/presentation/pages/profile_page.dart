import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/models/money.dart';
import 'package:tavada_eats/core/session/session_cubit.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/features/profile/domain/repositories/account_settings_repository.dart';
import 'package:tavada_eats/features/profile/presentation/bloc/account_bloc.dart';
import 'package:tavada_eats/features/profile/presentation/widgets/profile_widgets.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Profile tab: wallet, rewards and account settings.
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final signedIn = context.select<SessionCubit, bool>(
      (c) => c.state.isAuthenticated,
    );
    return AppScaffold(
      body: SafeArea(
        bottom: false,
        child: signedIn ? const _SignedInProfile() : const _GuestProfile(),
      ),
    );
  }
}

class _SignedInProfile extends StatefulWidget {
  const _SignedInProfile();

  @override
  State<_SignedInProfile> createState() => _SignedInProfileState();
}

class _SignedInProfileState extends State<_SignedInProfile> {
  final AccountBloc _account = sl<AccountBloc>();

  @override
  void initState() {
    super.initState();
    _account.add(
      _account.state.overview == null
          ? const AccountStarted()
          : const AccountRefreshed(),
    );
  }

  Future<void> _logout() async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AppDialog(
        title: l10n.profileLogoutTitle,
        message: l10n.profileLogoutMessage,
        actions: [
          AppButton(
            label: l10n.profileLogout,
            onPressed: () => Navigator.pop(dialogContext, true),
          ),
          AppButton.secondary(
            label: l10n.commonCancel,
            onPressed: () => Navigator.pop(dialogContext, false),
          ),
        ],
      ),
    );
    if (!(confirmed ?? false) || !mounted) return;
    await context.read<SessionCubit>().signOut();
    if (mounted) context.go(AppRoutes.welcome);
  }

  /// App Store 5.1.1(v): customers can delete their account in the app.
  Future<void> _deleteAccount() async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AppDialog(
        title: l10n.profileDeleteTitle,
        message: l10n.profileDeleteMessage,
        actions: [
          AppButton(
            label: l10n.profileDeleteConfirm,
            onPressed: () => Navigator.pop(dialogContext, true),
          ),
          AppButton.secondary(
            label: l10n.commonCancel,
            onPressed: () => Navigator.pop(dialogContext, false),
          ),
        ],
      ),
    );
    if (!(confirmed ?? false) || !mounted) return;
    setState(() => _deleting = true);
    final result = await sl<AccountSettingsRepository>().deleteAccount();
    if (!mounted) return;
    setState(() => _deleting = false);
    await result.fold(
      (failure) async => AppToast.show(
        context,
        failure.localizedMessage(l10n),
        type: ToastType.error,
      ),
      (_) async {
        final router = GoRouter.of(context);
        AppToast.show(context, l10n.profileDeleted, type: ToastType.success);
        await context.read<SessionCubit>().signOut();
        router.go(AppRoutes.welcome);
      },
    );
  }

  bool _deleting = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final user = context.select<SessionCubit, ({String name, String? avatar})>(
      (c) => (
        name: c.state.user?.fullName ?? '',
        avatar: c.state.user?.avatarUrl,
      ),
    );
    return BlocBuilder<AccountBloc, AccountState>(
      bloc: _account,
      builder: (context, state) {
        final overview = state.overview;
        return RefreshIndicator(
          onRefresh: () async {
            _account.add(const AccountRefreshed());
            await _account.stream.firstWhere((s) => !s.isRefreshing);
          },
          child: ListView(
            padding: EdgeInsets.fromLTRB(
              AppSpacing.gutter,
              AppSpacing.lg,
              AppSpacing.gutter,
              MediaQuery.paddingOf(context).bottom +
                  AppSizes.bottomNavHeight +
                  AppSpacing.xl,
            ),
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => context.push(AppRoutes.editProfile),
                      child: Text(
                        user.name,
                        style: AppTypography.headlineLarge,
                      ),
                    ),
                  ),
                  AppAvatar(
                    imageUrl: user.avatar ?? Assets.images.avatars.parrot.path,
                  ),
                ],
              ).entrance(),
              const SizedBox(height: AppSpacing.lg),
              if (state.status.isFailure && overview == null)
                ErrorStateView(
                  failure: state.failure,
                  compact: true,
                  onRetry: () => _account.add(const AccountStarted()),
                )
              else
                AppSkeleton(
                  enabled: overview == null,
                  child: WalletCard(
                    balance: overview?.walletBalance ?? Money.zero,
                  ),
                ).entrance(index: 1),
              const SizedBox(height: AppSpacing.md),
              SettingsRow(
                icon: Assets.icons.userLinear,
                label: l10n.profileEditProfile,
                onTap: () => context.push(AppRoutes.editProfile),
              ),
              SettingsRow(
                icon: Assets.icons.phoneRoundedLinear,
                label: l10n.profileUpdatePhone,
                onTap: () => context.push(AppRoutes.updatePhone),
              ),
              SettingsRow(
                icon: Assets.icons.passwordMinimalisticLinear,
                label: l10n.profileChangePassword,
                onTap: () => context.push(AppRoutes.changePassword),
              ),
              SettingsRow(
                icon: Assets.icons.bellLinear,
                label: l10n.profileNotifications,
                onTap: () => context.push(AppRoutes.notificationPreferences),
              ),
              SettingsRow(
                icon: Assets.icons.medalRibbonsStarLinear,
                label: l10n.profileRewards,
                showDivider: overview == null,
                onTap: () => context.push(AppRoutes.rewards),
              ),
              if (overview != null)
                Container(
                  padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: colors.divider)),
                  ),
                  child: RewardsProgressCard(
                    rewards: overview.rewards,
                    onRedeem: () => context.push(AppRoutes.rewards),
                  ),
                ),
              SettingsRow(
                icon: Assets.icons.accessibilityLinear,
                label: l10n.profileAccessibility,
                onTap: () => context.push(AppRoutes.accessibility),
              ),
              ..._commonRows(context),
              SettingsRow(
                icon: Assets.icons.logout2Linear,
                label: l10n.profileLogout,
                onTap: _logout,
              ),
              SettingsRow(
                icon: Assets.icons.trashBinMinimalisticLinear,
                label: l10n.profileDeleteAccount,
                color: colors.error,
                showDivider: false,
                trailing: _deleting
                    ? const SizedBox.square(
                        dimension: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : null,
                onTap: _deleting ? null : _deleteAccount,
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Language + help + haptics — available signed in or not.
List<Widget> _commonRows(BuildContext context) {
  final l10n = context.l10n;
  return [
    SettingsRow(
      icon: Assets.icons.translationLinear,
      label: l10n.profileLanguage,
      onTap: () => context.push(AppRoutes.language),
    ),
    SettingsRow(
      icon: Assets.icons.headphonesRoundLinear,
      label: l10n.profileHelp,
      onTap: () => context.push(AppRoutes.help),
    ),
  ];
}

class _GuestProfile extends StatelessWidget {
  const _GuestProfile();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.gutter,
        AppSpacing.lg,
        AppSpacing.gutter,
        AppSpacing.xxl,
      ),
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                l10n.profileGuest,
                style: AppTypography.headlineLarge,
              ),
            ),
            AppAvatar(imageUrl: Assets.images.avatars.parrot.path),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: colors.surfaceWarm,
            borderRadius: AppRadii.xxlAll,
            border: Border.all(color: AppColors.primary100),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.signInRequiredTitle, style: AppTypography.titleLarge),
              const SizedBox(height: AppSpacing.xs),
              Text(l10n.profileGuestMessage, style: AppTypography.paragraph),
              const SizedBox(height: AppSpacing.lg),
              AppButton(
                label: l10n.profileSignIn,
                size: AppButtonSize.lg,
                onPressed: () => context.push(
                  Uri(
                    path: AppRoutes.login,
                    queryParameters: {'from': AppRoutes.profile},
                  ).toString(),
                ),
              ),
            ],
          ),
        ).entrance(),
        const SizedBox(height: AppSpacing.md),
        ..._commonRows(context),
      ],
    );
  }
}
