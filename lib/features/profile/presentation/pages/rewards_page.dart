import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/features/profile/domain/entities/account_overview.dart';
import 'package:tavada_eats/features/profile/presentation/bloc/account_bloc.dart';
import 'package:tavada_eats/features/profile/presentation/bloc/rewards_bloc.dart';
import 'package:tavada_eats/features/profile/presentation/widgets/profile_widgets.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Points, progress to the next reward, redeeming and referrals.
class RewardsPage extends StatelessWidget {
  const RewardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RewardsBloc(
        sl(),
        initial: sl<AccountBloc>().state.overview,
      )..add(const RewardsStarted()),
      child: const _RewardsView(),
    );
  }
}

class _RewardsView extends StatelessWidget {
  const _RewardsView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<RewardsBloc, RewardsState>(
      listenWhen: (a, b) =>
          a.redeemStatus != b.redeemStatus || a.redemptions != b.redemptions,
      listener: (context, state) {
        final overview = state.overview;
        if (state.redeemStatus.isSuccess && overview != null) {
          sl<AccountBloc>().add(AccountOverviewChanged(overview));
          AppToast.show(
            context,
            l10n.profileRedeemed(overview.rewards.rewardValue.format()),
            type: ToastType.success,
          );
        } else if (state.redeemStatus.isFailure) {
          AppToast.show(
            context,
            state.redeemFailure!.localizedMessage(l10n),
            type: ToastType.error,
          );
        }
      },
      builder: (context, state) {
        final overview = state.overview;
        return AppScaffold(
          appBar: AppTopBar(title: l10n.rewardsTitle),
          body: overview == null
              ? (state.status.isFailure
                    ? ErrorStateView(
                        failure: state.failure,
                        onRetry: () => context.read<RewardsBloc>().add(
                          const RewardsStarted(),
                        ),
                      )
                    : const Center(child: CircularProgressIndicator()))
              : ListView(
                  padding: EdgeInsets.fromLTRB(
                    AppSpacing.gutter,
                    AppSpacing.sm,
                    AppSpacing.gutter,
                    MediaQuery.paddingOf(context).bottom + AppSpacing.xl,
                  ),
                  children: [
                    ConfettiBurst(
                      key: ValueKey(state.redemptions),
                      autoFire: state.redemptions > 0,
                      child: _PointsHero(rewards: overview.rewards),
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    RewardsProgressCard(
                      rewards: overview.rewards,
                      isRedeeming: state.redeemStatus.isSubmitting,
                      onRedeem: state.canRedeem
                          ? () => context.read<RewardsBloc>().add(
                              const RewardsRedeemRequested(),
                            )
                          : null,
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    const Divider(height: 1),
                    _HowItWorks(rewards: overview.rewards),
                    if (overview.rewards.referralCode.isNotEmpty)
                      _ReferralCode(code: overview.rewards.referralCode),
                  ],
                ),
        );
      },
    );
  }
}

class _PointsHero extends StatelessWidget {
  const _PointsHero({required this.rewards});

  final RewardsSummary rewards;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      // Same peach family as the wallet card instead of a saturated
      // orange glow (no Figma frame for this screen).
      decoration: const BoxDecoration(
        borderRadius: AppRadii.xxxlAll,
        gradient: AppColors.walletGradient,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.rewardsYourPoints,
                  style: AppTypography.labelMedium.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
                AnimatedCount(
                  value: rewards.points,
                  suffix: l10n.rewardsPointsSuffix,
                  style: AppTypography.displaySmall.copyWith(
                    color: context.colors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          Assets.images.illustrations.giftBox.image(height: 80).popIn(),
        ],
      ),
    );
  }
}

class _HowItWorks extends StatelessWidget {
  const _HowItWorks({required this.rewards});

  final RewardsSummary rewards;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final steps = [
      (Assets.icons.cartLarge2Linear, l10n.rewardsHow1),
      (
        Assets.icons.walletLinear,
        l10n.rewardsHow2(
          '${rewards.nextRewardPoints}',
          rewards.rewardValue.format(),
        ),
      ),
      (
        Assets.icons.usersGroupRoundedLinear,
        l10n.rewardsHow3('${rewards.referralPoints}'),
      ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSpacing.xl),
        Text(l10n.rewardsHowItWorks, style: AppTypography.titleMedium),
        const SizedBox(height: AppSpacing.md),
        for (final (icon, text) in steps)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: colors.brandSubtle,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: AppIcon(
                    icon,
                    size: AppSizes.iconSm,
                    color: colors.brand,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(child: Text(text, style: AppTypography.bodyMedium)),
              ],
            ),
          ),
      ],
    );
  }
}

class _ReferralCode extends StatelessWidget {
  const _ReferralCode({required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.rewardsReferralCode, style: AppTypography.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
            ),
            decoration: BoxDecoration(
              color: colors.surfaceMuted,
              borderRadius: AppRadii.xlAll,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    code,
                    style: AppTypography.headlineSmall.copyWith(
                      letterSpacing: 2,
                    ),
                  ),
                ),
                AppIconButton(
                  icon: Assets.icons.copyLinear,
                  onPressed: () async {
                    await Clipboard.setData(ClipboardData(text: code));
                    if (context.mounted) {
                      AppToast.show(context, l10n.rewardsCopied);
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          AppButton.secondary(
            label: l10n.rewardsShare,
            leading: AppIcon(Assets.icons.shareLinear, size: AppSizes.iconMd),
            onPressed: () => SharePlus.instance.share(
              ShareParams(text: l10n.rewardsShareText(code)),
            ),
          ),
        ],
      ),
    );
  }
}
