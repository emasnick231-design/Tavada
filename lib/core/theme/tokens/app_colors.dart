import 'package:flutter/widgets.dart';

/// Raw colour palette, mirrored 1:1 from the Figma paint styles
/// ("Primary/600 main", "Gray/950 main", "Accent - Java/100", …).
///
/// Widgets should prefer the semantic roles in `AppColorScheme`
/// (`context.colors`) and only reach for the raw palette for one-off accents.
abstract final class AppColors {
  // Base
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF1A1A1B);
  static const transparent = Color(0x00000000);

  // Primary (brand orange) — Primary/600 is the main brand colour.
  static const primary50 = Color(0xFFFFF7EC);
  static const primary100 = Color(0xFFFFEDD3);
  static const primary200 = Color(0xFFFFD9A6);
  static const primary300 = Color(0xFFFFBB6E);
  static const primary400 = Color(0xFFFF9433);
  static const primary500 = Color(0xFFFF7309);
  static const primary600 = Color(0xFFE65200);
  static const primary700 = Color(0xFFCD3F02);
  static const primary800 = Color(0xFFA1320C);
  static const primary900 = Color(0xFF822B0D);
  static const primary950 = Color(0xFF461204);

  // Gray — Gray/950 is the main text colour.
  static const gray50 = Color(0xFFF5F5F6);
  static const gray100 = Color(0xFFE6E6E7);
  static const gray200 = Color(0xFFCFCFD2);
  static const gray300 = Color(0xFFAEAEB2);
  static const gray400 = Color(0xFF86878A);
  static const gray500 = Color(0xFF6B6C6F);
  static const gray600 = Color(0xFF5B5B5F);
  static const gray700 = Color(0xFF4D4D51);
  static const gray800 = Color(0xFF444546);
  static const gray900 = Color(0xFF3C3C3D);
  static const gray950 = Color(0xFF1A1A1B);

  // Sazerac (warm cream surfaces).
  static const sazerac50 = Color(0xFFFCF7F0);
  static const sazerac100 = Color(0xFFFFF3E0);
  static const sazerac200 = Color(0xFFFEDAAA);
  static const sazerac600 = Color(0xFFEA610C);

  // Gold (ratings, rewards).
  static const gold50 = Color(0xFFFFFAEB);
  static const gold100 = Color(0xFFFEF0C7);
  static const gold300 = Color(0xFFFEC84B);
  static const gold400 = Color(0xFFFDB022);
  static const gold500 = Color(0xFFF79009);
  static const gold700 = Color(0xFFB54708);

  // Success
  static const success25 = Color(0xFFF6FEF9);
  static const success50 = Color(0xFFECFDF3);
  static const success100 = Color(0xFFDCFAE6);
  static const success500 = Color(0xFF17B26A);
  static const success600 = Color(0xFF079455);
  static const success700 = Color(0xFF067647);

  // Error
  static const error25 = Color(0xFFFFFBFA);
  static const error50 = Color(0xFFFEF3F2);
  static const error100 = Color(0xFFFEE4E2);
  static const error300 = Color(0xFFFDA29B);
  static const error500 = Color(0xFFF04438);
  static const error600 = Color(0xFFD92D20);
  static const error700 = Color(0xFFB42318);

  // Accent — Java (teal): discount badges, "Good" ratings, promo banners.
  static const java50 = Color(0xFFECFDFF);
  static const java100 = Color(0xFFCDFAF4);
  static const java200 = Color(0xFF9CF3EA);
  static const java300 = Color(0xFF62E6DD);
  static const java500 = Color(0xFF1ABEBB);
  static const java600 = Color(0xFF118F90);
  static const java700 = Color(0xFF127173);
  static const java800 = Color(0xFF135A5C);
  static const java900 = Color(0xFF154A4C);
  static const java950 = Color(0xFF052B2E);

  // Accent — Cosmos (soft red/pink): "Free delivery" cards, promo banners.
  static const cosmos50 = Color(0xFFFDF4F3);
  static const cosmos100 = Color(0xFFFCE5E4);
  static const cosmos200 = Color(0xFFFBD8D6);
  static const cosmos300 = Color(0xFFF6AFAB);
  static const cosmos500 = Color(0xFFE35850);
  static const cosmos600 = Color(0xFFCF3B33);
  static const cosmos700 = Color(0xFFAE2E27);
  static const cosmos900 = Color(0xFF782924);
  static const cosmos950 = Color(0xFF41110E);

  // Accent — White Pointer (lavender): "First order deal" cards, gifts.
  static const lavender50 = Color(0xFFFBF8FC);
  static const lavender100 = Color(0xFFF5F0F7);
  static const lavender200 = Color(0xFFEDE4F0);
  static const lavender600 = Color(0xFF9D73AA);
  static const lavender700 = Color(0xFF865E92);
  static const lavender900 = Color(0xFF5B4162);

  // Brand gradients
  static const brandGradient = LinearGradient(
    colors: [primary500, primary700],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Peach wallet card gradient from the profile screen.
  static const walletGradient = LinearGradient(
    colors: [Color(0xFFFFC5A3), Color(0xFFFFE3CF), Color(0xFFFFF1E6)],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );
}
