part of 'cart_bloc.dart';

@freezed
abstract class CartState with _$CartState {
  const factory CartState({
    /// Baskets keyed by restaurant id.
    @Default({}) Map<String, StoreCart> carts,

    /// Id of the last line added — lets the UI celebrate it.
    String? lastAddedLineId,
  }) = _CartState;

  const CartState._();

  factory CartState.fromJson(Map<String, dynamic> json) =>
      _$CartStateFromJson(json);

  /// Total quantity across stores (bottom-nav badge).
  int get totalItems => carts.values.fold(0, (sum, c) => sum + c.itemCount);

  bool get isEmpty => carts.isEmpty;

  /// Most recently touched baskets first ("My Orders" tab).
  List<StoreCart> get storeCarts =>
      carts.values.toList()..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

  StoreCart? cartFor(String restaurantId) => carts[restaurantId];

  int quantityOf(String restaurantId, String menuItemId) =>
      carts[restaurantId]?.items
          .where((i) => i.menuItemId == menuItemId)
          .fold<int>(0, (sum, i) => sum + i.quantity) ??
      0;
}
