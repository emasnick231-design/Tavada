import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/theme/tokens/tokens.dart';
import 'package:tavada_eats/gen/assets.gen.dart';

/// Renders an SVG icon from `Assets.icons` (Solar icon set).
///
/// ```dart
/// AppIcon(Assets.icons.magniferLinear, size: 20, color: context.colors.textTertiary)
/// AppIcon.original(Assets.icons.logoGoogle) // keeps original colours
/// ```
class AppIcon extends StatelessWidget {
  const AppIcon(
    this.icon, {
    super.key,
    this.size = AppSizes.iconLg,
    this.color,
    this.semanticLabel,
  }) : _tint = true;

  /// Keeps the SVG's own colours (logos, flags, illustrations).
  const AppIcon.original(
    this.icon, {
    super.key,
    this.size = AppSizes.iconLg,
    this.semanticLabel,
  }) : color = null,
       _tint = false;

  final SvgGenImage icon;
  final double size;
  final Color? color;
  final String? semanticLabel;
  final bool _tint;

  @override
  Widget build(BuildContext context) {
    final tint =
        color ?? IconTheme.of(context).color ?? context.colors.textPrimary;
    return Semantics(
      label: semanticLabel,
      excludeSemantics: semanticLabel == null,
      child: icon.svg(
        width: size,
        height: size,
        colorFilter: _tint ? ColorFilter.mode(tint, BlendMode.srcIn) : null,
      ),
    );
  }
}
