import 'dart:ui' show ImageFilter;

import 'package:flutter/widgets.dart';
import 'package:tavada_eats/core/theme/tokens/tokens.dart';

/// Frosted-glass surface: blurs whatever is behind it and applies a tint.
class Frosted extends StatelessWidget {
  const Frosted({
    required this.child,
    super.key,
    this.sigma = AppBlur.lg,
    this.tint = const Color(0xD9FFFFFF),
    this.borderRadius = BorderRadius.zero,
  });

  final Widget child;
  final double sigma;
  final Color tint;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
        child: ColoredBox(color: tint, child: child),
      ),
    );
  }
}
