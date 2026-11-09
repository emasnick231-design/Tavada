import 'package:flutter/foundation.dart';
import 'package:tavada_eats/core/models/geo_point.dart';
import 'package:tavada_eats/features/location/domain/entities/place.dart';

/// Where the map opens when we know nothing better (central London).
const defaultMapCenter = GeoPoint(latitude: 51.4740, longitude: -0.0690);

/// Arguments of the "Choose location" route (`GoRouterState.extra`).
@immutable
class LocationPickerArgs {
  const LocationPickerArgs({
    this.center,
    this.place,
    this.popOnSelect = false,
  });

  /// Initial pin position; defaults to the saved address or [defaultMapCenter].
  final GeoPoint? center;

  /// Already-resolved address for [center] (e.g. a search result).
  final Place? place;

  /// Return to the caller (e.g. checkout) instead of going home.
  final bool popOnSelect;
}
