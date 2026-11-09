import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/shared/widgets/buttons/pressable_scale.dart';
import 'package:tavada_eats/shared/widgets/feedback/bouncing_dots.dart';

enum AppButtonVariant {
  /// Orange filled — main CTA ("Continue", "Make payment").
  primary,

  /// White with grey outline ("Log in to your account", "Visit store").
  secondary,

  /// Black filled ("Continue with Apple").
  dark,

  /// Soft orange ("Filter", "Clear orders", "Call rider", "Redeem points").
  tonal,

  /// Light grey fill ("Reset", "Change", "Edit").
  neutral,

  /// Text only, brand coloured.
  ghost,
}

enum AppButtonSize {
  /// 56pt — full width CTAs.
  xl(AppSizes.buttonXl, 14, AppSpacing.xl),

  /// 44pt.
  lg(AppSizes.buttonLg, 14, AppSpacing.lg),

  /// 40pt.
  md(AppSizes.buttonMd, 14, AppSpacing.lg),

  /// 36pt — inline actions in cards.
  sm(AppSizes.buttonSm, 14, AppSpacing.md),

  /// 30pt — chips-like actions.
  xs(AppSizes.buttonXs, 12, AppSpacing.md);

  const AppButtonSize(this.height, this.fontSize, this.horizontalPadding);

  final double height;
  final double fontSize;
  final double horizontalPadding;
}

/// The single button component used across the app.
///
/// * Disabled when [onPressed] is null — the colour animates when it becomes
///   enabled (e.g. the "Continue" button lighting up once a form is valid).
/// * [isLoading] swaps the label for bouncing dots without changing size.
/// * [trailingLabel] renders the design's split layout:
///   `Make payment ............ £19.50`.
class AppButton extends StatelessWidget {
  const AppButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.xl,
    this.isLoading = false,
    this.isExpanded = true,
    this.leading,
    this.trailing,
    this.trailingLabel,
  });

  const AppButton.secondary({
    required this.label,
    required this.onPressed,
    super.key,
    this.size = AppButtonSize.xl,
    this.isLoading = false,
    this.isExpanded = true,
    this.leading,
    this.trailing,
    this.trailingLabel,
  }) : variant = AppButtonVariant.secondary;

  const AppButton.dark({
    required this.label,
    required this.onPressed,
    super.key,
    this.size = AppButtonSize.xl,
    this.isLoading = false,
    this.isExpanded = true,
    this.leading,
    this.trailing,
    this.trailingLabel,
  }) : variant = AppButtonVariant.dark;

  const AppButton.tonal({
    required this.label,
    required this.onPressed,
    super.key,
    this.size = AppButtonSize.sm,
    this.isLoading = false,
    this.isExpanded = false,
    this.leading,
    this.trailing,
    this.trailingLabel,
  }) : variant = AppButtonVariant.tonal;

  const AppButton.neutral({
    required this.label,
    required this.onPressed,
    super.key,
    this.size = AppButtonSize.sm,
    this.isLoading = false,
    this.isExpanded = false,
    this.leading,
    this.trailing,
    this.trailingLabel,
  }) : variant = AppButtonVariant.neutral;

  const AppButton.ghost({
    required this.label,
    required this.onPressed,
    super.key,
    this.size = AppButtonSize.sm,
    this.isLoading = false,
    this.isExpanded = false,
    this.leading,
    this.trailing,
    this.trailingLabel,
  }) : variant = AppButtonVariant.ghost;

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final bool isLoading;
  final bool isExpanded;
  final Widget? leading;
  final Widget? trailing;
  final String? trailingLabel;

  bool get _enabled => onPressed != null && !isLoading;

  @override
  Widget build(BuildContext context) {
    final style = _ButtonStyle.resolve(
      context.colors,
      variant,
      enabled: onPressed != null,
    );
    final textStyle = AppTypography.button.copyWith(
      fontSize: size.fontSize,
      color: style.foreground,
      height: 1.2,
    );

    final Widget content = AnimatedSwitcher(
      duration: AppDurations.fast,
      child: isLoading
          ? BouncingDots(
              key: const ValueKey('loading'),
              color: style.foreground,
              dotSize: size.height > 40 ? 7 : 5,
            )
          : _Label(
              key: const ValueKey('label'),
              label: label,
              trailingLabel: trailingLabel,
              leading: leading,
              trailing: trailing,
              style: textStyle,
              expanded: isExpanded,
            ),
    );

    return PressableScale(
      onTap: _enabled ? onPressed : null,
      enabled: _enabled,
      semanticLabel: label,
      child: AnimatedContainer(
        duration: AppDurations.normal,
        curve: AppCurves.standard,
        height: size.height,
        width: isExpanded ? double.infinity : null,
        padding: EdgeInsets.symmetric(horizontal: size.horizontalPadding),
        decoration: BoxDecoration(
          color: style.background,
          borderRadius: AppRadii.pillAll,
          border: style.border == null
              ? null
              : Border.all(color: style.border!),
        ),
        // Without an alignment the button hugs its label when not expanded
        // (an aligned container would stretch to the available width).
        alignment: isExpanded ? Alignment.center : null,
        child: IconTheme.merge(
          data: IconThemeData(color: style.foreground, size: AppSizes.iconMd),
          child: DefaultTextStyle.merge(style: textStyle, child: content),
        ),
      ),
    );
  }
}

class _Label extends StatelessWidget {
  const _Label({
    required this.label,
    required this.style,
    required this.expanded,
    super.key,
    this.trailingLabel,
    this.leading,
    this.trailing,
  });

  final String label;
  final String? trailingLabel;
  final Widget? leading;
  final Widget? trailing;
  final TextStyle style;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    if (trailingLabel != null) {
      return Row(
        children: [
          Expanded(
            child: Text(label, style: style, overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(width: AppSpacing.md),
          Text(trailingLabel!, style: style),
        ],
      );
    }
    return Row(
      mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leading != null) ...[leading!, const SizedBox(width: 10)],
        Flexible(
          child: Text(
            label,
            style: style,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        if (trailing != null) ...[const SizedBox(width: 6), trailing!],
      ],
    );
  }
}

class _ButtonStyle {
  const _ButtonStyle(this.background, this.foreground, [this.border]);

  factory _ButtonStyle.resolve(
    AppColorScheme c,
    AppButtonVariant variant, {
    required bool enabled,
  }) {
    switch (variant) {
      case AppButtonVariant.primary:
        return enabled
            ? _ButtonStyle(c.brand, c.onBrand)
            : _ButtonStyle(c.buttonDisabled, c.textInverse);
      case AppButtonVariant.secondary:
        return _ButtonStyle(
          c.surface,
          enabled ? c.textPrimary : c.textDisabled,
          c.borderStrong,
        );
      case AppButtonVariant.dark:
        return enabled
            ? _ButtonStyle(c.surfaceInverse, c.textInverse)
            : _ButtonStyle(c.buttonDisabled, c.textInverse);
      case AppButtonVariant.tonal:
        return _ButtonStyle(
          c.brandSubtle,
          enabled ? c.brand : c.textDisabled,
          c.brandMuted,
        );
      case AppButtonVariant.neutral:
        return _ButtonStyle(
          c.surfaceMuted,
          enabled ? c.textPrimary : c.textDisabled,
        );
      case AppButtonVariant.ghost:
        return _ButtonStyle(
          Colors.transparent,
          enabled ? c.brand : c.textDisabled,
        );
    }
  }

  final Color background;
  final Color foreground;
  final Color? border;
}
