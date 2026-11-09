import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/features/checkout/domain/entities/checkout_quote.dart';
import 'package:tavada_eats/features/checkout/presentation/widgets/checkout_info_row.dart';
import 'package:tavada_eats/features/orders/domain/entities/order.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// "Choose your payment option" radio list.
class CheckoutPaymentSection extends StatelessWidget {
  const CheckoutPaymentSection({
    required this.method,
    required this.onChanged,
    super.key,
    this.options,
    this.walletTooLow = false,
    this.onTopUp,
  });

  final PaymentMethodType method;
  final ValueChanged<PaymentMethodType> onChanged;
  final PaymentOptions? options;
  final bool walletTooLow;

  /// Opens "Add money" when the wallet can't cover the order.
  final VoidCallback? onTopUp;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final balance = options?.walletBalance.format() ?? '—';
    const tilePadding = EdgeInsets.symmetric(
      horizontal: AppSpacing.gutter,
      vertical: AppSpacing.md,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.gutter,
            AppSpacing.lg,
            AppSpacing.gutter,
            AppSpacing.xs,
          ),
          child: Text(
            l10n.checkoutPaymentOption,
            style: AppTypography.labelLarge,
          ),
        ),
        AppSelectionTile(
          title: l10n.checkoutPayWithWallet,
          subtitle: walletTooLow && method == PaymentMethodType.wallet
              ? '${l10n.checkoutWalletBalance(balance)} · ${l10n.checkoutWalletTooLow}'
              : l10n.checkoutWalletBalance(balance),
          isRadio: true,
          showDivider: false,
          padding: tilePadding,
          selected: method == PaymentMethodType.wallet,
          onTap: () => onChanged(PaymentMethodType.wallet),
        ),
        AppSelectionTile(
          title: l10n.checkoutPayWithCard,
          subtitle: method == PaymentMethodType.card
              ? options?.cardLabel
              : null,
          isRadio: true,
          showDivider: false,
          padding: tilePadding,
          selected: method == PaymentMethodType.card,
          onTap: () => onChanged(PaymentMethodType.card),
        ),
        if (walletTooLow && method == PaymentMethodType.wallet)
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.gutter,
              0,
              AppSpacing.gutter,
              AppSpacing.md,
            ),
            child: InfoBanner(
              message: l10n.checkoutWalletBlocked,
              actionLabel: onTopUp != null
                  ? l10n.checkoutTopUp
                  : l10n.checkoutUseCard,
              onAction: onTopUp ?? () => onChanged(PaymentMethodType.card),
              leading: AppIcon(
                Assets.icons.walletLinear,
                size: AppSizes.iconMd,
                color: colors.brand,
              ),
            ),
          ),
        const SizedBox(height: AppSpacing.sm),
      ],
    );
  }
}

/// Cutlery checkbox + "Send as gift" row.
class CheckoutExtrasSection extends StatelessWidget {
  const CheckoutExtrasSection({
    required this.cutlery,
    required this.onCutleryChanged,
    required this.onGiftTap,
    super.key,
    this.gift,
  });

  final bool cutlery;
  final ValueChanged<bool> onCutleryChanged;
  final VoidCallback onGiftTap;
  final GiftDetails? gift;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Column(
        children: [
          CheckoutInfoRow(
            icon: Assets.icons.cutleryLinear,
            title: l10n.checkoutCutlery,
            onTap: () => onCutleryChanged(!cutlery),
            trailing: AppCheckbox(value: cutlery, onChanged: onCutleryChanged),
          ),
          AnimatedSwitcher(
            duration: AppDurations.normal,
            child: CheckoutInfoRow(
              key: ValueKey(gift?.recipientName),
              icon: Assets.icons.giftBold,
              iconColor: colors.accentLavender,
              title: gift == null
                  ? l10n.checkoutSendAsGift
                  : l10n.checkoutGiftFor(gift!.recipientName),
              subtitle: gift == null ? null : l10n.checkoutGiftSaved,
              showDivider: false,
              onTap: onGiftTap,
            ),
          ),
        ],
      ),
    );
  }
}
