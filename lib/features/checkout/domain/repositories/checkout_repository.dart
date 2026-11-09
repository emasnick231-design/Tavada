import 'package:tavada_eats/core/error/result.dart';
import 'package:tavada_eats/features/checkout/domain/entities/checkout_quote.dart';
import 'package:tavada_eats/features/orders/domain/entities/order.dart';

abstract interface class CheckoutRepository {
  /// Prices [items] for [restaurantId] (fees, discounts, ETA).
  FutureResult<CheckoutQuote> getQuote({
    required String restaurantId,
    required List<OrderLine> items,
    required DeliveryMode mode,
  });

  FutureResult<PaymentOptions> getPaymentOptions();
}
