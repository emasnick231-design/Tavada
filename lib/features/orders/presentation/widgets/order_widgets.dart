import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/models/money.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/features/orders/domain/entities/order.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Section title used on the order screens ("Delivery Info").
class OrderSectionTitle extends StatelessWidget {
  const OrderSectionTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(
      AppSpacing.gutter,
      AppSpacing.xxl,
      AppSpacing.gutter,
      AppSpacing.md,
    ),
    child: Text(title, style: AppTypography.titleMedium),
  );
}

/// Address + delivery instruction, with optional Change / Edit buttons.
class OrderDeliveryInfo extends StatelessWidget {
  const OrderDeliveryInfo({
    required this.order,
    super.key,
    this.editable = false,
  });

  final Order order;
  final bool editable;

  void _askSupport(BuildContext context) {
    final l10n = context.l10n;
    AppToast.show(
      context,
      l10n.ordersChangeAfterPlacing,
      actionLabel: l10n.ordersChat,
      onAction: () => unawaited(context.push(AppRoutes.supportChat)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final body = AppTypography.caption.copyWith(
      color: colors.textSecondary,
    );
    final pickup = order.deliveryMode == DeliveryMode.pickup;
    Widget block({
      required String title,
      required String value,
      String? action,
    }) => Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTypography.bodyMedium),
                const SizedBox(height: AppSpacing.xxs),
                Text(value, style: body),
              ],
            ),
          ),
          if (editable && action != null) ...[
            const SizedBox(width: AppSpacing.lg),
            AppButton.neutral(
              label: action,
              onPressed: () => _askSupport(context),
            ),
          ],
        ],
      ),
    );
    return Padding(
      padding: AppInsets.page,
      child: Column(
        children: [
          block(
            title: pickup ? l10n.ordersPickupFrom : l10n.ordersAddress,
            value: pickup
                ? order.restaurant.address ?? order.restaurant.name
                : order.address?.fullAddress ?? '',
            action: pickup ? null : l10n.ordersChange,
          ),
          if (!pickup)
            block(
              title: l10n.ordersInstruction,
              value: order.instructions ?? l10n.ordersNoInstruction,
              action: l10n.ordersEdit,
            ),
        ],
      ),
    );
  }
}

/// Store header, numbered lines and (unless [showPayment] is false) the
/// payment summary.
class OrderSummary extends StatelessWidget {
  const OrderSummary({required this.order, super.key, this.showPayment = true});

  final Order order;

  /// Figma's tracking screen moves the amounts into their own "Payment
  /// details" section ([OrderPaymentDetails]).
  final bool showPayment;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    return Padding(
      padding: AppInsets.page,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              AppAvatar(imageUrl: order.restaurant.logoUrl),
              const SizedBox(width: AppSpacing.md),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(order.restaurant.name, style: AppTypography.titleSmall),
                  Text(
                    l10n.commonItems(order.itemCount),
                    style: AppTypography.bodySmall.copyWith(
                      color: colors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          for (final line in order.items)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: AppRadii.smAll,
                      border: Border.all(color: colors.border),
                    ),
                    child: Text(
                      '${line.quantity}',
                      style: AppTypography.labelMedium,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(line.name, style: AppTypography.labelLarge),
                        if (line.optionsSummary.isNotEmpty)
                          Text(
                            line.optionsSummary,
                            style: AppTypography.bodySmall.copyWith(
                              color: colors.textSecondary,
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Text(
                    line.total.format(),
                    style: AppTypography.caption.copyWith(
                      color: colors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          if (order.gift != null)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: InfoBanner(
                message: l10n.ordersGiftFor(order.gift!.recipientName),
              ),
            ),
          if (showPayment) ...[
            Divider(height: AppSpacing.xl, color: colors.divider),
            _PaymentRows(order: order),
          ],
        ],
      ),
    );
  }
}

/// "Payment details": subtotal, fees, discount and total.
class OrderPaymentDetails extends StatelessWidget {
  const OrderPaymentDetails({required this.order, super.key});

  final Order order;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(
      AppSpacing.gutter,
      0,
      AppSpacing.gutter,
      AppSpacing.lg,
    ),
    child: _PaymentRows(order: order),
  );
}

class _PaymentRows extends StatelessWidget {
  const _PaymentRows({required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    // Figma shows free amounts as "£0".
    String money(Money m) => m.isZero ? m.format(decimalDigits: 0) : m.format();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SummaryRow(label: l10n.checkoutSubtotal, value: money(order.subtotal)),
        SummaryRow(
          label: l10n.checkoutDeliveryFee,
          value: money(order.deliveryFee),
        ),
        SummaryRow(
          label: l10n.checkoutServiceFee,
          value: money(order.serviceFee),
        ),
        if (!order.discount.isZero)
          SummaryRow(
            label: l10n.checkoutDiscount,
            value: '-${order.discount.format()}',
            valueColor: colors.success,
          ),
        SummaryRow(
          label: l10n.checkoutTotal,
          value: order.total.format(),
          isTotal: true,
        ),
      ],
    );
  }
}
