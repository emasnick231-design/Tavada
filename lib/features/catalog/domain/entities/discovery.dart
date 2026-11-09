import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/features/catalog/domain/entities/menu.dart';
import 'package:tavada_eats/features/catalog/domain/entities/restaurant.dart';

part 'discovery.freezed.dart';
part 'discovery.g.dart';

/// Meal category with a flat illustration ("Breakfast", "Rice & Grains").
@freezed
abstract class Category with _$Category {
  const factory Category({
    required String id,
    required String name,
    required String imageUrl,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

/// Regional cuisine ("Nigerian", "South African").
@freezed
abstract class Cuisine with _$Cuisine {
  const factory Cuisine({
    required String id,
    required String name,
    required String imageUrl,
  }) = _Cuisine;

  factory Cuisine.fromJson(Map<String, dynamic> json) =>
      _$CuisineFromJson(json);
}

/// Dietary preference option ("Halal", "Vegan").
@freezed
abstract class DietaryOption with _$DietaryOption {
  const factory DietaryOption({required String id, required String name}) =
      _DietaryOption;

  factory DietaryOption.fromJson(Map<String, dynamic> json) =>
      _$DietaryOptionFromJson(json);
}

@JsonEnum(fieldRename: FieldRename.snake)
enum BannerStyle { teal, pink, lavender, cream }

/// Home promo banner ("Get 10% off your first order! [First timers]").
@freezed
abstract class PromoBanner with _$PromoBanner {
  const factory PromoBanner({
    required String id,
    required String title,
    required String ctaLabel,
    required String imageUrl,
    @Default(BannerStyle.teal) BannerStyle style,

    /// Optional in-app location to open (e.g. `/restaurants?section=…`).
    String? deepLink,
  }) = _PromoBanner;

  factory PromoBanner.fromJson(Map<String, dynamic> json) =>
      _$PromoBannerFromJson(json);
}

@JsonEnum(fieldRename: FieldRename.snake)
enum HomeSectionLayout {
  /// Horizontal rail of large restaurant cards.
  carousel,

  /// Two-row horizontal grid of logo tiles ("Featured stores").
  storeGrid,
}

@freezed
abstract class HomeSection with _$HomeSection {
  const factory HomeSection({
    required String id,
    required String title,
    @Default(HomeSectionLayout.carousel) HomeSectionLayout layout,
    @Default([]) List<Restaurant> restaurants,
    String? subtitle,

    /// Emoji/icon suffix after the title ("⚡️").
    String? titleEmoji,
  }) = _HomeSection;

  factory HomeSection.fromJson(Map<String, dynamic> json) =>
      _$HomeSectionFromJson(json);
}

@freezed
abstract class HomeFeed with _$HomeFeed {
  const factory HomeFeed({
    @Default([]) List<PromoBanner> banners,
    @Default([]) List<Category> categories,
    @Default([]) List<HomeSection> sections,
  }) = _HomeFeed;

  factory HomeFeed.fromJson(Map<String, dynamic> json) =>
      _$HomeFeedFromJson(json);
}

/// Options for the filter sheets (cuisines, dietary, delivery fee range).
@freezed
abstract class CatalogFilters with _$CatalogFilters {
  const factory CatalogFilters({
    @Default([]) List<Cuisine> cuisines,
    @Default([]) List<DietaryOption> dietary,
    @Default(10) double maxDeliveryFee,
  }) = _CatalogFilters;

  factory CatalogFilters.fromJson(Map<String, dynamic> json) =>
      _$CatalogFiltersFromJson(json);
}

/// One restaurant in search results with the dishes that matched.
@freezed
abstract class RestaurantSearchHit with _$RestaurantSearchHit {
  const factory RestaurantSearchHit({
    required Restaurant restaurant,
    @Default([]) List<MenuItem> dishes,
  }) = _RestaurantSearchHit;

  factory RestaurantSearchHit.fromJson(Map<String, dynamic> json) =>
      _$RestaurantSearchHitFromJson(json);
}

@freezed
abstract class SearchResults with _$SearchResults {
  const factory SearchResults({
    required String query,
    @Default([]) List<RestaurantSearchHit> hits,
    @Default(0) int total,

    /// Cuisine the query names ("Nigerian", "nigerian food"), if any.
    String? cuisineId,
  }) = _SearchResults;

  const SearchResults._();

  factory SearchResults.fromJson(Map<String, dynamic> json) =>
      _$SearchResultsFromJson(json);

  bool get isEmpty => hits.isEmpty;
}
