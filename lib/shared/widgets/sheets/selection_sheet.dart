import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/shared/widgets/buttons/app_button.dart';
import 'package:tavada_eats/shared/widgets/inputs/selection_controls.dart';
import 'package:tavada_eats/shared/widgets/sheets/app_bottom_sheet.dart';

/// An option shown by [showSelectionSheet].
class SelectionOption<T> {
  const SelectionOption({
    required this.value,
    required this.label,
    this.subtitle,
  });

  final T value;
  final String label;
  final String? subtitle;
}

/// Checkbox/radio list in a bottom sheet ("Choose your favourite cuisines",
/// "Dietary", "Menu", "Hearing"…).
///
/// * Single select pops immediately with the tapped value.
/// * Multi select shows [applyLabel] and pops with the final set, or — like
///   the Figma cuisines/dietary sheets — applies each tap through
///   [onChanged] with no button.
/// Returns `null` when dismissed.
Future<Set<T>?> showSelectionSheet<T>({
  required BuildContext context,
  required String title,
  required List<SelectionOption<T>> options,
  Set<T> selected = const {},
  bool multiSelect = true,
  String? applyLabel,
  String? subtitle,
  ValueChanged<Set<T>>? onChanged,
  bool dense = false,
  bool showControls = true,
}) {
  return showAppBottomSheet<Set<T>>(
    context: context,
    // Dense sheets (Figma "Hearing") draw their own small header.
    title: dense ? null : title,
    showHandle: !dense,
    builder: (_) => _SelectionSheetBody<T>(
      options: options,
      initial: selected,
      multiSelect: multiSelect,
      applyLabel: applyLabel,
      subtitle: subtitle,
      onChanged: onChanged,
      denseTitle: dense ? title : null,
      showControls: showControls,
    ),
  );
}

class _SelectionSheetBody<T> extends StatefulWidget {
  const _SelectionSheetBody({
    required this.options,
    required this.initial,
    required this.multiSelect,
    this.applyLabel,
    this.subtitle,
    this.onChanged,
    this.denseTitle,
    this.showControls = true,
  });

  final List<SelectionOption<T>> options;
  final Set<T> initial;
  final bool multiSelect;
  final String? applyLabel;
  final String? subtitle;
  final ValueChanged<Set<T>>? onChanged;

  /// Compact variant: 14pt title + 11pt subtitle header, 12pt 44pt rows.
  final String? denseTitle;
  final bool showControls;

  @override
  State<_SelectionSheetBody<T>> createState() => _SelectionSheetBodyState<T>();
}

class _SelectionSheetBodyState<T> extends State<_SelectionSheetBody<T>> {
  late final Set<T> _selected = {...widget.initial};

  void _toggle(T value) {
    if (!widget.multiSelect) {
      Navigator.of(context).pop({value});
      return;
    }
    setState(() {
      _selected.contains(value)
          ? _selected.remove(value)
          : _selected.add(value);
    });
    widget.onChanged?.call({..._selected});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.denseTitle != null) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.gutter,
              AppSpacing.xl,
              AppSpacing.gutter,
              AppSpacing.lg,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.denseTitle!, style: AppTypography.labelLarge),
                if (widget.subtitle != null) ...[
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    widget.subtitle!,
                    style: AppTypography.caption.copyWith(fontSize: 11),
                  ),
                ],
              ],
            ),
          ),
          Container(height: AppSpacing.xs, color: context.colors.surfaceMuted),
        ] else if (widget.subtitle != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.xl,
              AppSpacing.md,
              AppSpacing.xl,
              0,
            ),
            child: Text(widget.subtitle!, style: AppTypography.caption),
          ),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
            itemCount: widget.options.length,
            itemBuilder: (context, i) {
              final option = widget.options[i];
              final dense = widget.denseTitle != null;
              return AppSelectionTile(
                title: option.label,
                subtitle: option.subtitle,
                isRadio: !widget.multiSelect,
                selected: _selected.contains(option.value),
                dense: dense,
                showControl: widget.showControls,
                padding: EdgeInsets.symmetric(
                  horizontal: dense ? AppSpacing.gutter : AppSpacing.xl,
                  vertical: dense ? AppSpacing.md : AppSpacing.lg,
                ),
                showDivider: i != widget.options.length - 1,
                onTap: () => _toggle(option.value),
              );
            },
          ),
        ),
        if (widget.multiSelect && widget.applyLabel != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.xl,
              AppSpacing.md,
              AppSpacing.xl,
              0,
            ),
            child: AppButton(
              label: widget.applyLabel!,
              onPressed: () => Navigator.of(context).pop(_selected),
            ),
          ),
      ],
    );
  }
}
