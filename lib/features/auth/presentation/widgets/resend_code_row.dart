import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// "Resend code in 00:14  Resend code" — the link activates at zero.
class ResendCodeRow extends StatelessWidget {
  const ResendCodeRow({
    required this.secondsLeft,
    required this.isResending,
    required this.onResend,
    super.key,
  });

  final int secondsLeft;
  final bool isResending;
  final VoidCallback onResend;

  static String _clock(int seconds) {
    final m = (seconds ~/ 60).toString().padLeft(2, '0');
    final s = (seconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final counting = secondsLeft > 0;
    return Row(
      children: [
        AnimatedSize(
          duration: AppDurations.normal,
          child: counting
              ? Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.sm),
                  child: Text(
                    l10n.authResendIn(_clock(secondsLeft)),
                    style: AppTypography.bodyMedium
                        .copyWith(
                          color: colors.textSecondary,
                          fontWeight: FontWeight.w400,
                        )
                        .tabularFigures,
                  ),
                )
              : const SizedBox.shrink(),
        ),
        if (isResending)
          BouncingDots(color: colors.brand, dotSize: 5)
        else
          AppLinkButton(
            label: l10n.authResendCode,
            onPressed: counting ? null : onResend,
          ),
      ],
    );
  }
}

extension on TextStyle {
  TextStyle get tabularFigures =>
      copyWith(fontFeatures: const [FontFeature.tabularFigures()]);
}
