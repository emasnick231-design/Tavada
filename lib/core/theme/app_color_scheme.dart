import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/theme/tokens/app_colors.dart';

/// Semantic colour roles exposed as a [ThemeExtension].
///
/// Access with `context.colors.textPrimary`. Keeping roles semantic means a
/// dark theme only needs a second instance of this class.
@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  const AppColorScheme({
    required this.brand,
    required this.brandStrong,
    required this.brandSubtle,
    required this.brandMuted,
    required this.onBrand,
    required this.background,
    required this.surface,
    required this.surfaceMuted,
    required this.surfaceWarm,
    required this.surfaceInverse,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textDisabled,
    required this.textInverse,
    required this.textBrand,
    required this.border,
    required this.borderStrong,
    required this.borderFocus,
    required this.divider,
    required this.success,
    required this.successSubtle,
    required this.error,
    required this.errorSubtle,
    required this.warning,
    required this.warningSubtle,
    required this.rating,
    required this.ratingGood,
    required this.accentTeal,
    required this.accentTealSubtle,
    required this.accentTealInk,
    required this.accentPink,
    required this.accentPinkSubtle,
    required this.accentLavender,
    required this.accentLavenderSubtle,
    required this.buttonDisabled,
    required this.scrim,
    required this.skeletonBase,
    required this.skeletonHighlight,
  });

  static const light = AppColorScheme(
    brand: AppColors.primary600,
    brandStrong: AppColors.primary800,
    brandSubtle: AppColors.primary50,
    brandMuted: AppColors.primary100,
    onBrand: AppColors.white,
    background: AppColors.white,
    surface: AppColors.white,
    surfaceMuted: AppColors.gray50,
    surfaceWarm: AppColors.sazerac100,
    surfaceInverse: AppColors.gray950,
    textPrimary: AppColors.gray950,
    textSecondary: AppColors.gray600,
    textTertiary: AppColors.gray400,
    textDisabled: AppColors.gray300,
    textInverse: AppColors.white,
    textBrand: AppColors.primary600,
    border: AppColors.gray100,
    borderStrong: AppColors.gray200,
    borderFocus: AppColors.sazerac200,
    divider: AppColors.gray100,
    success: AppColors.success500,
    successSubtle: AppColors.success50,
    error: AppColors.error600,
    errorSubtle: AppColors.error50,
    warning: AppColors.gold500,
    warningSubtle: AppColors.primary50,
    rating: AppColors.gold400,
    ratingGood: AppColors.java600,
    accentTeal: AppColors.java600,
    accentTealSubtle: AppColors.java100,
    accentTealInk: AppColors.java950,
    accentPink: AppColors.cosmos600,
    accentPinkSubtle: AppColors.cosmos100,
    accentLavender: AppColors.lavender600,
    accentLavenderSubtle: AppColors.lavender100,
    buttonDisabled: AppColors.gray200,
    scrim: Color(0x661A1A1B),
    skeletonBase: AppColors.gray50,
    skeletonHighlight: AppColors.gray100,
  );

  final Color brand;
  final Color brandStrong;
  final Color brandSubtle;
  final Color brandMuted;
  final Color onBrand;
  final Color background;
  final Color surface;
  final Color surfaceMuted;
  final Color surfaceWarm;
  final Color surfaceInverse;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textDisabled;
  final Color textInverse;
  final Color textBrand;
  final Color border;
  final Color borderStrong;
  final Color borderFocus;
  final Color divider;
  final Color success;
  final Color successSubtle;
  final Color error;
  final Color errorSubtle;
  final Color warning;
  final Color warningSubtle;
  final Color rating;
  final Color ratingGood;
  final Color accentTeal;
  final Color accentTealSubtle;
  final Color accentTealInk;
  final Color accentPink;
  final Color accentPinkSubtle;
  final Color accentLavender;
  final Color accentLavenderSubtle;
  final Color buttonDisabled;
  final Color scrim;
  final Color skeletonBase;
  final Color skeletonHighlight;

  @override
  AppColorScheme copyWith({Color? brand, Color? textPrimary}) => AppColorScheme(
    brand: brand ?? this.brand,
    brandStrong: brandStrong,
    brandSubtle: brandSubtle,
    brandMuted: brandMuted,
    onBrand: onBrand,
    background: background,
    surface: surface,
    surfaceMuted: surfaceMuted,
    surfaceWarm: surfaceWarm,
    surfaceInverse: surfaceInverse,
    textPrimary: textPrimary ?? this.textPrimary,
    textSecondary: textSecondary,
    textTertiary: textTertiary,
    textDisabled: textDisabled,
    textInverse: textInverse,
    textBrand: textBrand,
    border: border,
    borderStrong: borderStrong,
    borderFocus: borderFocus,
    divider: divider,
    success: success,
    successSubtle: successSubtle,
    error: error,
    errorSubtle: errorSubtle,
    warning: warning,
    warningSubtle: warningSubtle,
    rating: rating,
    ratingGood: ratingGood,
    accentTeal: accentTeal,
    accentTealSubtle: accentTealSubtle,
    accentTealInk: accentTealInk,
    accentPink: accentPink,
    accentPinkSubtle: accentPinkSubtle,
    accentLavender: accentLavender,
    accentLavenderSubtle: accentLavenderSubtle,
    buttonDisabled: buttonDisabled,
    scrim: scrim,
    skeletonBase: skeletonBase,
    skeletonHighlight: skeletonHighlight,
  );

  @override
  AppColorScheme lerp(covariant AppColorScheme? other, double t) {
    if (other == null) return this;
    Color l(Color a, Color b) => Color.lerp(a, b, t)!;
    return AppColorScheme(
      brand: l(brand, other.brand),
      brandStrong: l(brandStrong, other.brandStrong),
      brandSubtle: l(brandSubtle, other.brandSubtle),
      brandMuted: l(brandMuted, other.brandMuted),
      onBrand: l(onBrand, other.onBrand),
      background: l(background, other.background),
      surface: l(surface, other.surface),
      surfaceMuted: l(surfaceMuted, other.surfaceMuted),
      surfaceWarm: l(surfaceWarm, other.surfaceWarm),
      surfaceInverse: l(surfaceInverse, other.surfaceInverse),
      textPrimary: l(textPrimary, other.textPrimary),
      textSecondary: l(textSecondary, other.textSecondary),
      textTertiary: l(textTertiary, other.textTertiary),
      textDisabled: l(textDisabled, other.textDisabled),
      textInverse: l(textInverse, other.textInverse),
      textBrand: l(textBrand, other.textBrand),
      border: l(border, other.border),
      borderStrong: l(borderStrong, other.borderStrong),
      borderFocus: l(borderFocus, other.borderFocus),
      divider: l(divider, other.divider),
      success: l(success, other.success),
      successSubtle: l(successSubtle, other.successSubtle),
      error: l(error, other.error),
      errorSubtle: l(errorSubtle, other.errorSubtle),
      warning: l(warning, other.warning),
      warningSubtle: l(warningSubtle, other.warningSubtle),
      rating: l(rating, other.rating),
      ratingGood: l(ratingGood, other.ratingGood),
      accentTeal: l(accentTeal, other.accentTeal),
      accentTealSubtle: l(accentTealSubtle, other.accentTealSubtle),
      accentTealInk: l(accentTealInk, other.accentTealInk),
      accentPink: l(accentPink, other.accentPink),
      accentPinkSubtle: l(accentPinkSubtle, other.accentPinkSubtle),
      accentLavender: l(accentLavender, other.accentLavender),
      accentLavenderSubtle: l(
        accentLavenderSubtle,
        other.accentLavenderSubtle,
      ),
      buttonDisabled: l(buttonDisabled, other.buttonDisabled),
      scrim: l(scrim, other.scrim),
      skeletonBase: l(skeletonBase, other.skeletonBase),
      skeletonHighlight: l(skeletonHighlight, other.skeletonHighlight),
    );
  }
}
