import 'package:flutter/gestures.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/models/money.dart';
import 'package:tavada_eats/core/theme/theme.dart';

/// Warm notice box ("Food may contain allergens… Please contact the
/// restaurant").
class InfoBanner extends StatelessWidget {
  const InfoBanner({
    required this.message,
    super.key,
    this.actionLabel,
    this.onAction,
    this.leading,
  });

  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: colors.brandSubtle,
        borderRadius: AppRadii.mdAll,
        border: Border.all(color: colors.brandMuted),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (leading != null) ...[
            leading!,
            const SizedBox(width: AppSpacing.sm),
          ],
          Expanded(
            child: Text.rich(
              TextSpan(
                text: message,
                children: [
                  if (actionLabel != null)
                    TextSpan(
                      text: ' $actionLabel',
                      style: TextStyle(
                        color: colors.brand,
                        fontWeight: FontWeight.w600,
                      ),
                      recognizer: onAction == null
                          ? null
                          : (TapGestureRecognizer()..onTap = onAction),
                    ),
                ],
              ),
              style: AppTypography.bodyMedium.copyWith(
                fontSize: 13,
                color: colors.textPrimary,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// "£5.40  ~~£6.01~~" with an optional discount.
class PriceText extends StatelessWidget {
  const PriceText({
    required this.price,
    super.key,
    this.originalPrice,
    this.style,
  });

  final Money price;
  final Money? originalPrice;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final base = style ?? AppTypography.titleMedium;
    final showOriginal = originalPrice != null && originalPrice! > price;
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: price.format(), style: base),
          if (showOriginal)
            TextSpan(
              text: '  ${originalPrice!.format()}',
              style: base.copyWith(
                color: context.colors.textTertiary,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.lineThrough,
                decorationColor: context.colors.textTertiary,
              ),
            ),
        ],
      ),
    );
  }
}

/// "By continuing you agree to our Privacy Policy and Terms of Use".
///
/// Figma: Regular 12/18 (welcome, broken before "and" with [breakBeforeAnd])
/// or Regular 10 on one line in the checkout bar ([compact]).
class LegalConsentText extends StatelessWidget {
  const LegalConsentText({
    super.key,
    this.onPrivacyTap,
    this.onTermsTap,
    this.textAlign = TextAlign.center,
    this.compact = false,
    this.breakBeforeAnd = false,
  });

  final VoidCallback? onPrivacyTap;
  final VoidCallback? onTermsTap;
  final TextAlign textAlign;
  final bool compact;
  final bool breakBeforeAnd;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    final link = TextStyle(
      color: colors.textPrimary,
      decoration: TextDecoration.underline,
      decorationColor: colors.textPrimary,
    );
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: '${l10n.legalAgreePrefix} '),
          TextSpan(
            text: l10n.legalPrivacyPolicy,
            style: link,
            recognizer: TapGestureRecognizer()..onTap = onPrivacyTap,
          ),
          TextSpan(text: '${breakBeforeAnd ? '\n' : ' '}${l10n.legalAnd} '),
          TextSpan(
            text: l10n.legalTermsOfUse,
            style: link,
            recognizer: TapGestureRecognizer()..onTap = onTermsTap,
          ),
        ],
      ),
      textAlign: textAlign,
      style: AppTypography.caption.copyWith(
        color: colors.textSecondary,
        fontSize: compact ? 10 : null,
        height: compact ? 1.4 : null,
      ),
    );
  }
}

/// Row for "Subtotal ……… £15.50" summaries.
class SummaryRow extends StatelessWidget {
  const SummaryRow({
    required this.label,
    required this.value,
    super.key,
    this.isTotal = false,
    this.valueColor,
    this.strikeValue,
  });

  final String label;
  final String value;
  final bool isTotal;
  final Color? valueColor;

  /// Optional struck-through original value shown before [value].
  final String? strikeValue;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final labelStyle = isTotal
        ? AppTypography.titleSmall
        : AppTypography.bodyMedium.copyWith(
            color: colors.textSecondary,
            fontWeight: FontWeight.w400,
          );
    final valueStyle = isTotal
        ? AppTypography.titleSmall
        : AppTypography.bodyMedium.copyWith(
            color: valueColor ?? colors.textSecondary,
            fontWeight: FontWeight.w400,
          );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(child: Text(label, style: labelStyle)),
          if (strikeValue != null) ...[
            Text(
              strikeValue!,
              style: valueStyle.copyWith(
                color: colors.textTertiary,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            const SizedBox(width: AppSpacing.xs),
          ],
          Text(value, style: valueStyle.copyWith(color: valueColor)),
        ],
      ),
    );
  }
}
