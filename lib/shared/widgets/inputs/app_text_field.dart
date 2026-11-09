import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/buttons/pressable_scale.dart';
import 'package:tavada_eats/shared/widgets/media/app_icon.dart';

/// Filled text input from the design system.
///
/// * Grey fill at rest, white fill + warm orange outline when focused.
/// * Optional [label] above the field (with a `*` when [isRequired]).
/// * [errorText] animates in with a gentle shake.
/// * [obscureText] adds the eye toggle used on password fields.
class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.label,
    this.hint,
    this.errorText,
    this.helperText,
    this.isRequired = false,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.inputFormatters,
    this.autofillHints,
    this.prefix,
    this.prefixText,
    this.suffix,
    this.initialValue,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? label;
  final String? hint;
  final String? errorText;
  final String? helperText;
  final bool isRequired;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  final Widget? prefix;
  final String? prefixText;
  final Widget? suffix;
  final String? initialValue;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late final FocusNode _focusNode = widget.focusNode ?? FocusNode();
  late final TextEditingController _controller =
      widget.controller ?? TextEditingController(text: widget.initialValue);
  late bool _obscured = widget.obscureText;
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (_focused != _focusNode.hasFocus) {
      setState(() => _focused = _focusNode.hasFocus);
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    if (widget.focusNode == null) _focusNode.dispose();
    if (widget.controller == null) _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final hasError = widget.errorText != null && widget.errorText!.isNotEmpty;
    final multiline = (widget.maxLines ?? 2) > 1;

    // Figma focus state: white fill + 1px Sazerac/200 border, no glow.
    final field = TextField(
      controller: _controller,
      focusNode: _focusNode,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      obscureText: _obscured,
      obscuringCharacter: '●',
      keyboardType: multiline ? TextInputType.multiline : widget.keyboardType,
      textInputAction: widget.textInputAction,
      textCapitalization: widget.textCapitalization,
      maxLines: widget.obscureText ? 1 : widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      inputFormatters: widget.inputFormatters,
      autofillHints: widget.autofillHints,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      onTap: widget.onTap,
      onTapOutside: (_) => _focusNode.unfocus(),
      style: AppTypography.bodyMedium.copyWith(
        color: colors.textPrimary,
        fontWeight: FontWeight.w400,
        letterSpacing: _obscured ? 2 : 0,
      ),
      cursorColor: colors.brand,
      cursorWidth: 1.6,
      decoration: InputDecoration(
        hintText: widget.hint,
        fillColor: _focused ? colors.surface : colors.surfaceMuted,
        counterText: '',
        prefixIcon: widget.prefix,
        prefixText: widget.prefixText,
        prefixStyle: AppTypography.bodyMedium.copyWith(
          color: colors.textSecondary,
        ),
        suffixIcon: widget.obscureText
            ? _VisibilityToggle(
                obscured: _obscured,
                onToggle: () => setState(() => _obscured = !_obscured),
              )
            : widget.suffix,
        // Keeps the field at 44pt with the eye toggle.
        suffixIconConstraints: const BoxConstraints(
          minWidth: AppSizes.inputHeight,
          minHeight: AppSizes.inputHeight - 4,
        ),
        contentPadding: multiline
            ? const EdgeInsets.all(AppSpacing.md + 2)
            : null,
        enabledBorder: hasError
            ? const OutlineInputBorder(
                borderRadius: AppRadii.mdAll,
                borderSide: BorderSide(color: AppColors.error300),
              )
            : null,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Text.rich(
            TextSpan(
              text: widget.label,
              children: [if (widget.isRequired) const TextSpan(text: ' *')],
            ),
            style: AppTypography.bodyMedium.copyWith(
              color: colors.textPrimary,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
        ],
        if (hasError)
          field
              .animate(key: ValueKey(widget.errorText))
              .shakeX(hz: 5, amount: 3)
        else
          field,
        AnimatedSize(
          duration: AppDurations.fast,
          alignment: Alignment.topLeft,
          child: hasError || widget.helperText != null
              ? Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.xs + 2),
                  child: Text(
                    hasError ? widget.errorText! : widget.helperText!,
                    style: AppTypography.bodySmall.copyWith(
                      color: hasError ? colors.error : colors.textSecondary,
                    ),
                  ),
                )
              : const SizedBox(width: double.infinity),
        ),
      ],
    );
  }
}

class _VisibilityToggle extends StatelessWidget {
  const _VisibilityToggle({required this.obscured, required this.onToggle});

  final bool obscured;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return PressableScale(
      onTap: onToggle,
      scale: 0.85,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: AnimatedSwitcher(
          duration: AppDurations.fast,
          transitionBuilder: (child, animation) =>
              ScaleTransition(scale: animation, child: child),
          child: AppIcon(
            obscured ? Assets.icons.eyeBold : Assets.icons.eyeClosedBold,
            key: ValueKey(obscured),
            size: AppSizes.iconMd,
            color: context.colors.textDisabled,
          ),
        ),
      ),
    );
  }
}
