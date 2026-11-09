import 'dart:math' as math;

import 'package:tavada_eats/core/network/mock/mock_http.dart';

/// Fake geocoder: a small gazetteer of London and Lagos addresses.
///
/// `GET /geo/reverse?lat=&lng=` returns the nearest known place (or a
/// "dropped pin" when nothing is close), `GET /geo/search?q=` matches on
/// any word of the address.
class LocationMockApi implements MockApi {
  @override
  List<MockRoute> get routes => [
    MockRoute.get('/geo/reverse', _reverse),
    MockRoute.get('/geo/search', _search),
  ];

  static const _places = <Map<String, Object?>>[
    {
      'id': 'gb-fredrick',
      'title': '23, Fredrick Avenue',
      'subtitle': 'Peckham, London SE15 5JT',
      'city': 'London',
      'postcode': 'SE15 5JT',
      'lat': 51.4740,
      'lng': -0.0690,
    },
    {
      'id': 'gb-peckham-high',
      'title': '12 Peckham High Street',
      'subtitle': 'Peckham, London SE15 5DT',
      'city': 'London',
      'postcode': 'SE15 5DT',
      'lat': 51.4736,
      'lng': -0.0698,
    },
    {
      'id': 'gb-costco',
      'title': '24, Costco Wholesale',
      'subtitle': 'Croydon, London CR0 4XS',
      'city': 'London',
      'postcode': 'CR0 4XS',
      'lat': 51.3790,
      'lng': -0.1300,
    },
    {
      'id': 'gb-rye-lane',
      'title': '98 Rye Lane',
      'subtitle': 'Peckham, London SE15 4RZ',
      'city': 'London',
      'postcode': 'SE15 4RZ',
      'lat': 51.4697,
      'lng': -0.0687,
    },
    {
      'id': 'gb-old-kent',
      'title': '410 Old Kent Road',
      'subtitle': 'Southwark, London SE1 5AA',
      'city': 'London',
      'postcode': 'SE1 5AA',
      'lat': 51.4840,
      'lng': -0.0710,
    },
    {
      'id': 'gb-brixton',
      'title': '15 Atlantic Road',
      'subtitle': 'Brixton, London SW9 8HX',
      'city': 'London',
      'postcode': 'SW9 8HX',
      'lat': 51.4613,
      'lng': -0.1145,
    },
    {
      'id': 'gb-dalston',
      'title': '7 Kingsland High Street',
      'subtitle': 'Dalston, London E8 2JS',
      'city': 'London',
      'postcode': 'E8 2JS',
      'lat': 51.5470,
      'lng': -0.0755,
    },
    {
      'id': 'gb-daly',
      'title': 'Daly Court',
      'subtitle': 'Stratford, London E15 2DA',
      'city': 'London',
      'postcode': 'E15 2DA',
      'lat': 51.5431,
      'lng': -0.0020,
    },
    {
      'id': 'ie-dalymount',
      'title': 'Dalymount Park, Dalymount',
      'subtitle': 'Phibsborough, Dublin, Ireland',
      'city': 'Dublin',
      'country': 'Ireland',
      'lat': 53.3610,
      'lng': -6.2750,
    },
    {
      'id': 'ng-olufemi',
      'title': '54 Olufemi Akintunde St, Estate',
      'subtitle': 'Lekki, Lagos, Nigeria',
      'city': 'Lagos',
      'country': 'Nigeria',
      'lat': 6.4474,
      'lng': 3.4723,
    },
    {
      'id': 'ng-admiralty',
      'title': '3 Admiralty Way',
      'subtitle': 'Lekki Phase 1, Lagos, Nigeria',
      'city': 'Lagos',
      'country': 'Nigeria',
      'lat': 6.4433,
      'lng': 3.4710,
    },
    {
      'id': 'ng-allen',
      'title': '41 Allen Avenue',
      'subtitle': 'Ikeja, Lagos, Nigeria',
      'city': 'Lagos',
      'country': 'Nigeria',
      'lat': 6.6018,
      'lng': 3.3515,
    },
    {
      'id': 'tr-dalyan',
      'title': 'Dalyan',
      'subtitle': 'Ortaca, Muğla, Türkiye',
      'city': 'Muğla',
      'country': 'Türkiye',
      'lat': 36.8340,
      'lng': 28.6420,
    },
  ];

  static Map<String, Object?> _toJson(
    Map<String, Object?> p, {
    double? lat,
    double? lng,
  }) => {
    'id': p['id'],
    'title': p['title'],
    'subtitle': p['subtitle'],
    'city': p['city'],
    'postcode': p['postcode'],
    'country': p['country'] ?? 'United Kingdom',
    'location': {
      'latitude': lat ?? p['lat'],
      'longitude': lng ?? p['lng'],
    },
  };

  /// Rough distance in metres (equirectangular — fine at city scale).
  static double _metres(double lat1, double lng1, double lat2, double lng2) {
    const r = 6371000.0;
    final x =
        (lng2 - lng1) * math.pi / 180 * math.cos((lat1 + lat2) * math.pi / 360);
    final y = (lat2 - lat1) * math.pi / 180;
    return math.sqrt(x * x + y * y) * r;
  }

  Future<MockResponse> _reverse(MockRequest req) async {
    final lat = double.tryParse(req.queryString('lat') ?? '');
    final lng = double.tryParse(req.queryString('lng') ?? '');
    if (lat == null || lng == null) {
      return MockResponse.validation('lat and lng are required');
    }
    Map<String, Object?>? nearest;
    var best = double.infinity;
    for (final p in _places) {
      final d = _metres(lat, lng, p['lat']! as double, p['lng']! as double);
      if (d < best) {
        best = d;
        nearest = p;
      }
    }
    // Within ~300 m we "snap" to the known street; further away we keep the
    // pin where it is but borrow the area of the nearest place.
    if (nearest != null && best < 300) {
      return MockResponse.ok(_toJson(nearest, lat: lat, lng: lng));
    }
    final area = nearest == null || best > 30000 ? null : nearest;
    return MockResponse.ok({
      'id': 'pin-${lat.toStringAsFixed(5)},${lng.toStringAsFixed(5)}',
      'title': '${lat.toStringAsFixed(4)}, ${lng.toStringAsFixed(4)}',
      'subtitle': area?['subtitle'] ?? '',
      'city': area?['city'] ?? '',
      'country': area?['country'] ?? 'United Kingdom',
      'location': {'latitude': lat, 'longitude': lng},
    });
  }

  Future<MockResponse> _search(MockRequest req) async {
    final q = (req.queryString('q') ?? '').trim().toLowerCase();
    if (q.isEmpty) return MockResponse.ok(const <Object>[]);
    final hits = _places.where((p) {
      final text = '${p['title']} ${p['subtitle']}'.toLowerCase();
      return text.contains(q) ||
          text.split(RegExp(r'[\s,]+')).any((w) => w.startsWith(q));
    });
    return MockResponse.ok([for (final p in hits) _toJson(p)]);
  }
}
