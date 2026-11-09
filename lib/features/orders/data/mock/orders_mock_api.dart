import 'dart:math';

import 'package:tavada_eats/core/network/mock/mock_accounts.dart';
import 'package:tavada_eats/core/network/mock/mock_database.dart';
import 'package:tavada_eats/core/network/mock/mock_delivery_area.dart';
import 'package:tavada_eats/core/network/mock/mock_server.dart';
import 'package:tavada_eats/features/orders/data/mock/mock_pricing.dart';

/// Fake orders backend.
///
/// Live orders progress on a compressed schedule computed from `placed_at`,
/// so tracking moves on its own: placed → preparing (15s) → rider picks (35s)
/// → dispatched (55s) → delivered (90s). Orders belong to the signed-in
/// user (`user_id`; fixture orders are the demo customer's). Wallet payments
/// debit that user's account and append to `wallet_transactions`; every
/// order earns [pointsPerPound] reward points per £1 spent.
class OrdersMockApi implements MockApi {
  OrdersMockApi(this._db, {DateTime Function()? clock, Random? random})
    : _clock = clock ?? DateTime.now,
      _random = random ?? Random(),
      _accounts = MockAccounts(_db);

  /// "Earn 10 points for every £1 you spend."
  static const pointsPerPound = 10;

  final MockDatabase _db;
  final MockAccounts _accounts;
  final DateTime Function() _clock;
  final Random _random;

  static const schedule = [
    ('preparing', Duration(seconds: 15), 'rider_assigned'),
    ('rider_picked', Duration(seconds: 35), 'ready_for_pickup'),
    ('dispatched', Duration(seconds: 55), 'picked_up'),
    ('delivered', Duration(seconds: 90), 'arrived'),
  ];

  static const _rider = {
    'name': 'Hassan',
    'phone': '+234 704 372 9375',
  };

  @override
  List<MockRoute> get routes => [
    MockRoute.post('/orders', _place),
    MockRoute.get('/orders', _list),
    MockRoute.get('/orders/:id', _get),
    MockRoute.post('/orders/:id/rating', _rate),
  ];

  static bool _isTurkish(MockRequest r) =>
      '${r.headers['Accept-Language'] ?? ''}'.toLowerCase().startsWith('tr');

  /// Applies the live schedule to a stored order.
  Map<String, dynamic> _hydrate(Map<String, dynamic> order) {
    if (order['live'] != true || order['status'] == 'cancelled') return order;
    final placedAt = DateTime.parse(order['placed_at'] as String);
    final elapsed = _clock().difference(placedAt);
    var status = 'placed';
    final timeline = <Map<String, dynamic>>[
      {'milestone': 'confirmed', 'at': placedAt.toIso8601String()},
    ];
    for (final (next, after, milestone) in schedule) {
      if (elapsed < after) break;
      status = next;
      timeline.add({
        'milestone': milestone,
        'at': placedAt.add(after).toIso8601String(),
      });
    }
    final hasRider = status != 'placed' && status != 'preparing';
    return {
      ...order,
      'status': status,
      'timeline': timeline,
      'rider': hasRider ? _rider : null,
      'delivered_at': status == 'delivered'
          ? placedAt.add(schedule.last.$2).toIso8601String()
          : null,
    };
  }

  Future<MockResponse> _place(MockRequest req) async {
    final userId = req.userId;
    if (userId == null) return MockResponse.unauthorized();
    final tr = _isTurkish(req);
    final body = req.json;
    final items = (body['items'] as List? ?? const [])
        .cast<Map<String, dynamic>>();
    if (items.isEmpty) {
      return MockResponse.validation(
        tr ? 'Sepetiniz boş.' : 'Your basket is empty.',
        code: 'empty_basket',
      );
    }
    final restaurant = await _db.findById(
      'catalog_restaurants',
      body['restaurant_id'] as String,
    );
    if (restaurant == null) return MockResponse.notFound();
    if (restaurant['is_open'] == false) {
      final opens = restaurant['opens_at'] ?? '11:00 AM';
      return MockResponse.validation(
        tr
            ? '${restaurant['name']} şu anda kapalı. $opens itibarıyla açılıyor.'
            : '${restaurant['name']} is closed right now. It opens at $opens.',
        code: 'restaurant_closed',
      );
    }
    final pickup = body['delivery_mode'] == 'pickup';
    final rejected = MockDeliveryArea.outOfRange(
      restaurant,
      req,
      pickup: pickup,
    );
    if (rejected != null) return rejected;
    if (!pickup && body['address'] == null) {
      return MockResponse.validation(
        tr
            ? 'Lütfen bir teslimat adresi seçin.'
            : 'Please choose a delivery address.',
        code: 'address_required',
      );
    }

    final previous = await _db.where(
      'orders',
      (o) => o['live'] == true && MockAccounts.owns(o, userId),
    );
    final quote = MockPricing.quote(
      restaurant: restaurant,
      subtotalPence: MockPricing.subtotalPence(items),
      pickup: pickup,
      isFirstOrder: previous.isEmpty,
    );
    final total = quote['total'] as double;

    final account = await _accounts.load(userId);
    final wallet = Map<String, dynamic>.from(account['wallet'] as Map);
    final balance = (wallet['balance'] as num).toDouble();
    final payWithWallet = body['payment_method'] != 'card';
    if (payWithWallet && balance < total) {
      return MockResponse.validation(
        tr
            ? 'Cüzdan bakiyeniz bu sipariş için yetersiz. Bakiye yükleyin veya kartla ödeyin.'
            : 'Your wallet balance is too low for this order. Top up or pay by card.',
        code: 'insufficient_funds',
      );
    }

    final now = _clock();
    final id = '${17900000 + _random.nextInt(99999)}';
    final points = (total * pointsPerPound).floor();
    final order = <String, dynamic>{
      'id': id,
      'user_id': userId,
      'live': true,
      'restaurant': {
        'id': restaurant['id'],
        'name': restaurant['name'],
        'logo_url': restaurant['logo_url'],
        'address': restaurant['address'],
        'location': restaurant['location'],
      },
      'items': items,
      'status': 'placed',
      'placed_at': now.toIso8601String(),
      // The demo runs on a compressed schedule (delivered after 90 s), so
      // the promised time matches it instead of the quoted ETA.
      'estimated_arrival': now.add(schedule.last.$2).toIso8601String(),
      'subtotal': quote['subtotal'],
      'delivery_fee': quote['delivery_fee'],
      'service_fee': quote['service_fee'],
      'discount': quote['discount'],
      'total': total,
      'delivery_mode': body['delivery_mode'] ?? 'delivery',
      'payment_method': payWithWallet ? 'wallet' : 'card',
      'address': body['address'],
      'instructions': body['instructions'],
      'gift': body['gift'],
      'cutlery': body['cutlery'] ?? false,
      'points_earned': points,
    };
    await _db.insert('orders', order);

    final rewards = Map<String, dynamic>.from(
      (account['rewards'] as Map?) ?? const {},
    );
    rewards['points'] = ((rewards['points'] as num?) ?? 0).toInt() + points;
    if (payWithWallet) {
      wallet['balance'] = ((balance - total) * 100).round() / 100;
    }
    await _accounts.save(userId, {
      ...account,
      'wallet': wallet,
      'rewards': rewards,
    });
    if (payWithWallet) {
      await _db.insert('wallet_transactions', {
        'id': 'wt-$id',
        'user_id': userId,
        'type': 'payment',
        'amount': total,
        'description': {
          'en': 'Order at ${restaurant['name']}',
          'tr': '${restaurant['name']} siparişi',
        },
        'created_at': now.toIso8601String(),
        'order_id': id,
      });
    }
    return MockResponse.created(_hydrate(order));
  }

  Future<MockResponse> _list(MockRequest req) async {
    final userId = req.userId;
    if (userId == null) return MockResponse.unauthorized();
    final completed = req.queryString('status') == 'completed';
    final orders =
        (await _db.collection('orders'))
            .where((o) => MockAccounts.owns(o, userId))
            .map(_hydrate)
            .where((o) {
              final done =
                  o['status'] == 'delivered' || o['status'] == 'cancelled';
              return completed ? done : !done;
            })
            .toList()
          ..sort(
            (a, b) =>
                (b['placed_at'] as String).compareTo(a['placed_at'] as String),
          );
    return MockResponse.ok(orders);
  }

  Future<MockResponse> _get(MockRequest req) async {
    final userId = req.userId;
    if (userId == null) return MockResponse.unauthorized();
    final found = await _db.findById('orders', req.param('id')!);
    final order = found != null && MockAccounts.owns(found, userId)
        ? found
        : null;
    return order == null
        ? MockResponse.notFound('We couldn’t find this order.')
        : MockResponse.ok(_hydrate(order));
  }

  Future<MockResponse> _rate(MockRequest req) async {
    final userId = req.userId;
    if (userId == null) return MockResponse.unauthorized();
    final rating = (req.json['rating'] as num?)?.toInt() ?? 0;
    if (rating < 1 || rating > 5) {
      return MockResponse.validation('Rating must be between 1 and 5.');
    }
    final existing = await _db.findById('orders', req.param('id')!);
    if (existing == null || !MockAccounts.owns(existing, userId)) {
      return MockResponse.notFound();
    }
    final updated = await _db.update('orders', req.param('id')!, {
      'rating': rating,
    });
    return updated == null
        ? MockResponse.notFound()
        : MockResponse.ok(_hydrate(updated));
  }
}
