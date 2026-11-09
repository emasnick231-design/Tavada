import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/buttons/pressable_scale.dart';
import 'package:tavada_eats/shared/widgets/media/app_icon.dart';

/// Hero tag shared by the home search bar and the search screen field so the
/// bar morphs between screens.
const searchFieldHeroTag = 'app-search-field';

/// Pill-shaped search input.
///
/// Use [readOnly] + [onTap] for the home header (navigates to search) and the
/// editable mode on the search screen. [leading] replaces the magnifier, e.g.
/// with a back arrow.
class AppSearchField extends StatefulWidget {
  const AppSearchField({
    super.key,
    this.controller,
    this.focusNode,
    this.hint,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.onClear,
    this.readOnly = false,
    this.autofocus = false,
    this.leading,
    this.heroTag = searchFieldHeroTag,
    this.textInputAction = TextInputAction.search,
    this.outlineWhenFocused = false,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hint;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final VoidCallback? onClear;
  final bool readOnly;
  final bool autofocus;
  final Widget? leading;
  final Object? heroTag;
  final TextInputAction textInputAction;

  /// White fill + Sazerac/200 outline while focused (Figma address search);
  /// otherwise the pill stays grey with no border.
  final bool outlineWhenFocused;

  @override
  State<AppSearchField> createState() => _AppSearchFieldState();
}

class _AppSearchFieldState extends State<AppSearchField> {
  late final TextEditingController _controller =
      widget.controller ?? TextEditingController();
  late final FocusNode _focusNode = widget.focusNode ?? FocusNode();
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_rebuild);
    _focusNode.addListener(_onFocus);
  }

  void _rebuild() => setState(() {});

  void _onFocus() {
    if (_focused != _focusNode.hasFocus) {
      setState(() => _focused = _focusNode.hasFocus);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_rebuild);
    _focusNode.removeListener(_onFocus);
    if (widget.controller == null) _controller.dispose();
    if (widget.focusNode == null) _focusNode.dispose();
    super.dispose();
  }

  void _clear() {
    _controller.clear();
    widget.onChanged?.call('');
    widget.onClear?.call();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final hasText = _controller.text.isNotEmpty;

    Widget field = AnimatedContainer(
      duration: AppDurations.fast,
      height: AppSizes.searchHeight,
      // Figma keeps the grey pill (no border) while focused, except for the
      // address search which outlines it.
      decoration: BoxDecoration(
        color: _focused && widget.outlineWhenFocused
            ? colors.surface
            : colors.surfaceMuted,
        borderRadius: AppRadii.pillAll,
        border: Border.all(
          color: _focused && widget.outlineWhenFocused
              ? colors.borderFocus
              : Colors.transparent,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Row(
        children: [
          widget.leading ??
              AppIcon(
                Assets.icons.magniferLinear,
                size: AppSizes.iconMd,
                color: colors.textTertiary,
              ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              readOnly: widget.readOnly,
              autofocus: widget.autofocus,
              onTap: widget.onTap,
              onChanged: widget.onChanged,
              onSubmitted: widget.onSubmitted,
              textInputAction: widget.textInputAction,
              enableInteractiveSelection: !widget.readOnly,
              showCursor: !widget.readOnly,
              style: AppTypography.bodyMedium.copyWith(
                color: colors.textPrimary,
                fontWeight: FontWeight.w400,
              ),
              cursorColor: colors.brand,
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: AppTypography.bodyMedium.copyWith(
                  color: colors.textTertiary,
                  fontWeight: FontWeight.w400,
                ),
                hintMaxLines: 1,
                filled: false,
                isCollapsed: true,
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          AnimatedSwitcher(
            duration: AppDurations.fast,
            transitionBuilder: (child, a) =>
                ScaleTransition(scale: a, child: child),
            child: hasText && !widget.readOnly
                ? PressableScale(
                    key: const ValueKey('clear'),
                    onTap: _clear,
                    scale: 0.85,
                    child: Padding(
                      padding: const EdgeInsets.only(left: AppSpacing.sm),
                      child: AppIcon(
                        Assets.icons.closeCircleBold,
                        size: AppSizes.iconMd,
                        color: colors.textSecondary,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );

    if (widget.readOnly && widget.onTap != null) {
      field = PressableScale(
        onTap: widget.onTap,
        scale: 0.99,
        child: AbsorbPointer(child: field),
      );
    }

    if (widget.heroTag == null) return field;
    return Hero(
      tag: widget.heroTag!,
      flightShuttleBuilder: (_, animation, _, _, _) => Material(
        type: MaterialType.transparency,
        child: Container(
          height: AppSizes.searchHeight,
          decoration: BoxDecoration(
            color: colors.surfaceMuted,
            borderRadius: AppRadii.pillAll,
          ),
        ),
      ),
      child: Material(type: MaterialType.transparency, child: field),
    );
  }
}
