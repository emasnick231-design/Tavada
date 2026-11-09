import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/features/cart/domain/entities/cart_item.dart';
import 'package:tavada_eats/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:tavada_eats/features/checkout/presentation/widgets/pack_tile.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Store header + collapsible list of packs ("Pack 1, Pack 2…").
class CheckoutPacksSection extends StatefulWidget {
  const CheckoutPacksSection({required this.cart, super.key});

  final StoreCart cart;

  @override
  State<CheckoutPacksSection> createState() => _CheckoutPacksSectionState();
}

class _CheckoutPacksSectionState extends State<CheckoutPacksSection> {
  bool _expanded = true;

  StoreCart get cart => widget.cart;

  Future<void> _removePack(BuildContext context, CartItem item) async {
    final l10n = context.l10n;
    final confirmed = await showConfirmDialog(
      context: context,
      title: l10n.checkoutRemovePackTitle,
      message: l10n.checkoutRemovePackMessage(item.name),
      confirmLabel: l10n.commonRemove,
      isDestructive: true,
    );
    if (!confirmed || !context.mounted) return;
    context.read<CartBloc>().add(
      CartItemRemoved(restaurantId: item.restaurantId, lineId: item.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    return ExpandableSection(
      expanded: _expanded,
      onExpansionChanged: (v) => setState(() => _expanded = v),
      headerPadding: const EdgeInsets.fromLTRB(
        AppSpacing.gutter,
        AppSpacing.lg,
        AppSpacing.gutter,
        AppSpacing.sm,
      ),
      header: Row(
        children: [
          AppAvatar(
            imageUrl: cart.restaurantLogoUrl,
            backgroundColor: colors.surfaceWarm,
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cart.restaurantName, style: AppTypography.labelLarge),
                Text(
                  l10n.commonItems(cart.itemCount),
                  style: AppTypography.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
      trailingLabel: _expanded
          ? l10n.checkoutHideSelections
          : l10n.checkoutShowSelections,
      child: AnimatedSize(
        duration: AppDurations.normal,
        curve: AppCurves.emphasized,
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 0; i < cart.items.length; i++) ...[
              if (i > 0)
                const Padding(
                  padding: AppInsets.page,
                  child: DashedDivider(),
                ),
              PackTile(
                key: ValueKey(cart.items[i].id),
                index: i,
                item: cart.items[i],
                onRemove: () => _removePack(context, cart.items[i]),
                onQuantityChanged: (q) => context.read<CartBloc>().add(
                  CartItemQuantityChanged(
                    restaurantId: cart.restaurantId,
                    lineId: cart.items[i].id,
                    quantity: q,
                  ),
                ),
                onEditSelection: () => context.push(
                  '${AppRoutes.menuItem(cart.restaurantId, cart.items[i].menuItemId)}'
                  '?edit=${cart.items[i].id}',
                ),
              ).entrance(index: i),
            ],
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.gutter,
                AppSpacing.xs,
                AppSpacing.gutter,
                AppSpacing.lg,
              ),
              // Figma: compact left-aligned pill with a "+".
              child: AppButton.tonal(
                label: l10n.checkoutAddAnotherItem,
                size: AppButtonSize.xs,
                trailing: Icon(
                  Icons.add_rounded,
                  size: 16,
                  color: colors.brand,
                ),
                onPressed: () => _backToStore(context, cart.restaurantId),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// "Add another item": go back to the store page when it's right under
/// checkout instead of stacking store/checkout/store/checkout…
void _backToStore(BuildContext context, String restaurantId) {
  final router = GoRouter.of(context);
  final matches = router.routerDelegate.currentConfiguration.matches;
  final store = AppRoutes.restaurant(restaurantId);
  if (matches.length >= 2) {
    final below = matches[matches.length - 2];
    final location = below is ImperativeRouteMatch
        ? below.matches.uri.path
        : below.matchedLocation;
    if (location == store) {
      router.pop();
      return;
    }
  }
  unawaited(router.pushReplacement(store));
}
