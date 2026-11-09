import 'package:tavada_eats/core/network/api_client.dart';
import 'package:tavada_eats/features/checkout/domain/entities/checkout_quote.dart';
import 'package:tavada_eats/features/orders/domain/entities/order.dart';

abstract final class CheckoutEndpoints {
  static const quote = '/checkout/quote';
  static const paymentMethods = '/checkout/payment-methods';
}

class CheckoutRemoteDataSource {
  CheckoutRemoteDataSource(this._client);

  final ApiClient _client;

  Future<CheckoutQuote> fetchQuote({
    required String restaurantId,
    required List<OrderLine> items,
    required DeliveryMode mode,
  }) async => CheckoutQuote.fromJson(
    await _client.post<Map<String, dynamic>>(
      CheckoutEndpoints.quote,
      body: {
        'restaurant_id': restaurantId,
        'delivery_mode': mode.name,
        'items': items.map((i) => i.toJson()).toList(),
      },
    ),
  );

  Future<PaymentOptions> fetchPaymentOptions() async => PaymentOptions.fromJson(
    await _client.get<Map<String, dynamic>>(CheckoutEndpoints.paymentMethods),
  );
}
