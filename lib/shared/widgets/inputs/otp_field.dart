import 'package:flutter_animate/flutter_animate.dart';
import 'package:material_ui/material_ui.dart';
import 'package:pinput/pinput.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/theme/theme.dart';

/// Four-box verification code input (email/phone OTP screens).
///
/// Shows a blinking orange caret in the focused box and masks entered digits
/// as dots, matching the design. Set [hasError] to shake + tint the boxes red.
class OtpField extends StatelessWidget {
  const OtpField({
    super.key,
    this.length = 4,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.onCompleted,
    this.hasError = false,
    this.autofocus = true,
    this.obscure = true,
  });

  final int length;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onCompleted;
  final bool hasError;
  final bool autofocus;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final base = PinTheme(
      width: AppSizes.otpCellWidth,
      height: AppSizes.otpCellHeight,
      textStyle: AppTypography.headlineSmall,
      decoration: BoxDecoration(
        color: colors.surfaceMuted,
        borderRadius: AppRadii.mdAll,
        border: Border.all(color: Colors.transparent),
      ),
    );

    final field = Pinput(
      length: length,
      controller: controller,
      focusNode: focusNode,
      autofocus: autofocus,
      obscureText: obscure,
      obscuringWidget: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: colors.textPrimary,
          shape: BoxShape.circle,
        ),
      ),
      mainAxisAlignment: MainAxisAlignment.start,
      separatorBuilder: (_) => const SizedBox(width: AppSpacing.sm + 1),
      hapticFeedbackType: HapticFeedbackType.selectionClick,
      forceErrorState: hasError,
      onChanged: onChanged,
      onCompleted: onCompleted,
      cursor:
          Container(
                width: 1.8,
                height: 22,
                decoration: BoxDecoration(
                  color: colors.brand,
                  borderRadius: AppRadii.xsAll,
                ),
              )
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .fade(
                begin: 1,
                end: 0.1,
                duration: 600.ms,
              ),
      defaultPinTheme: base,
      focusedPinTheme: base.copyWith(
        decoration: base.decoration!.copyWith(
          color: colors.surface,
          border: Border.all(color: colors.borderFocus),
        ),
      ),
      submittedPinTheme: base,
      errorPinTheme: base.copyWith(
        decoration: base.decoration!.copyWith(
          color: colors.errorSubtle,
          border: Border.all(color: AppColors.error300),
        ),
      ),
    );

    if (!hasError) return field;
    return field.animate(key: UniqueKey()).shakeX(hz: 6, amount: 4);
  }
}
