import 'package:flutter/widgets.dart';

/// Elevation tokens. Values follow the "Shadow/*" effect styles in Figma
/// (Untitled UI scale, tinted with #101828).
abstract final class AppShadows {
  static const _ink = Color(0xFF101828);

  static const none = <BoxShadow>[];

  static const xs = [
    BoxShadow(color: Color(0x0D101828), offset: Offset(0, 1), blurRadius: 2),
  ];

  static const sm = [
    BoxShadow(color: Color(0x1A101828), offset: Offset(0, 1), blurRadius: 3),
    BoxShadow(color: Color(0x0F101828), offset: Offset(0, 1), blurRadius: 2),
  ];

  static const md = [
    BoxShadow(
      color: Color(0x1A101828),
      offset: Offset(0, 4),
      blurRadius: 8,
      spreadRadius: -2,
    ),
    BoxShadow(
      color: Color(0x0F101828),
      offset: Offset(0, 2),
      blurRadius: 4,
      spreadRadius: -2,
    ),
  ];

  static const lg = [
    BoxShadow(
      color: Color(0x14101828),
      offset: Offset(0, 12),
      blurRadius: 16,
      spreadRadius: -4,
    ),
    BoxShadow(
      color: Color(0x08101828),
      offset: Offset(0, 4),
      blurRadius: 6,
      spreadRadius: -2,
    ),
  ];

  static const xl = [
    BoxShadow(
      color: Color(0x14101828),
      offset: Offset(0, 20),
      blurRadius: 24,
      spreadRadius: -4,
    ),
    BoxShadow(
      color: Color(0x08101828),
      offset: Offset(0, 8),
      blurRadius: 8,
      spreadRadius: -4,
    ),
  ];

  /// Floating elements over imagery (time pills, image buttons).
  static const floating = [
    BoxShadow(color: Color(0x33000000), offset: Offset(0, 2), blurRadius: 8),
  ];

  /// Bottom sheets / modals.
  static const sheet = [
    BoxShadow(color: Color(0x3D000000), offset: Offset(0, 14), blurRadius: 29),
  ];

  /// Hairline under sticky headers (Figma uses a 1px #898A8D drop shadow).
  static const hairline = [
    BoxShadow(color: Color(0x1F898A8D), offset: Offset(0, 1)),
  ];

  /// Brand glow for primary CTAs.
  static List<BoxShadow> glow(Color color) => [
    BoxShadow(
      color: color.withValues(alpha: 0.28),
      offset: const Offset(0, 8),
      blurRadius: 20,
      spreadRadius: -6,
    ),
  ];

  static Color get ink => _ink;
}
