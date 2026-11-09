import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/models/geo_point.dart';
import 'package:tavada_eats/core/models/money.dart';

part 'restaurant.freezed.dart';
part 'restaurant.g.dart';

/// A store/restaurant on the marketplace.
///
/// Entities double as API models (json_serializable, snake_case keys) — a
/// separate DTO layer is only worth it once the backend shape diverges.
@freezed
abstract class Restaurant with _$Restaurant {
  const factory Restaurant({
    required String id,
    required String name,
    required String logoUrl,
    required String coverUrl,

    /// Primary cuisine label shown above the name ("Nigerian").
    required String cuisine,
    required double rating,
    required int ratingCount,

    /// Delivery ETA in minutes ("20 min" pill).
    required int etaMinutes,
    required double distanceMiles,
    @MoneyConverter() required Money deliveryFee,

    /// Street line shown in the header ("28 High Street").
    required String shortAddress,

    /// Full address in the info sheet.
    required String address,
    required GeoPoint location,

    /// Struck-through fee when delivery is discounted.
    @NullableMoneyConverter() Money? originalDeliveryFee,

    /// Promo badge on the cover ("Over 40% off").
    String? promoLabel,

    /// Descriptive tags ("Caribbean · Chicken · Halal · African").
    @Default([]) List<String> tags,
    @Default([]) List<String> categoryIds,
    @Default([]) List<String> cuisineIds,
    @Default([]) List<String> dietaryLabels,
    @Default([]) List<RestaurantOffer> offers,
    @Default(true) bool isOpen,

    /// Written reviews (comments), as listed on the reviews page.
    @Default(0) int reviewCount,

    /// "11:00 AM" — when closed, when it opens next.
    String? opensAt,

    /// "22:00 PM" — closing time today.
    String? closesAt,
    @Default([]) List<OpeningHours> openingHours,
    String? allergyInfo,

    /// AI generated review summary.
    String? aiSummary,
    @Default(0) int ordersLastYear,
    @Default(false) bool isFeatured,
    @Default(false) bool isAlcohol,
  }) = _Restaurant;

  const Restaurant._();

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  bool get hasFreeDelivery => deliveryFee.isZero;

  /// Hero tag shared by cards and the restaurant header image.
  String get coverHeroTag => 'restaurant-cover-$id';
  String get logoHeroTag => 'restaurant-logo-$id';
}

@JsonEnum(fieldRename: FieldRename.snake)
enum OfferType { freeDelivery, firstOrder, discount }

/// Promo tiles on the restaurant page ("Free delivery — Don't worry, it's
/// on us", "First order deal — 15% off your next meal").
@freezed
abstract class RestaurantOffer with _$RestaurantOffer {
  const factory RestaurantOffer({
    required String id,
    required OfferType type,
    required String title,
    required String subtitle,
  }) = _RestaurantOffer;

  factory RestaurantOffer.fromJson(Map<String, dynamic> json) =>
      _$RestaurantOfferFromJson(json);
}

@freezed
abstract class OpeningHours with _$OpeningHours {
  const factory OpeningHours({required String days, required String hours}) =
      _OpeningHours;

  factory OpeningHours.fromJson(Map<String, dynamic> json) =>
      _$OpeningHoursFromJson(json);
}
