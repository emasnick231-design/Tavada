import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tavada_eats/core/error/result.dart';
import 'package:tavada_eats/core/models/geo_point.dart';
import 'package:tavada_eats/features/location/data/datasources/location_remote_data_source.dart';
import 'package:tavada_eats/features/location/domain/entities/place.dart';
import 'package:tavada_eats/features/location/domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  LocationRepositoryImpl(this._remote);

  final LocationRemoteDataSource _remote;

  @override
  Future<Either<LocationIssue, GeoPoint>> currentPosition() async {
    try {
      if (!await Geolocator.isLocationServiceEnabled()) {
        return left(LocationIssue.serviceDisabled);
      }
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      switch (permission) {
        case LocationPermission.denied:
          return left(LocationIssue.denied);
        case LocationPermission.deniedForever:
          return left(LocationIssue.deniedForever);
        case LocationPermission.whileInUse:
        case LocationPermission.always:
        case LocationPermission.unableToDetermine:
          break;
      }
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 10),
        ),
      );
      return right(
        GeoPoint(latitude: position.latitude, longitude: position.longitude),
      );
    } on Exception {
      return left(LocationIssue.unavailable);
    }
  }

  @override
  Future<void> openSettings(LocationIssue issue) async {
    if (issue == LocationIssue.serviceDisabled) {
      await Geolocator.openLocationSettings();
    } else {
      await Geolocator.openAppSettings();
    }
  }

  @override
  FutureResult<Place> reverseGeocode(GeoPoint point) =>
      guard(() => _remote.reverseGeocode(point));

  @override
  FutureResult<List<Place>> search(String query) =>
      guard(() => _remote.search(query));
}
