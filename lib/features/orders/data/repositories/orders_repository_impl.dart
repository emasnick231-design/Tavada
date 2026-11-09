import 'package:tavada_eats/core/error/result.dart';
import 'package:tavada_eats/features/orders/data/datasources/orders_remote_data_source.dart';
import 'package:tavada_eats/features/orders/domain/entities/order.dart';
import 'package:tavada_eats/features/orders/domain/entities/place_order_request.dart';
import 'package:tavada_eats/features/orders/domain/repositories/orders_repository.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  OrdersRepositoryImpl(this._remote);

  final OrdersRemoteDataSource _remote;

  @override
  FutureResult<Order> placeOrder(PlaceOrderRequest request) =>
      guard(() => _remote.placeOrder(request));

  @override
  FutureResult<List<Order>> getOrders(OrderListType type) =>
      guard(() => _remote.fetchOrders(type));

  @override
  FutureResult<Order> getOrder(String id) =>
      guard(() => _remote.fetchOrder(id));

  @override
  FutureResult<Order> rateOrder(String id, int rating) =>
      guard(() => _remote.rateOrder(id, rating));
}
