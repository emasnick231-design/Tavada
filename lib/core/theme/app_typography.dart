import 'package:flutter/painting.dart';
import 'package:tavada_eats/core/theme/tokens/app_colors.dart';

/// Typography scale extracted from the Figma file.
///
/// * UI copy uses **Plus Jakarta Sans** (Regular → ExtraBold).
/// * Brand display moments ("ALWAYS AFRICAN ANYWHERE") use **Protest Strike**.
///
/// Line heights are expressed as `height = lineHeight / fontSize` so they
/// match the Figma specs exactly (e.g. 14/20, 12/18).
abstract final class AppTypography {
  static const String fontFamily = 'PlusJakartaSans';
  static const String displayFontFamily = 'ProtestStrike';

  static TextStyle _style(
    double size,
    double lineHeight,
    FontWeight weight, {
    double letterSpacingPercent = 0,
    Color color = AppColors.gray950,
    FontStyle style = FontStyle.normal,
    String family = fontFamily,
  }) => TextStyle(
    fontFamily: family,
    fontSize: size,
    height: lineHeight / size,
    fontWeight: weight,
    fontStyle: style,
    letterSpacing: size * letterSpacingPercent / 100,
    color: color,
    leadingDistribution: TextLeadingDistribution.even,
  );

  // ── Brand display ─────────────────────────────────────────────────────────
  /// "ALWAYS AFRICAN ANYWHERE" — Protest Strike 46/44, -6%.
  static final TextStyle brandHero = _style(
    46,
    44,
    FontWeight.w400,
    letterSpacingPercent: -6,
    color: AppColors.white,
    family: displayFontFamily,
  );

  /// Smaller Protest Strike accent (wordmark, promo headlines) — 24/32.
  static final TextStyle brandTitle = _style(
    24,
    32,
    FontWeight.w400,
    family: displayFontFamily,
  );

  /// "Howfa naw!" — Plus Jakarta Sans ExtraBold Italic, -2%.
  static final TextStyle brandShout = _style(
    56,
    60,
    FontWeight.w800,
    letterSpacingPercent: -2,
    style: FontStyle.italic,
    color: AppColors.primary700,
  );

  // ── Display (large numerics: wallet, ETA, ratings) ────────────────────────
  static final TextStyle displayLarge = _style(
    48,
    60,
    FontWeight.w700,
    letterSpacingPercent: -2,
  );
  static final TextStyle displayMedium = _style(
    36,
    44,
    FontWeight.w700,
    letterSpacingPercent: -2,
  );
  static final TextStyle displaySmall = _style(30, 38, FontWeight.w800);

  // ── Headlines ─────────────────────────────────────────────────────────────
  static final TextStyle headlineLarge = _style(24, 32, FontWeight.w700);
  static final TextStyle headlineMedium = _style(20, 30, FontWeight.w700);
  static final TextStyle headlineSmall = _style(18, 28, FontWeight.w700);

  // ── Titles ────────────────────────────────────────────────────────────────
  static final TextStyle titleLarge = _style(16, 24, FontWeight.w700);
  static final TextStyle titleMedium = _style(16, 24, FontWeight.w600);
  static final TextStyle titleSmall = _style(14, 20, FontWeight.w700);

  // ── Body ──────────────────────────────────────────────────────────────────
  static final TextStyle bodyLarge = _style(16, 24, FontWeight.w400);
  static final TextStyle bodyMedium = _style(14, 20, FontWeight.w500);
  static final TextStyle bodySmall = _style(
    12,
    18,
    FontWeight.w500,
    color: AppColors.gray600,
  );

  // ── Labels ────────────────────────────────────────────────────────────────
  static final TextStyle labelLarge = _style(14, 20, FontWeight.w600);
  static final TextStyle labelMedium = _style(12, 18, FontWeight.w600);
  static final TextStyle labelSmall = _style(10, 18, FontWeight.w600);

  // ── Extras ────────────────────────────────────────────────────────────────
  /// Regular 14/20 secondary copy (descriptions, helper text).
  static final TextStyle paragraph = _style(
    14,
    20,
    FontWeight.w400,
    color: AppColors.gray600,
  );

  /// Regular 12/18 captions.
  static final TextStyle caption = _style(
    12,
    18,
    FontWeight.w400,
    color: AppColors.gray600,
  );

  /// Badges & pills ("Over 40% off") — SemiBold 11/18.
  static final TextStyle badge = _style(11, 18, FontWeight.w600);

  /// Button label (SemiBold 14/20 — every CTA in Figma).
  static final TextStyle button = _style(14, 20, FontWeight.w600);
}
