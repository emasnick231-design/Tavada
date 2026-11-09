import 'package:tavada_eats/core/error/result.dart';
import 'package:tavada_eats/core/models/geo_point.dart';
import 'package:tavada_eats/features/location/domain/entities/place.dart';

/// Why the device position could not be read.
enum LocationIssue { serviceDisabled, denied, deniedForever, unavailable }

abstract interface class LocationRepository {
  /// Asks for permission when needed, then reads the device position.
  Future<Either<LocationIssue, GeoPoint>> currentPosition();

  /// Opens the OS settings for this app (after a permanent denial) or the
  /// location services settings.
  Future<void> openSettings(LocationIssue issue);

  FutureResult<Place> reverseGeocode(GeoPoint point);

  FutureResult<List<Place>> search(String query);
}
