import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_filter.freezed.dart';

/// Query for restaurant listings (home filters, "see all", search).
@freezed
abstract class RestaurantFilter with _$RestaurantFilter {
  const factory RestaurantFilter({
    /// Home rail id, e.g. `places_near_you`, `special_discounts`.
    String? section,
    String? categoryId,
    @Default({}) Set<String> cuisineIds,
    @Default({}) Set<String> dietaryIds,
    @Default(false) bool discountsOnly,
    @Default(false) bool topRated,
    @Default(false) bool under30Minutes,
    @Default(false) bool offersOnly,
    double? maxDeliveryFee,
    String? query,
  }) = _RestaurantFilter;

  const RestaurantFilter._();

  /// True when any user-facing filter is applied (shows "N results · Reset").
  bool get isActive =>
      categoryId != null ||
      cuisineIds.isNotEmpty ||
      dietaryIds.isNotEmpty ||
      discountsOnly ||
      topRated ||
      under30Minutes ||
      offersOnly ||
      maxDeliveryFee != null ||
      (query?.isNotEmpty ?? false);

  Map<String, dynamic> toQuery() => {
    'section': section,
    'category': categoryId,
    'cuisines': cuisineIds.isEmpty ? null : cuisineIds.join(','),
    'dietary': dietaryIds.isEmpty ? null : dietaryIds.join(','),
    'discounts': discountsOnly ? 'true' : null,
    'top_rated': topRated ? 'true' : null,
    'max_eta': under30Minutes ? 30 : null,
    'offers': offersOnly ? 'true' : null,
    'max_delivery_fee': maxDeliveryFee,
    'q': query,
  };
}
