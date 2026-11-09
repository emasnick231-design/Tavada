import 'package:flutter_animate/flutter_animate.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/media/app_icon.dart';

/// Teal promo badge pinned on restaurant images ("Over 40% off").
class DiscountBadge extends StatelessWidget {
  const DiscountBadge({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: colors.accentTealSubtle,
        borderRadius: AppRadii.smAll,
        border: Border.all(color: AppColors.java800),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: AppColors.gold400,
              borderRadius: BorderRadius.circular(3),
            ),
            alignment: Alignment.center,
            child: AppIcon(
              Assets.icons.saleBold,
              size: 10,
              color: AppColors.white,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: AppTypography.badge.copyWith(color: colors.accentTealInk),
          ),
        ],
      ),
    );
  }
}

/// White "20 min" pill sitting on the corner of a restaurant image.
class TimePill extends StatelessWidget {
  const TimePill({required this.value, required this.unit, super.key});

  /// e.g. `20`
  final String value;

  /// e.g. `min`
  final String unit;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: AppRadii.pillAll,
        boxShadow: AppShadows.sm,
      ),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: value,
              style: AppTypography.titleSmall.copyWith(fontSize: 15),
            ),
            TextSpan(
              text: ' $unit',
              style: AppTypography.bodySmall.copyWith(
                color: colors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Small numeric badge (basket count) — pops when the value changes.
class CountBadge extends StatelessWidget {
  const CountBadge({required this.count, super.key, this.color});

  final int count;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (count <= 0) return const SizedBox.shrink();
    return Container(
          constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
          padding: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: color ?? context.colors.error,
            borderRadius: AppRadii.pillAll,
            border: Border.all(color: context.colors.surface, width: 1.5),
          ),
          alignment: Alignment.center,
          child: Text(
            count > 99 ? '99+' : '$count',
            style: AppTypography.labelSmall.copyWith(
              color: AppColors.white,
              fontSize: 9,
              height: 1.4,
            ),
          ),
        )
        .animate(key: ValueKey(count))
        .scale(
          begin: const Offset(0.4, 0.4),
          end: const Offset(1, 1),
          duration: AppDurations.normal,
          curve: AppCurves.spring,
        );
  }
}

/// Plain red notification dot.
class NotificationDot extends StatelessWidget {
  const NotificationDot({super.key, this.size = 8});

  final double size;

  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: context.colors.error,
      shape: BoxShape.circle,
      border: Border.all(color: context.colors.surface, width: 1.5),
    ),
  );
}

/// Compact status chip ("Order placed", "Closed", "Required").
class StatusPill extends StatelessWidget {
  const StatusPill({
    required this.label,
    super.key,
    this.background,
    this.foreground,
  });

  /// Dark pill used on order tracking.
  const StatusPill.dark({required this.label, super.key})
    : background = AppColors.gray950,
      foreground = AppColors.white;

  final String label;
  final Color? background;
  final Color? foreground;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return AnimatedContainer(
      duration: AppDurations.normal,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: 3,
      ),
      decoration: BoxDecoration(
        color: background ?? colors.surfaceMuted,
        borderRadius: AppRadii.smAll,
      ),
      child: AnimatedSwitcher(
        duration: AppDurations.normal,
        child: Text(
          label,
          key: ValueKey(label),
          style: AppTypography.labelMedium.copyWith(
            color: foreground ?? colors.textPrimary,
          ),
        ),
      ),
    );
  }
}
