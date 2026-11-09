import 'package:tavada_eats/core/network/api_client.dart';
import 'package:tavada_eats/features/orders/domain/entities/order.dart';
import 'package:tavada_eats/features/orders/domain/entities/place_order_request.dart';

abstract final class OrdersEndpoints {
  static const orders = '/orders';
  static String order(String id) => '/orders/$id';
  static String rating(String id) => '/orders/$id/rating';
}

class OrdersRemoteDataSource {
  OrdersRemoteDataSource(this._client);

  final ApiClient _client;

  Future<Order> placeOrder(PlaceOrderRequest request) async => Order.fromJson(
    await _client.post<Map<String, dynamic>>(
      OrdersEndpoints.orders,
      body: request.toJson(),
    ),
  );

  Future<List<Order>> fetchOrders(OrderListType type) async =>
      (await _client.get<List<dynamic>>(
        OrdersEndpoints.orders,
        query: {'status': type.name},
      )).map((e) => Order.fromJson(e as Map<String, dynamic>)).toList();

  Future<Order> fetchOrder(String id) async => Order.fromJson(
    await _client.get<Map<String, dynamic>>(OrdersEndpoints.order(id)),
  );

  Future<Order> rateOrder(String id, int rating) async => Order.fromJson(
    await _client.post<Map<String, dynamic>>(
      OrdersEndpoints.rating(id),
      body: {'rating': rating},
    ),
  );
}
