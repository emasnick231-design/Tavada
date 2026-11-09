// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discovery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Category _$CategoryFromJson(Map<String, dynamic> json) => _Category(
  id: json['id'] as String,
  name: json['name'] as String,
  imageUrl: json['image_url'] as String,
);

Map<String, dynamic> _$CategoryToJson(_Category instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image_url': instance.imageUrl,
};

_Cuisine _$CuisineFromJson(Map<String, dynamic> json) => _Cuisine(
  id: json['id'] as String,
  name: json['name'] as String,
  imageUrl: json['image_url'] as String,
);

Map<String, dynamic> _$CuisineToJson(_Cuisine instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image_url': instance.imageUrl,
};

_DietaryOption _$DietaryOptionFromJson(Map<String, dynamic> json) =>
    _DietaryOption(id: json['id'] as String, name: json['name'] as String);

Map<String, dynamic> _$DietaryOptionToJson(_DietaryOption instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_PromoBanner _$PromoBannerFromJson(Map<String, dynamic> json) => _PromoBanner(
  id: json['id'] as String,
  title: json['title'] as String,
  ctaLabel: json['cta_label'] as String,
  imageUrl: json['image_url'] as String,
  style:
      $enumDecodeNullable(_$BannerStyleEnumMap, json['style']) ??
      BannerStyle.teal,
  deepLink: json['deep_link'] as String?,
);

Map<String, dynamic> _$PromoBannerToJson(_PromoBanner instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'cta_label': instance.ctaLabel,
      'image_url': instance.imageUrl,
      'style': _$BannerStyleEnumMap[instance.style]!,
      'deep_link': ?instance.deepLink,
    };

const _$BannerStyleEnumMap = {
  BannerStyle.teal: 'teal',
  BannerStyle.pink: 'pink',
  BannerStyle.lavender: 'lavender',
  BannerStyle.cream: 'cream',
};

_HomeSection _$HomeSectionFromJson(Map<String, dynamic> json) => _HomeSection(
  id: json['id'] as String,
  title: json['title'] as String,
  layout:
      $enumDecodeNullable(_$HomeSectionLayoutEnumMap, json['layout']) ??
      HomeSectionLayout.carousel,
  restaurants:
      (json['restaurants'] as List<dynamic>?)
          ?.map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  subtitle: json['subtitle'] as String?,
  titleEmoji: json['title_emoji'] as String?,
);

Map<String, dynamic> _$HomeSectionToJson(_HomeSection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'layout': _$HomeSectionLayoutEnumMap[instance.layout]!,
      'restaurants': instance.restaurants.map((e) => e.toJson()).toList(),
      'subtitle': ?instance.subtitle,
      'title_emoji': ?instance.titleEmoji,
    };

const _$HomeSectionLayoutEnumMap = {
  HomeSectionLayout.carousel: 'carousel',
  HomeSectionLayout.storeGrid: 'store_grid',
};

_HomeFeed _$HomeFeedFromJson(Map<String, dynamic> json) => _HomeFeed(
  banners:
      (json['banners'] as List<dynamic>?)
          ?.map((e) => PromoBanner.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  sections:
      (json['sections'] as List<dynamic>?)
          ?.map((e) => HomeSection.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$HomeFeedToJson(_HomeFeed instance) => <String, dynamic>{
  'banners': instance.banners.map((e) => e.toJson()).toList(),
  'categories': instance.categories.map((e) => e.toJson()).toList(),
  'sections': instance.sections.map((e) => e.toJson()).toList(),
};

_CatalogFilters _$CatalogFiltersFromJson(Map<String, dynamic> json) =>
    _CatalogFilters(
      cuisines:
          (json['cuisines'] as List<dynamic>?)
              ?.map((e) => Cuisine.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      dietary:
          (json['dietary'] as List<dynamic>?)
              ?.map((e) => DietaryOption.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      maxDeliveryFee: (json['max_delivery_fee'] as num?)?.toDouble() ?? 10,
    );

Map<String, dynamic> _$CatalogFiltersToJson(_CatalogFilters instance) =>
    <String, dynamic>{
      'cuisines': instance.cuisines.map((e) => e.toJson()).toList(),
      'dietary': instance.dietary.map((e) => e.toJson()).toList(),
      'max_delivery_fee': instance.maxDeliveryFee,
    };

_RestaurantSearchHit _$RestaurantSearchHitFromJson(Map<String, dynamic> json) =>
    _RestaurantSearchHit(
      restaurant: Restaurant.fromJson(
        json['restaurant'] as Map<String, dynamic>,
      ),
      dishes:
          (json['dishes'] as List<dynamic>?)
              ?.map((e) => MenuItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RestaurantSearchHitToJson(
  _RestaurantSearchHit instance,
) => <String, dynamic>{
  'restaurant': instance.restaurant.toJson(),
  'dishes': instance.dishes.map((e) => e.toJson()).toList(),
};

_SearchResults _$SearchResultsFromJson(Map<String, dynamic> json) =>
    _SearchResults(
      query: json['query'] as String,
      hits:
          (json['hits'] as List<dynamic>?)
              ?.map(
                (e) => RestaurantSearchHit.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      total: (json['total'] as num?)?.toInt() ?? 0,
      cuisineId: json['cuisine_id'] as String?,
    );

Map<String, dynamic> _$SearchResultsToJson(_SearchResults instance) =>
    <String, dynamic>{
      'query': instance.query,
      'hits': instance.hits.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'cuisine_id': ?instance.cuisineId,
    };
