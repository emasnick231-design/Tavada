/// Fee & discount rules shared by the mock checkout and orders APIs, so the
/// quote shown at checkout always matches the order that gets created.
///
/// Amounts are computed in pence and returned in pounds (API convention).
abstract final class MockPricing {
  static const serviceFeePence = 250;
  static const freeDeliveryThresholdPence = 2000;
  static const firstOrderDiscountPercent = 15;

  static int _pence(num pounds) => (pounds * 100).round();
  static double _pounds(int pence) => pence / 100;

  /// Sum of `(base_price + options) * quantity` for order line JSON maps.
  static int subtotalPence(List<Map<String, dynamic>> items) {
    var total = 0;
    for (final item in items) {
      final options = (item['options'] as List? ?? const [])
          .cast<Map<String, dynamic>>();
      final unit =
          _pence(item['base_price'] as num) +
          options.fold<int>(
            0,
            (sum, o) => sum + _pence((o['price'] as num?) ?? 0),
          );
      total += unit * ((item['quantity'] as num?)?.toInt() ?? 1);
    }
    return total;
  }

  /// Builds the quote JSON for [restaurant] (catalog fixture map).
  static Map<String, dynamic> quote({
    required Map<String, dynamic> restaurant,
    required int subtotalPence,
    required bool pickup,
    required bool isFirstOrder,
  }) {
    final baseFee = _pence(restaurant['delivery_fee'] as num);
    final listedOriginal = restaurant['original_delivery_fee'] as num?;
    var deliveryFee = pickup ? 0 : baseFee;
    var originalFee = pickup || listedOriginal == null
        ? null
        : _pence(listedOriginal);
    if (!pickup &&
        deliveryFee > 0 &&
        subtotalPence >= freeDeliveryThresholdPence) {
      originalFee = deliveryFee;
      deliveryFee = 0;
    }

    final offers = (restaurant['offers'] as List? ?? const [])
        .cast<Map<String, dynamic>>();
    final hasFirstOrderDeal =
        isFirstOrder && offers.any((o) => o['type'] == 'first_order');
    final discount = hasFirstOrderDeal
        ? (subtotalPence * firstOrderDiscountPercent / 100).round()
        : 0;

    final total = subtotalPence + deliveryFee + serviceFeePence - discount;
    final original =
        subtotalPence + (originalFee ?? deliveryFee) + serviceFeePence;
    final eta = (restaurant['eta_minutes'] as num).toInt();

    return {
      'subtotal': _pounds(subtotalPence),
      'delivery_fee': _pounds(deliveryFee),
      'original_delivery_fee': originalFee == null
          ? null
          : _pounds(originalFee),
      'service_fee': _pounds(serviceFeePence),
      'discount': _pounds(discount),
      'total': _pounds(total),
      'original_total': original != total ? _pounds(original) : null,
      'eta_minutes': pickup ? eta + 5 : eta,
      'distance_miles': restaurant['distance_miles'],
      'first_order_applied': hasFirstOrderDeal,
    };
  }
}
