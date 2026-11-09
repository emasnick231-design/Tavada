part of 'cart_bloc.dart';

sealed class CartEvent {
  const CartEvent();
}

/// Adds [item] (merging with an identical line if present).
final class CartItemAdded extends CartEvent {
  const CartItemAdded({required this.store, required this.item});

  final CartStoreInfo store;
  final CartItem item;
}

/// Replaces an existing line, e.g. after "Edit selection".
final class CartItemUpdated extends CartEvent {
  const CartItemUpdated(this.item);

  final CartItem item;
}

final class CartItemQuantityChanged extends CartEvent {
  const CartItemQuantityChanged({
    required this.restaurantId,
    required this.lineId,
    required this.quantity,
  });

  final String restaurantId;
  final String lineId;

  /// 0 removes the line.
  final int quantity;
}

final class CartItemRemoved extends CartEvent {
  const CartItemRemoved({required this.restaurantId, required this.lineId});

  final String restaurantId;
  final String lineId;
}

final class CartStoreCleared extends CartEvent {
  const CartStoreCleared(this.restaurantId);

  final String restaurantId;
}

final class CartCleared extends CartEvent {
  const CartCleared();
}
