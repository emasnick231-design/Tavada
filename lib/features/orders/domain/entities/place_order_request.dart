import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/models/delivery_address.dart';
import 'package:tavada_eats/features/orders/domain/entities/order.dart';

part 'place_order_request.freezed.dart';
part 'place_order_request.g.dart';

/// Payload sent to `POST /orders` from the checkout screen.
@freezed
abstract class PlaceOrderRequest with _$PlaceOrderRequest {
  const factory PlaceOrderRequest({
    required String restaurantId,
    required List<OrderLine> items,
    @Default(DeliveryMode.delivery) DeliveryMode deliveryMode,
    @Default(PaymentMethodType.wallet) PaymentMethodType paymentMethod,
    DeliveryAddress? address,
    String? instructions,
    GiftDetails? gift,
    @Default(false) bool cutlery,
  }) = _PlaceOrderRequest;

  factory PlaceOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$PlaceOrderRequestFromJson(json);
}

/// Which bucket of orders to list on the Basket tab.
enum OrderListType { ongoing, completed }
