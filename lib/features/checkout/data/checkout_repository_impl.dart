import 'package:tavada_eats/core/error/result.dart';
import 'package:tavada_eats/features/checkout/data/checkout_remote_data_source.dart';
import 'package:tavada_eats/features/checkout/domain/entities/checkout_quote.dart';
import 'package:tavada_eats/features/checkout/domain/repositories/checkout_repository.dart';
import 'package:tavada_eats/features/orders/domain/entities/order.dart';

class CheckoutRepositoryImpl implements CheckoutRepository {
  CheckoutRepositoryImpl(this._remote);

  final CheckoutRemoteDataSource _remote;

  @override
  FutureResult<CheckoutQuote> getQuote({
    required String restaurantId,
    required List<OrderLine> items,
    required DeliveryMode mode,
  }) => guard(
    () => _remote.fetchQuote(
      restaurantId: restaurantId,
      items: items,
      mode: mode,
    ),
  );

  @override
  FutureResult<PaymentOptions> getPaymentOptions() =>
      guard(_remote.fetchPaymentOptions);
}
