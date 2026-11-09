import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/models/geo_point.dart';

part 'delivery_address.freezed.dart';
part 'delivery_address.g.dart';

/// A place we can deliver to. Shared by onboarding (location picker), home
/// header, checkout and order tracking.
@freezed
abstract class DeliveryAddress with _$DeliveryAddress {
  const factory DeliveryAddress({
    required String id,

    /// First line, e.g. "23, Fredrick Avenue".
    required String line1,

    /// City / area, e.g. "Lagos".
    required String city,
    required GeoPoint location,

    /// Second line, e.g. "Ajah 1000011".
    String? line2,
    String? postcode,
    String? country,

    /// Optional user label: "Home", "Work"…
    String? label,

    /// Free text instructions for the rider.
    String? instructions,
  }) = _DeliveryAddress;

  const DeliveryAddress._();

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) =>
      _$DeliveryAddressFromJson(json);

  /// "23, Fredrick Avenue, Ajah 1000011, Lagos, Nigeria"
  String get fullAddress => [
    line1,
    line2,
    city,
    country,
  ].whereType<String>().where((s) => s.isNotEmpty).join(', ');
}
