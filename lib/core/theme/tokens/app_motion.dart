import 'package:flutter/animation.dart';

/// Motion tokens: durations and curves used across transitions and
/// micro-interactions. Keep motion consistent by never hard-coding these.
abstract final class AppDurations {
  static const instant = Duration(milliseconds: 100);
  static const fast = Duration(milliseconds: 180);
  static const normal = Duration(milliseconds: 280);
  static const slow = Duration(milliseconds: 420);
  static const slower = Duration(milliseconds: 650);
  static const page = Duration(milliseconds: 380);
  static const pageReverse = Duration(milliseconds: 320);

  /// Delay between items of a staggered list entrance.
  static const stagger = Duration(milliseconds: 45);

  /// Minimum time a skeleton stays on screen to avoid flicker.
  static const minSkeleton = Duration(milliseconds: 350);
}

abstract final class AppCurves {
  static const Curve standard = Curves.easeOutCubic;
  static const Curve emphasized = Cubic(0.2, 0, 0, 1);
  static const Curve decelerate = Cubic(0.05, 0.7, 0.1, 1);
  static const Curve accelerate = Cubic(0.3, 0, 0.8, 0.15);
  static const Curve spring = Curves.easeOutBack;
  static const Curve bounce = Curves.elasticOut;
}
