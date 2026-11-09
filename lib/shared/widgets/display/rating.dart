import 'package:flutter_animate/flutter_animate.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/core/utils/haptics.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/buttons/pressable_scale.dart';
import 'package:tavada_eats/shared/widgets/media/app_icon.dart';

/// Rating tiers used for the "★ 4.8 Excellent" label colouring.
enum RatingTier {
  excellent,
  veryGood,
  good,
  fair;

  static RatingTier of(double rating) => switch (rating) {
    >= 4.5 => RatingTier.excellent,
    >= 3.0 => RatingTier.veryGood,
    >= 2.5 => RatingTier.good,
    _ => RatingTier.fair,
  };

  String label(AppLocalizations l10n) => switch (this) {
    RatingTier.excellent => l10n.ratingExcellent,
    RatingTier.veryGood => l10n.ratingVeryGood,
    RatingTier.good => l10n.ratingGood,
    RatingTier.fair => l10n.ratingFair,
  };

  Color color(BuildContext context) => switch (this) {
    RatingTier.excellent => context.colors.success,
    RatingTier.veryGood || RatingTier.good => context.colors.ratingGood,
    RatingTier.fair => context.colors.textSecondary,
  };
}

/// "★ 4.8 Excellent (101)" — the rating line on restaurant cards.
class RatingLabel extends StatelessWidget {
  const RatingLabel({
    required this.rating,
    super.key,
    this.count,
    this.showTier = true,
    this.starSize = 14,
  });

  final double rating;
  final int? count;
  final bool showTier;
  final double starSize;

  @override
  Widget build(BuildContext context) {
    final tier = RatingTier.of(rating);
    final color = tier.color(context);
    final base = AppTypography.bodySmall.copyWith(color: color);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppIcon(Assets.icons.starBold, size: starSize, color: color),
        const SizedBox(width: 4),
        Flexible(
          child: Text.rich(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            TextSpan(
              children: [
                TextSpan(
                  text: showTier
                      ? '${rating.toStringAsFixed(1)} ${tier.label(context.l10n)}'
                      : rating.toStringAsFixed(1),
                ),
                if (count != null)
                  TextSpan(
                    text: ' ($count)',
                    style: base.copyWith(color: context.colors.textSecondary),
                  ),
              ],
            ),
            style: base,
          ),
        ),
      ],
    );
  }
}

/// Read-only star row with fractional fill (reviews header, comments).
class RatingStars extends StatelessWidget {
  const RatingStars({
    required this.rating,
    super.key,
    this.size = 16,
    this.spacing = 2,
  });

  final double rating;
  final double size;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (i) {
        final fill = (rating - i).clamp(0.0, 1.0);
        return Padding(
          padding: EdgeInsets.only(right: i == 4 ? 0 : spacing),
          child: SizedBox(
            width: size,
            height: size,
            child: Stack(
              children: [
                AppIcon(
                  Assets.icons.starBold,
                  size: size,
                  color: colors.border,
                ),
                ClipRect(
                  clipper: _FractionClipper(fill),
                  child: AppIcon(
                    Assets.icons.starBold,
                    size: size,
                    color: colors.rating,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class _FractionClipper extends CustomClipper<Rect> {
  _FractionClipper(this.fraction);

  final double fraction;

  @override
  Rect getClip(Size size) =>
      Rect.fromLTWH(0, 0, size.width * fraction, size.height);

  @override
  bool shouldReclip(_FractionClipper old) => old.fraction != fraction;
}

/// Tappable 5-star input with a springy pop on the selected star
/// ("Rate your delivery by Hassan").
class RatingInput extends StatelessWidget {
  const RatingInput({
    required this.value,
    required this.onChanged,
    super.key,
    this.size = 32,
    this.spacing = 18,
  });

  final int value;
  final ValueChanged<int> onChanged;
  final double size;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (i) {
        final active = i < value;
        Widget star = AppIcon(
          Assets.icons.starBold,
          size: size,
          color: active ? colors.rating : colors.border,
        );
        if (active) {
          star = star
              .animate(key: ValueKey('star-$i-$value'), delay: (i * 40).ms)
              .scale(
                begin: const Offset(0.6, 0.6),
                end: const Offset(1, 1),
                duration: AppDurations.slow,
                curve: AppCurves.bounce,
              );
        }
        return Padding(
          padding: EdgeInsets.only(right: i == 4 ? 0 : spacing),
          child: PressableScale(
            scale: 0.85,
            haptic: false,
            onTap: () {
              Haptics.medium();
              onChanged(i + 1);
            },
            child: star,
          ),
        );
      }),
    );
  }
}
