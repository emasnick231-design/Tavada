import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:tavada_eats/features/cart/domain/entities/cart_item.dart';

part 'cart_bloc.freezed.dart';
part 'cart_bloc.g.dart';
part 'cart_event.dart';
part 'cart_state.dart';

/// Client-side basket, persisted across launches.
///
/// Provided app-wide (see `TavadaApp`) because it's used by the restaurant
/// page (add), the bottom nav badge, the Basket tab and checkout.
class CartBloc extends HydratedBloc<CartEvent, CartState> {
  CartBloc({DateTime Function()? clock})
    : _clock = clock ?? DateTime.now,
      super(const CartState()) {
    on<CartItemAdded>(_onAdded);
    on<CartItemUpdated>(_onUpdated);
    on<CartItemQuantityChanged>(_onQuantityChanged);
    on<CartItemRemoved>(_onRemoved);
    on<CartStoreCleared>(_onStoreCleared);
    on<CartCleared>((_, emit) => emit(const CartState()));
  }

  final DateTime Function() _clock;

  void _onAdded(CartItemAdded event, Emitter<CartState> emit) {
    final store = event.store;
    final existing =
        state.carts[store.id] ??
        StoreCart(
          restaurantId: store.id,
          restaurantName: store.name,
          restaurantLogoUrl: store.logoUrl,
          updatedAt: _clock(),
        );
    final items = [...existing.items];
    final index = items.indexWhere((i) => i.sameConfigurationAs(event.item));
    String lineId;
    if (index == -1) {
      items.add(event.item);
      lineId = event.item.id;
    } else {
      final merged = items[index].copyWith(
        quantity: items[index].quantity + event.item.quantity,
      );
      items[index] = merged;
      lineId = merged.id;
    }
    emit(
      state.copyWith(
        carts: {
          ...state.carts,
          store.id: existing.copyWith(items: items, updatedAt: _clock()),
        },
        lastAddedLineId: lineId,
      ),
    );
  }

  void _onUpdated(CartItemUpdated event, Emitter<CartState> emit) {
    final cart = state.carts[event.item.restaurantId];
    if (cart == null) return;
    if (!cart.items.any((i) => i.id == event.item.id)) return;
    // Editing a pack into the same choices as another pack merges them.
    final twin = cart.items
        .where(
          (i) => i.id != event.item.id && i.sameConfigurationAs(event.item),
        )
        .firstOrNull;
    final items = <CartItem>[
      for (final i in cart.items)
        if (twin != null && i.id == twin.id)
          i.copyWith(quantity: i.quantity + event.item.quantity)
        else if (i.id != event.item.id)
          i
        else if (twin == null)
          event.item,
    ];
    _emitCart(emit, cart.copyWith(items: items, updatedAt: _clock()));
  }

  void _onQuantityChanged(
    CartItemQuantityChanged event,
    Emitter<CartState> emit,
  ) {
    final cart = state.carts[event.restaurantId];
    if (cart == null) return;
    final items = <CartItem>[
      for (final i in cart.items)
        if (i.id != event.lineId)
          i
        else if (event.quantity > 0)
          i.copyWith(quantity: event.quantity),
    ];
    _emitCart(emit, cart.copyWith(items: items, updatedAt: _clock()));
  }

  void _onRemoved(CartItemRemoved event, Emitter<CartState> emit) {
    final cart = state.carts[event.restaurantId];
    if (cart == null) return;
    _emitCart(
      emit,
      cart.copyWith(
        items: cart.items.where((i) => i.id != event.lineId).toList(),
        updatedAt: _clock(),
      ),
    );
  }

  void _onStoreCleared(CartStoreCleared event, Emitter<CartState> emit) {
    emit(state.copyWith(carts: {...state.carts}..remove(event.restaurantId)));
  }

  /// Writes [cart] back, dropping it entirely once empty.
  void _emitCart(Emitter<CartState> emit, StoreCart cart) {
    final carts = {...state.carts};
    if (cart.isEmpty) {
      carts.remove(cart.restaurantId);
    } else {
      carts[cart.restaurantId] = cart;
    }
    emit(state.copyWith(carts: carts));
  }

  @override
  CartState? fromJson(Map<String, dynamic> json) => CartState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(CartState state) => state.toJson();
}
