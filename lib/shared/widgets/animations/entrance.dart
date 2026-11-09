import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tavada_eats/core/theme/tokens/tokens.dart';

extension EntranceAnimationX on Widget {
  /// Fade + slide-up entrance. Pass the item [index] inside lists for a
  /// pleasant stagger (capped so long lists don't wait forever).
  ///
  /// ```dart
  /// itemBuilder: (_, i) => RestaurantCard(...).entrance(index: i)
  /// ```
  Widget entrance({
    int index = 0,
    Duration delay = Duration.zero,
    double offsetY = 0.08,
    Duration duration = AppDurations.slow,
  }) {
    final stagger = AppDurations.stagger * index.clamp(0, 10);
    return animate(delay: delay + stagger)
        .fadeIn(duration: duration, curve: AppCurves.standard)
        .slideY(
          begin: offsetY,
          end: 0,
          duration: duration,
          curve: AppCurves.emphasized,
        );
  }

  /// Horizontal variant for rails (cards slide in from the right).
  Widget entranceX({int index = 0, double offsetX = 0.12}) {
    return animate(delay: AppDurations.stagger * index.clamp(0, 8))
        .fadeIn(duration: AppDurations.slow)
        .slideX(
          begin: offsetX,
          end: 0,
          duration: AppDurations.slow,
          curve: AppCurves.emphasized,
        );
  }

  /// Springy pop-in (badges, success icons).
  Widget popIn({Duration delay = Duration.zero}) => animate(delay: delay)
      .fadeIn(duration: AppDurations.fast)
      .scale(
        begin: const Offset(0.6, 0.6),
        end: const Offset(1, 1),
        duration: AppDurations.slow,
        curve: AppCurves.spring,
      );
}
