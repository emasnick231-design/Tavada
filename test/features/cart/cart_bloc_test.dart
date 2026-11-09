import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tavada_eats/core/models/money.dart';
import 'package:tavada_eats/features/cart/domain/entities/cart_item.dart';
import 'package:tavada_eats/features/cart/presentation/bloc/cart_bloc.dart';

import '../../helpers/helpers.dart';

void main() {
  final now = DateTime(2026, 10, 26, 12);
  const store = CartStoreInfo(
    id: 'mide-lagos',
    name: 'Mide Lagos',
    logoUrl: '',
  );
  const spice = SelectedOption(
    groupId: 'spice',
    groupTitle: 'Spice Level',
    optionId: 'hot',
    name: 'Extra Spiced (Hot)',
  );
  const protein = SelectedOption(
    groupId: 'protein',
    groupTitle: 'Choose Your Protein',
    optionId: 'chicken',
    name: 'Grilled Quarter Chicken',
    price: Money(300),
  );

  CartItem line(
    String id, {
    List<SelectedOption> options = const [],
    int qty = 1,
  }) => CartItem(
    id: id,
    restaurantId: store.id,
    menuItemId: 'jollof-haven',
    name: 'Jollof haven',
    imageUrl: '',
    basePrice: const Money(541),
    quantity: qty,
    options: options,
  );

  setUpAll(buildTestHydratedStorage);

  group('CartBloc', () {
    blocTest<CartBloc, CartState>(
      'adds a line and computes totals with option prices',
      build: () => CartBloc(clock: () => now),
      act: (bloc) => bloc.add(
        CartItemAdded(
          store: store,
          item: line('a', options: [protein], qty: 2),
        ),
      ),
      verify: (bloc) {
        final cart = bloc.state.cartFor(store.id)!;
        expect(cart.items, hasLength(1));
        expect(cart.items.single.unitPrice, const Money(841));
        expect(cart.subtotal, const Money(1682));
        expect(bloc.state.totalItems, 2);
      },
    );

    blocTest<CartBloc, CartState>(
      'merges identical configurations instead of adding a new pack',
      build: () => CartBloc(clock: () => now),
      act: (bloc) => bloc
        ..add(
          CartItemAdded(
            store: store,
            item: line('a', options: [spice]),
          ),
        )
        ..add(
          CartItemAdded(
            store: store,
            item: line('b', options: [spice]),
          ),
        ),
      verify: (bloc) {
        final items = bloc.state.cartFor(store.id)!.items;
        expect(items, hasLength(1));
        expect(items.single.quantity, 2);
        expect(bloc.state.lastAddedLineId, 'a');
      },
    );

    blocTest<CartBloc, CartState>(
      'keeps different configurations as separate packs',
      build: () => CartBloc(clock: () => now),
      act: (bloc) => bloc
        ..add(
          CartItemAdded(
            store: store,
            item: line('a', options: [spice]),
          ),
        )
        ..add(
          CartItemAdded(
            store: store,
            item: line('b', options: [protein]),
          ),
        ),
      verify: (bloc) =>
          expect(bloc.state.cartFor(store.id)!.items, hasLength(2)),
    );

    blocTest<CartBloc, CartState>(
      'removes the store basket when its last line reaches zero',
      build: () => CartBloc(clock: () => now),
      act: (bloc) => bloc
        ..add(CartItemAdded(store: store, item: line('a')))
        ..add(
          CartItemQuantityChanged(
            restaurantId: store.id,
            lineId: 'a',
            quantity: 0,
          ),
        ),
      verify: (bloc) => expect(bloc.state.isEmpty, isTrue),
    );

    // UX review #30: editing a pack into another pack's choices merges them.
    blocTest<CartBloc, CartState>(
      'editing a pack into an identical one merges the two',
      build: () => CartBloc(clock: () => now),
      act: (bloc) => bloc
        ..add(CartItemAdded(store: store, item: line('a', options: [spice])))
        ..add(CartItemAdded(store: store, item: line('b', options: [protein])))
        ..add(CartItemUpdated(line('b', options: [spice], qty: 2))),
      verify: (bloc) {
        final items = bloc.state.cartFor(store.id)!.items;
        expect(items, hasLength(1));
        expect(items.single.id, 'a');
        expect(items.single.quantity, 3);
      },
    );

    blocTest<CartBloc, CartState>(
      'round-trips through JSON (hydration)',
      build: () => CartBloc(clock: () => now),
      act: (bloc) => bloc.add(
        CartItemAdded(
          store: store,
          item: line('a', options: [protein]),
        ),
      ),
      verify: (bloc) {
        final json = bloc.toJson(bloc.state)!;
        expect(bloc.fromJson(json), bloc.state);
      },
    );
  });
}
