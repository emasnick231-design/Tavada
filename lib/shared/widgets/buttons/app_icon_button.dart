import 'dart:ui' show ImageFilter;

import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/buttons/pressable_scale.dart';
import 'package:tavada_eats/shared/widgets/media/app_icon.dart';

enum AppIconButtonVariant {
  /// White circle with a hairline border (back, search, trash in headers).
  outlined,

  /// White circle with a soft shadow (over imagery).
  elevated,

  /// Frosted glass circle (over imagery when content scrolls).
  glass,

  /// Light grey circle.
  muted,

  /// No background.
  plain,
}

/// Circular icon button matching the design's 40pt header buttons.
class AppIconButton extends StatelessWidget {
  const AppIconButton({
    required this.icon,
    required this.onPressed,
    super.key,
    this.variant = AppIconButtonVariant.outlined,
    this.size = AppSizes.circleButton,
    this.iconSize = AppSizes.iconMd,
    this.color,
    this.tooltip,
  });

  final SvgGenImage icon;
  final VoidCallback? onPressed;
  final AppIconButtonVariant variant;
  final double size;
  final double iconSize;
  final Color? color;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final iconWidget = AppIcon(
      icon,
      size: iconSize,
      color: onPressed == null
          ? colors.textDisabled
          : color ?? colors.textPrimary,
    );

    var body = switch (variant) {
      AppIconButtonVariant.glass => ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: AppBlur.md, sigmaY: AppBlur.md),
          child: Container(
            width: size,
            height: size,
            alignment: Alignment.center,
            color: colors.surface.withValues(alpha: 0.72),
            child: iconWidget,
          ),
        ),
      ),
      _ => Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: switch (variant) {
            AppIconButtonVariant.muted => colors.surfaceMuted,
            AppIconButtonVariant.plain => Colors.transparent,
            _ => colors.surface,
          },
          border: variant == AppIconButtonVariant.outlined
              ? Border.all(color: colors.border)
              : null,
          boxShadow: variant == AppIconButtonVariant.elevated
              ? AppShadows.floating
              : null,
        ),
        child: iconWidget,
      ),
    };

    body = PressableScale(
      onTap: onPressed,
      scale: 0.9,
      semanticLabel: tooltip,
      child: body,
    );
    return tooltip == null ? body : Tooltip(message: tooltip, child: body);
  }
}

/// Header back button. Pops when possible, otherwise goes home.
class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    this.onPressed,
    this.variant = AppIconButtonVariant.outlined,
    this.useCloseIcon = false,
  });

  final VoidCallback? onPressed;
  final AppIconButtonVariant variant;

  /// Shows "×" instead of "←" (modal screens such as product details).
  final bool useCloseIcon;

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      // Figma close button: plain bold "×" in the white circle.
      icon: useCloseIcon
          ? Assets.icons.closeBold
          : Assets.icons.arrowLeftLinear,
      variant: variant,
      tooltip: context.l10n.commonBack,
      onPressed:
          onPressed ??
          () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go(AppRoutes.home);
            }
          },
    );
  }
}

/// Inline text action: "Log in", "Resend code", "Forgot password?".
class AppLinkButton extends StatelessWidget {
  const AppLinkButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.underline = false,
    this.color,
    this.style,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool underline;
  final Color? color;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final resolved = (style ?? AppTypography.labelLarge).copyWith(
      color: onPressed == null
          ? colors.textDisabled
          : color ?? (underline ? colors.textPrimary : colors.brand),
      decoration: underline ? TextDecoration.underline : null,
      decorationColor: color ?? colors.textPrimary,
    );
    return PressableScale(
      onTap: onPressed,
      scale: 0.95,
      semanticLabel: label,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
        child: Text(label, style: resolved),
      ),
    );
  }
}
