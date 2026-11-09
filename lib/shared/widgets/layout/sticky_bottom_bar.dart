import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/shared/widgets/layout/frosted.dart';

/// Sticky footer for primary actions ("Make payment", "Add for £5.40",
/// "Select this location"). Handles the home-indicator inset and an optional
/// blurred background when content scrolls behind it.
class StickyBottomBar extends StatelessWidget {
  const StickyBottomBar({
    required this.child,
    super.key,
    this.header,
    // Figma: full-width CTAs sit on a 20pt gutter (335pt wide).
    this.padding = const EdgeInsets.fromLTRB(
      AppSpacing.xl,
      AppSpacing.md,
      AppSpacing.xl,
      AppSpacing.md,
    ),
    this.showShadow = true,
    this.frosted = false,
    this.backgroundColor,
  });

  final Widget child;

  /// Optional row above the CTA (e.g. legal consent, quantity stepper).
  final Widget? header;
  final EdgeInsets padding;

  /// Top hairline + soft shadow separating the bar from scrolled content.
  final bool showShadow;
  final bool frosted;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    // viewPadding keeps the home-indicator inset while the keyboard is up;
    // padding covers hosts that only report padding.
    final bottomInset = math.max(
      MediaQuery.viewPaddingOf(context).bottom,
      MediaQuery.paddingOf(context).bottom,
    );
    final content = Padding(
      padding: padding.copyWith(
        bottom: padding.bottom + (bottomInset > 0 ? bottomInset - 8 : 0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (header != null) ...[
            header!,
            const SizedBox(height: AppSpacing.md),
          ],
          child,
        ],
      ),
    );

    final decorated = DecoratedBox(
      decoration: BoxDecoration(
        color: frosted ? Colors.transparent : backgroundColor ?? colors.surface,
        border: showShadow
            ? Border(top: BorderSide(color: colors.divider))
            : null,
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: AppShadows.ink.withValues(alpha: 0.05),
                  offset: const Offset(0, -6),
                  blurRadius: 16,
                ),
              ]
            : null,
      ),
      child: content,
    );

    if (!frosted) return decorated;
    return Frosted(
      tint: colors.surface.withValues(alpha: 0.88),
      child: decorated,
    );
  }
}
