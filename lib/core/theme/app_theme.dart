import 'package:cupertino_ui/cupertino_ui.dart'
    show CupertinoPageTransitionsBuilder;
import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tavada_eats/core/theme/app_color_scheme.dart';
import 'package:tavada_eats/core/theme/app_typography.dart';
import 'package:tavada_eats/core/theme/tokens/tokens.dart';

/// Builds the app [ThemeData] from design tokens.
abstract final class AppTheme {
  static ThemeData get light {
    const semantic = AppColorScheme.light;
    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: AppColors.primary600,
        ).copyWith(
          primary: AppColors.primary600,
          onPrimary: AppColors.white,
          primaryContainer: AppColors.primary50,
          onPrimaryContainer: AppColors.primary900,
          secondary: AppColors.gray950,
          onSecondary: AppColors.white,
          tertiary: AppColors.java600,
          surface: AppColors.white,
          onSurface: AppColors.gray950,
          onSurfaceVariant: AppColors.gray600,
          surfaceContainerLowest: AppColors.white,
          surfaceContainerLow: AppColors.gray50,
          surfaceContainer: AppColors.gray50,
          surfaceContainerHigh: AppColors.gray100,
          outline: AppColors.gray200,
          outlineVariant: AppColors.gray100,
          error: AppColors.error600,
          onError: AppColors.white,
          scrim: AppColors.gray950,
          shadow: AppShadows.ink,
        );

    final textTheme = TextTheme(
      displayLarge: AppTypography.displayLarge,
      displayMedium: AppTypography.displayMedium,
      displaySmall: AppTypography.displaySmall,
      headlineLarge: AppTypography.headlineLarge,
      headlineMedium: AppTypography.headlineMedium,
      headlineSmall: AppTypography.headlineSmall,
      titleLarge: AppTypography.titleLarge,
      titleMedium: AppTypography.titleMedium,
      titleSmall: AppTypography.titleSmall,
      bodyLarge: AppTypography.bodyLarge,
      bodyMedium: AppTypography.bodyMedium,
      bodySmall: AppTypography.bodySmall,
      labelLarge: AppTypography.labelLarge,
      labelMedium: AppTypography.labelMedium,
      labelSmall: AppTypography.labelSmall,
    );

    const inputBorder = OutlineInputBorder(
      borderRadius: AppRadii.mdAll,
      borderSide: BorderSide(color: Colors.transparent),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,
      fontFamily: AppTypography.fontFamily,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      scaffoldBackgroundColor: semantic.background,
      canvasColor: semantic.background,
      splashFactory: InkSparkle.splashFactory,
      highlightColor: Colors.transparent,
      splashColor: AppColors.primary600.withValues(alpha: 0.06),
      visualDensity: VisualDensity.standard,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      extensions: const [semantic],
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: semantic.surface,
        surfaceTintColor: Colors.transparent,
        foregroundColor: semantic.textPrimary,
        titleTextStyle: AppTypography.titleMedium,
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: semantic.divider,
        thickness: 1,
        space: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: semantic.surfaceMuted,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md + 2,
          vertical: AppSpacing.md,
        ),
        hintStyle: AppTypography.bodyMedium.copyWith(
          color: semantic.textTertiary,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: AppTypography.bodyMedium.copyWith(
          color: semantic.textSecondary,
        ),
        errorStyle: AppTypography.bodySmall.copyWith(color: semantic.error),
        border: inputBorder,
        enabledBorder: inputBorder,
        disabledBorder: inputBorder,
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadii.mdAll,
          borderSide: BorderSide(color: semantic.borderFocus),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: AppRadii.mdAll,
          borderSide: BorderSide(color: AppColors.error300),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppRadii.mdAll,
          borderSide: BorderSide(color: semantic.error),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: semantic.brand,
        selectionColor: AppColors.primary200,
        selectionHandleColor: semantic.brand,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: semantic.brand,
        linearTrackColor: semantic.surfaceMuted,
      ),
      checkboxTheme: CheckboxThemeData(
        shape: const RoundedRectangleBorder(borderRadius: AppRadii.smAll),
        side: BorderSide(color: semantic.borderStrong, width: 1.25),
        fillColor: const WidgetStatePropertyAll(Colors.transparent),
        checkColor: WidgetStatePropertyAll(semantic.brand),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? semantic.brand
              : semantic.borderStrong,
        ),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: semantic.textPrimary,
        inactiveTrackColor: semantic.border,
        thumbColor: semantic.surface,
        overlayColor: semantic.brand.withValues(alpha: 0.08),
        trackHeight: 6,
        valueIndicatorColor: semantic.surfaceInverse,
        valueIndicatorTextStyle: AppTypography.labelMedium.copyWith(
          color: semantic.textInverse,
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        modalElevation: 0,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: semantic.surface,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(borderRadius: AppRadii.xxxlAll),
        titleTextStyle: AppTypography.headlineSmall,
        contentTextStyle: AppTypography.paragraph,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: semantic.surfaceInverse,
        contentTextStyle: AppTypography.bodyMedium.copyWith(
          color: semantic.textInverse,
        ),
        shape: const RoundedRectangleBorder(borderRadius: AppRadii.xlAll),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: semantic.surfaceInverse,
          borderRadius: AppRadii.mdAll,
        ),
        textStyle: AppTypography.bodySmall.copyWith(
          color: semantic.textInverse,
        ),
        padding: const EdgeInsets.all(AppSpacing.md),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }

  /// Shimmer configuration shared by every skeleton in the app.
  static SkeletonizerConfigData get skeleton => SkeletonizerConfigData(
    effectResolver: (_) => const ShimmerEffect(
      baseColor: AppColors.gray50,
      highlightColor: AppColors.gray100,
      duration: Duration(milliseconds: 1300),
    ),
    textBorderRadius: const TextBoneBorderRadius(AppRadii.xsAll),
    justifyMultiLineText: false,
    enableSwitchAnimation: true,
  );
}
