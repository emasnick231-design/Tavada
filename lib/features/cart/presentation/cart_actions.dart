import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/features/cart/domain/entities/cart_item.dart';
import 'package:tavada_eats/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:tavada_eats/features/catalog/domain/entities/menu.dart';
import 'package:tavada_eats/features/catalog/domain/entities/restaurant.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

extension RestaurantCartX on Restaurant {
  CartStoreInfo get cartStore =>
      CartStoreInfo(id: id, name: name, logoUrl: logoUrl);
}

/// Builds a basket line for [item] with the chosen [options].
CartItem cartLineFor(
  MenuItem item, {
  int quantity = 1,
  List<SelectedOption> options = const [],
  String? note,
}) => CartItem(
  id: _uuid.v4(),
  restaurantId: item.restaurantId,
  menuItemId: item.id,
  name: item.name,
  imageUrl: item.imageUrl,
  basePrice: item.price,
  quantity: quantity,
  options: options,
  note: note,
);

/// The "+" on dish cards: adds simple dishes straight away, opens the dish
/// page when options must be chosen first. A closed [restaurant] takes no
/// orders: the customer is told when it opens instead.
void quickAddToCart(
  BuildContext context, {
  required MenuItem item,
  required CartStoreInfo store,
  Restaurant? restaurant,
}) {
  if (restaurant != null && !restaurant.isOpen) {
    AppToast.show(
      context,
      context.l10n.checkoutClosedBanner(
        restaurant.name,
        restaurant.opensAt ?? '',
      ),
      type: ToastType.error,
    );
    return;
  }
  if (item.hasRequiredOptions) {
    unawaited(context.push(AppRoutes.menuItem(item.restaurantId, item.id)));
    return;
  }
  context.read<CartBloc>().add(
    CartItemAdded(store: store, item: cartLineFor(item)),
  );
  showAddedToCartToast(context);
}

void showAddedToCartToast(BuildContext context) {
  final l10n = context.l10n;
  // Resolve the router now: the calling page (e.g. the dish page) is often
  // closed before the toast's action is tapped.
  final router = GoRouter.of(context);
  AppToast.show(
    context,
    l10n.cartAdded,
    type: ToastType.success,
    actionLabel: l10n.cartViewBasket,
    onAction: () => router.go(AppRoutes.basket),
  );
}
