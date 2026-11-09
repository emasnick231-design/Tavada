import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/error/result.dart';
import 'package:tavada_eats/core/models/money.dart';
import 'package:tavada_eats/features/orders/domain/entities/order.dart';
import 'package:tavada_eats/features/orders/domain/repositories/orders_repository.dart';
import 'package:tavada_eats/features/orders/presentation/bloc/order_cubit.dart';

class _MockOrdersRepository extends Mock implements OrdersRepository {}

void main() {
  final order = Order(
    id: '1',
    restaurant: const OrderRestaurant(id: 'r', name: 'Mide Lagos', logoUrl: ''),
    items: const [],
    status: OrderStatus.delivered,
    placedAt: DateTime(2026),
    estimatedArrival: DateTime(2026),
    subtotal: Money.zero,
    deliveryFee: Money.zero,
    serviceFee: Money.zero,
    total: Money.zero,
  );

  // UX review #21: stars fill on tap and roll back when saving fails.
  test('rating is optimistic and rolls back on failure', () async {
    final repository = _MockOrdersRepository();
    when(() => repository.getOrder('1')).thenAnswer((_) async => Right(order));
    when(
      () => repository.rateOrder('1', 4),
    ).thenAnswer((_) async => const Left(NetworkFailure()));
    final cubit = OrderCubit(repository, '1');
    await cubit.load();
    final future = cubit.rate(4);
    expect(cubit.state.order?.rating, 4);
    expect(await future, isA<NetworkFailure>());
    expect(cubit.state.order?.rating, isNull);
    await cubit.close();
  });
}
