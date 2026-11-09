import 'package:tavada_eats/core/error/result.dart';
import 'package:tavada_eats/features/orders/domain/entities/order.dart';
import 'package:tavada_eats/features/orders/domain/entities/place_order_request.dart';

/// Orders placed by the customer (shared by Checkout, Basket and Tracking).
abstract interface class OrdersRepository {
  /// Places an order. Fails with a `ValidationFailure` coded
  /// `insufficient_funds`, `restaurant_closed`, `address_required` or
  /// `empty_basket`.
  FutureResult<Order> placeOrder(PlaceOrderRequest request);

  FutureResult<List<Order>> getOrders(OrderListType type);

  FutureResult<Order> getOrder(String id);

  FutureResult<Order> rateOrder(String id, int rating);
}
