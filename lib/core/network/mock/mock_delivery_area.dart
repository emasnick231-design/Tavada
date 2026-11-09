import 'package:tavada_eats/core/models/geo_point.dart';
import 'package:tavada_eats/core/network/mock/mock_http.dart';

extension MockRequestLocationX on MockRequest {
  /// Delivery address sent by the app (`X-Delivery-Location: lat,lng`).
  GeoPoint? get deliveryLocation {
    final raw =
        headers['X-Delivery-Location'] ?? headers['x-delivery-location'];
    final parts = '${raw ?? ''}'.split(',');
    if (parts.length != 2) return null;
    final lat = double.tryParse(parts[0]);
    final lng = double.tryParse(parts[1]);
    return lat == null || lng == null
        ? null
        : GeoPoint(latitude: lat, longitude: lng);
  }
}

/// Delivery coverage for the demo data.
///
/// The fixture stores all sit in London, but the app is demoed wherever the
/// tester is, so every store delivers to every address. Near the stores the
/// distance / ETA follow the address; further away the design's values are
/// kept (a real backend decides coverage itself).
abstract final class MockDeliveryArea {
  /// Beyond this the fixture distance / ETA are shown instead of real ones.
  static const radiusMiles = 6.0;

  /// Close to the demo address the fixture values (from the design) are
  /// kept; further away distance and ETA are computed.
  static const _fixtureRadius = 1.5;

  static GeoPoint? _locationOf(Map<String, dynamic> restaurant) {
    final loc = restaurant['location'];
    if (loc is! Map) return null;
    final lat = loc['latitude'];
    final lng = loc['longitude'];
    return lat is num && lng is num
        ? GeoPoint(latitude: lat.toDouble(), longitude: lng.toDouble())
        : null;
  }

  static double? milesTo(Map<String, dynamic> restaurant, GeoPoint? from) {
    final at = _locationOf(restaurant);
    if (from == null || at == null) return null;
    return from.distanceMilesTo(at);
  }

  /// Every demo store delivers everywhere (see class docs).
  static bool delivers(Map<String, dynamic> restaurant, GeoPoint? from) =>
      true;

  /// [restaurant] with distance / ETA for [from] (unchanged without one, or
  /// when the address is far from the demo stores).
  static Map<String, dynamic> adjust(
    Map<String, dynamic> restaurant,
    GeoPoint? from,
  ) {
    final miles = milesTo(restaurant, from);
    if (miles == null || miles <= _fixtureRadius || miles > radiusMiles) {
      return restaurant;
    }
    final eta = (restaurant['eta_minutes'] as num? ?? 20).toInt();
    return {
      ...restaurant,
      'distance_miles': (miles * 10).round() / 10,
      'eta_minutes': eta + ((miles - _fixtureRadius) * 4).round(),
    };
  }

  /// The store doesn't deliver to the address the app sent.
  static MockResponse? outOfRange(
    Map<String, dynamic> restaurant,
    MockRequest req, {
    required bool pickup,
  }) {
    if (pickup) return null;
    if (MockDeliveryArea.delivers(restaurant, req.deliveryLocation)) {
      return null;
    }
    final tr = '${req.headers['Accept-Language'] ?? ''}'.startsWith('tr');
    return MockResponse.validation(
      tr
          ? '${restaurant['name']} bu adrese teslimat yapmıyor. Başka bir adres seçin ya da gel-al deneyin.'
          : "${restaurant['name']} doesn't deliver to this address. Choose another address or try pickup.",
      code: 'out_of_delivery_area',
    );
  }
}
