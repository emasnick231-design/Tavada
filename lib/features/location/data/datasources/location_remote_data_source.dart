import 'package:tavada_eats/core/models/geo_point.dart';
import 'package:tavada_eats/core/network/api_client.dart';
import 'package:tavada_eats/features/location/domain/entities/place.dart';

/// Endpoints owned by the location feature.
abstract final class LocationEndpoints {
  static const reverse = '/geo/reverse';
  static const search = '/geo/search';
}

class LocationRemoteDataSource {
  LocationRemoteDataSource(this._client);

  final ApiClient _client;

  Future<Place> reverseGeocode(GeoPoint point) async => Place.fromJson(
    await _client.get<Map<String, dynamic>>(
      LocationEndpoints.reverse,
      query: {'lat': point.latitude, 'lng': point.longitude},
    ),
  );

  Future<List<Place>> search(String query) async =>
      (await _client.get<List<dynamic>>(
        LocationEndpoints.search,
        query: {'q': query},
      )).map((e) => Place.fromJson(e as Map<String, dynamic>)).toList();
}
