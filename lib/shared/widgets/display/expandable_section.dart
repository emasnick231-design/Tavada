import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/buttons/pressable_scale.dart';
import 'package:tavada_eats/shared/widgets/media/app_icon.dart';

/// Collapsible section with a rotating chevron ("Delivery Info ⌄",
/// opening hours, "Hide selections ⌃").
class ExpandableSection extends StatefulWidget {
  const ExpandableSection({
    required this.header,
    required this.child,
    super.key,
    this.initiallyExpanded = false,
    this.expanded,
    this.onExpansionChanged,
    this.headerPadding = const EdgeInsets.symmetric(
      horizontal: AppSpacing.gutter,
      vertical: AppSpacing.lg,
    ),
    this.trailingLabel,
  });

  /// Title row content (usually a bold [Text]).
  final Widget header;
  final Widget child;
  final bool initiallyExpanded;

  /// Controlled mode when non-null.
  final bool? expanded;
  final ValueChanged<bool>? onExpansionChanged;
  final EdgeInsets headerPadding;

  /// Optional text before the chevron ("Hide selections").
  final String? trailingLabel;

  @override
  State<ExpandableSection> createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  late bool _expanded = widget.expanded ?? widget.initiallyExpanded;

  @override
  void didUpdateWidget(covariant ExpandableSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.expanded != null) _expanded = widget.expanded!;
  }

  void _toggle() {
    final next = !_expanded;
    if (widget.expanded == null) setState(() => _expanded = next);
    widget.onExpansionChanged?.call(next);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PressableScale(
          onTap: _toggle,
          scale: 0.99,
          child: Padding(
            padding: widget.headerPadding,
            child: Row(
              children: [
                Expanded(child: widget.header),
                if (widget.trailingLabel != null) ...[
                  Text(
                    widget.trailingLabel!,
                    style: AppTypography.labelMedium.copyWith(
                      color: colors.textPrimary,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                ],
                AnimatedRotation(
                  turns: _expanded ? 0.5 : 0,
                  duration: AppDurations.normal,
                  curve: AppCurves.emphasized,
                  child: AppIcon(
                    Assets.icons.altArrowDownLinear,
                    size: AppSizes.iconMd + 2,
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedSize(
          duration: AppDurations.normal,
          curve: AppCurves.emphasized,
          alignment: Alignment.topCenter,
          child: _expanded
              ? widget.child
              : const SizedBox(width: double.infinity),
        ),
      ],
    );
  }
}
