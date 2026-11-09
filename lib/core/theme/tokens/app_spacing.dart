import 'package:flutter/widgets.dart';

/// 4-pt spacing scale used for padding, gaps and margins.
abstract final class AppSpacing {
  static const double none = 0;
  static const double xxs = 2;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;
  static const double xxxl = 32;
  static const double huge = 40;
  static const double massive = 48;

  /// Horizontal page gutter (16pt in every Figma frame).
  static const double gutter = lg;

  /// Height of the grey band separating content sections.
  static const double sectionGap = sm;
}

/// Ready-made [EdgeInsets] built from [AppSpacing].
abstract final class AppInsets {
  static const page = EdgeInsets.symmetric(horizontal: AppSpacing.gutter);
  static const pageAll = EdgeInsets.all(AppSpacing.gutter);
  static const card = EdgeInsets.all(AppSpacing.md);
  static const listItem = EdgeInsets.symmetric(
    horizontal: AppSpacing.gutter,
    vertical: AppSpacing.md,
  );
  static const sheet = EdgeInsets.fromLTRB(
    AppSpacing.xl,
    AppSpacing.lg,
    AppSpacing.xl,
    AppSpacing.xxl,
  );
}
