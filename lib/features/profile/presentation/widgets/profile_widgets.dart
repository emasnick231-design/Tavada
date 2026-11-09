import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/models/money.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/features/profile/domain/entities/account_overview.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Peach gradient wallet card with the balance and actions.
class WalletCard extends StatelessWidget {
  const WalletCard({required this.balance, super.key});

  final Money balance;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    // Figma: peach→salmon gradient with faint diagonal stripes.
    return Container(
      decoration: const BoxDecoration(
        borderRadius: AppRadii.xxxlAll,
        gradient: AppColors.walletGradient,
      ),
      clipBehavior: Clip.antiAlias,
      child: CustomPaint(
        painter: const _WalletStripesPainter(),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      color: AppColors.gold50,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: AppIcon(
                      Assets.icons.boltBold,
                      size: AppSizes.iconXs,
                      color: AppColors.primary400,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    l10n.profileWalletBalance,
                    style: AppTypography.labelMedium,
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.xs),
              AnimatedMoney(value: balance, style: AppTypography.displaySmall),
              const SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  Expanded(
                    child: _CardButton(
                      label: l10n.profileSeeActivity,
                      onTap: () => context.push(AppRoutes.walletActivity),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: _CardButton(
                      label: l10n.profileAddMoney,
                      filled: true,
                      onTap: () => context.push(AppRoutes.addMoney),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WalletStripesPainter extends CustomPainter {
  const _WalletStripesPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = AppColors.white.withValues(alpha: 0.12);
    const band = 26.0;
    for (var x = -size.height; x < size.width; x += band * 2.4) {
      canvas.drawPath(
        Path()
          ..moveTo(x, size.height)
          ..lineTo(x + band, size.height)
          ..lineTo(x + band + size.height, 0)
          ..lineTo(x + size.height, 0)
          ..close(),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_WalletStripesPainter oldDelegate) => false;
}

class _CardButton extends StatelessWidget {
  const _CardButton({
    required this.label,
    required this.onTap,
    this.filled = false,
  });

  final String label;
  final VoidCallback onTap;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: onTap,
      child: Container(
        height: AppSizes.buttonMd,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: filled ? colors.brand : colors.surface,
          borderRadius: AppRadii.pillAll,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: AppTypography.labelLarge.copyWith(
                color: filled ? colors.onBrand : colors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// "90 pts more to next reward" progress + redeem / refer.
class RewardsProgressCard extends StatelessWidget {
  const RewardsProgressCard({
    required this.rewards,
    required this.onRedeem,
    super.key,
    this.isRedeeming = false,
  });

  final RewardsSummary rewards;
  final VoidCallback? onRedeem;
  final bool isRedeeming;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final small = AppTypography.bodySmall.copyWith(color: colors.textPrimary);
    final bold = small.copyWith(fontWeight: FontWeight.w700);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: l10n.profilePointsToNext(
                        '${rewards.pointsToNextReward}',
                      ),
                      style: bold,
                    ),
                    TextSpan(text: l10n.profilePointsToNextSuffix),
                  ],
                ),
                style: small,
              ),
              const SizedBox(height: AppSpacing.sm),
              ClipRRect(
                borderRadius: AppRadii.pillAll,
                child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: rewards.progress),
                  duration: AppDurations.slower,
                  curve: AppCurves.emphasized,
                  builder: (_, v, _) => LinearProgressIndicator(
                    value: v,
                    minHeight: 6,
                    color: colors.success,
                    backgroundColor: colors.surfaceMuted,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                l10n.profileEarnReward(
                  // "£5", like Figma, for whole amounts.
                  rewards.rewardValue.format(
                    decimalDigits: rewards.rewardValue.minor % 100 == 0 ? 0 : 2,
                  ),
                  '${rewards.nextRewardPoints}',
                ),
                style: small,
              ),
              const SizedBox(height: AppSpacing.md),
              AppButton.tonal(
                label: l10n.profileRedeemPoints,
                isExpanded: true,
                isLoading: isRedeeming,
                onPressed: onRedeem,
              ),
            ],
          ),
        ),
        const SizedBox(width: AppSpacing.lg),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Assets.images.illustrations.giftBox.image(height: 72),
              const SizedBox(height: AppSpacing.sm),
              Text(
                l10n.profileReferFriend('${rewards.referralPoints}'),
                textAlign: TextAlign.right,
                style: small,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Icon + label + chevron row used across the account screens.
class SettingsRow extends StatelessWidget {
  const SettingsRow({
    required this.label,
    super.key,
    this.icon,
    this.onTap,
    this.trailing,
    this.subtitle,
    this.color,
    this.showDivider = true,
    this.verticalPadding = AppSpacing.lg,
  });

  final String label;
  final SvgGenImage? icon;
  final VoidCallback? onTap;
  final Widget? trailing;
  final String? subtitle;
  final Color? color;
  final bool showDivider;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        decoration: BoxDecoration(
          border: showDivider
              ? Border(bottom: BorderSide(color: colors.divider))
              : null,
        ),
        child: Row(
          children: [
            if (icon != null) ...[
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: colors.border),
                ),
                alignment: Alignment.center,
                child: AppIcon(
                  icon!,
                  size: AppSizes.iconSm,
                  color: color ?? colors.textPrimary,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: AppTypography.bodyMedium.copyWith(color: color),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: AppTypography.bodySmall.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                ],
              ),
            ),
            trailing ??
                AppIcon(
                  Assets.icons.altArrowRightLinear,
                  size: AppSizes.iconMd,
                  color: colors.textSecondary,
                ),
          ],
        ),
      ),
    );
  }
}

/// Back button + bold title + supporting copy, like the auth screens.
class AccountFormScaffold extends StatelessWidget {
  const AccountFormScaffold({
    required this.title,
    required this.children,
    super.key,
    this.subtitle,
    this.largeTitle = false,
  });

  final String title;
  final String? subtitle;
  final List<Widget> children;

  /// 24pt title (help centre) instead of 20pt.
  final bool largeTitle;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
            Text(
              title,
              style: largeTitle
                  ? AppTypography.headlineLarge
                  : AppTypography.headlineMedium,
            ).entrance(),
            if (subtitle != null) ...[
              const SizedBox(height: AppSpacing.xs),
              Text(
                subtitle!,
                style: AppTypography.paragraph,
              ).entrance(index: 1),
            ],
            const SizedBox(height: AppSpacing.lg),
            // Figma: rows, fields and CTAs sit on a 20pt gutter.
            for (var i = 0; i < children.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
                child: children[i].entrance(index: i + 2, offsetY: 0.04),
              ),
          ],
        ),
      ),
    );
  }
}
