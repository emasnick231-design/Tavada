import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/models/delivery_address.dart';
import 'package:tavada_eats/core/models/geo_point.dart';

part 'place.freezed.dart';
part 'place.g.dart';

/// A geocoded place: search result or the address under the map pin.
@freezed
abstract class Place with _$Place {
  const factory Place({
    required String id,

    /// Street line, e.g. "54 Olufemi Akintunde St".
    required String title,
    required GeoPoint location,

    /// Area / city / country line.
    @Default('') String subtitle,
    @Default('') String city,
    String? postcode,
    String? country,
  }) = _Place;

  const Place._();

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  DeliveryAddress toAddress() => DeliveryAddress(
    id: id,
    line1: title,
    line2: subtitle.isEmpty ? null : subtitle,
    city: city,
    postcode: postcode,
    country: country,
    location: location,
  );
}
