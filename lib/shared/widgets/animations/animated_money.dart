import 'package:flutter/widgets.dart';
import 'package:tavada_eats/core/models/money.dart';
import 'package:tavada_eats/core/theme/tokens/tokens.dart';

/// Counts smoothly between amounts when [value] changes ("Add for £10.82",
/// wallet balance, totals).
class AnimatedMoney extends StatelessWidget {
  const AnimatedMoney({
    required this.value,
    super.key,
    this.style,
    this.duration = AppDurations.slow,
    this.prefix = '',
  });

  final Money value;
  final TextStyle? style;
  final Duration duration;
  final String prefix;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(end: value.minor.toDouble()),
      duration: duration,
      curve: Curves.easeOutCubic,
      builder: (context, minor, _) => Text(
        '$prefix${Money(minor.round(), currency: value.currency).format()}',
        style: style,
      ),
    );
  }
}

/// Integer counter with the same easing (points, item counts).
class AnimatedCount extends StatelessWidget {
  const AnimatedCount({
    required this.value,
    super.key,
    this.style,
    this.suffix = '',
  });

  final int value;
  final TextStyle? style;
  final String suffix;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(end: value.toDouble()),
      duration: AppDurations.slower,
      curve: Curves.easeOutCubic,
      builder: (context, v, _) => Text('${v.round()}$suffix', style: style),
    );
  }
}
