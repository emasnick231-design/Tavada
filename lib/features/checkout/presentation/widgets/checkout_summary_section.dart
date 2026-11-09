import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/models/money.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/features/checkout/domain/entities/checkout_quote.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// "Payment summary" with amounts that count up/down as the basket changes.
class CheckoutSummarySection extends StatelessWidget {
  const CheckoutSummarySection({required this.quote, super.key});

  /// `null` while the first quote loads (renders a skeleton).
  final CheckoutQuote? quote;

  static const _placeholder = CheckoutQuote(
    subtotal: Money(1550),
    deliveryFee: Money.zero,
    serviceFee: Money(250),
    total: Money(1800),
  );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final q = quote ?? _placeholder;
    return AppSkeleton(
      enabled: quote == null,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.gutter,
          AppSpacing.lg,
          AppSpacing.gutter,
          AppSpacing.xl,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l10n.checkoutPaymentSummary, style: AppTypography.labelLarge),
            const SizedBox(height: AppSpacing.sm),
            _MoneyRow(label: l10n.checkoutSubtotal, value: q.subtotal),
            _MoneyRow(
              label: l10n.checkoutDeliveryFee,
              value: q.deliveryFee,
              strike: q.originalDeliveryFee,
            ),
            _MoneyRow(label: l10n.checkoutServiceFee, value: q.serviceFee),
            if (q.discount.isPositive)
              _MoneyRow(
                label: l10n.checkoutDiscount,
                value: -q.discount,
                color: colors.success,
              ),
            _MoneyRow(
              label: l10n.checkoutTotal,
              value: q.total,
              strike: q.originalTotal,
              isTotal: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _MoneyRow extends StatelessWidget {
  const _MoneyRow({
    required this.label,
    required this.value,
    this.strike,
    this.color,
    this.isTotal = false,
  });

  final String label;
  final Money value;
  final Money? strike;
  final Color? color;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final base = isTotal
        ? AppTypography.titleSmall
        : AppTypography.bodyMedium.copyWith(
            color: colors.textSecondary,
            fontWeight: FontWeight.w400,
          );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(child: Text(label, style: base)),
          if (strike != null && strike! > value) ...[
            Text(
              strike!.format(),
              style: base.copyWith(
                color: colors.textTertiary,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.lineThrough,
                decorationColor: colors.textTertiary,
              ),
            ),
            const SizedBox(width: AppSpacing.xs),
          ],
          // Figma shows a free fee as "£0", not "£0.00".
          if (value.isZero)
            Text(
              value.format(decimalDigits: 0),
              style: base.copyWith(color: color),
            )
          else
            AnimatedMoney(
              value: value,
              style: base.copyWith(color: color),
            ),
        ],
      ),
    );
  }
}
