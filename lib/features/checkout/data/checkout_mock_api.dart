import 'package:tavada_eats/core/network/mock/mock_accounts.dart';
import 'package:tavada_eats/core/network/mock/mock_database.dart';
import 'package:tavada_eats/core/network/mock/mock_delivery_area.dart';
import 'package:tavada_eats/core/network/mock/mock_server.dart';
import 'package:tavada_eats/features/orders/data/mock/mock_pricing.dart';

/// Fake checkout endpoints: price quotes and payment options.
class CheckoutMockApi implements MockApi {
  CheckoutMockApi(this._db);

  final MockDatabase _db;

  @override
  List<MockRoute> get routes => [
    MockRoute.post('/checkout/quote', _quote),
    MockRoute.get('/checkout/payment-methods', _paymentMethods),
  ];

  Future<MockResponse> _quote(MockRequest req) async {
    final body = req.json;
    final restaurant = await _db.findById(
      'catalog_restaurants',
      '${body['restaurant_id']}',
    );
    if (restaurant == null) return MockResponse.notFound();
    final pickup = body['delivery_mode'] == 'pickup';
    final rejected = MockDeliveryArea.outOfRange(
      restaurant,
      req,
      pickup: pickup,
    );
    if (rejected != null) return rejected;
    final items = (body['items'] as List? ?? const [])
        .cast<Map<String, dynamic>>();
    final userId = req.userId;
    final previous = userId == null
        ? const <Map<String, dynamic>>[]
        : await _db.where(
            'orders',
            (o) => o['live'] == true && MockAccounts.owns(o, userId),
          );
    return MockResponse.ok(
      MockPricing.quote(
        restaurant: MockDeliveryArea.adjust(restaurant, req.deliveryLocation),
        subtotalPence: MockPricing.subtotalPence(items),
        pickup: body['delivery_mode'] == 'pickup',
        isFirstOrder: previous.isEmpty,
      ),
    );
  }

  /// Guests have no wallet (401) — the page shows it once they sign in.
  Future<MockResponse> _paymentMethods(MockRequest req) async {
    final userId = req.userId;
    if (userId == null) return MockResponse.unauthorized();
    final account = await MockAccounts(_db).load(userId);
    final wallet = account['wallet'] as Map<String, dynamic>? ?? const {};
    return MockResponse.ok({
      'wallet_balance': wallet['balance'] ?? 0,
      'card_label': 'Visa •••• 4242',
    });
  }
}
