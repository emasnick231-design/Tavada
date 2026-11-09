// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Restaurant _$RestaurantFromJson(Map<String, dynamic> json) => _Restaurant(
  id: json['id'] as String,
  name: json['name'] as String,
  logoUrl: json['logo_url'] as String,
  coverUrl: json['cover_url'] as String,
  cuisine: json['cuisine'] as String,
  rating: (json['rating'] as num).toDouble(),
  ratingCount: (json['rating_count'] as num).toInt(),
  etaMinutes: (json['eta_minutes'] as num).toInt(),
  distanceMiles: (json['distance_miles'] as num).toDouble(),
  deliveryFee: const MoneyConverter().fromJson(json['delivery_fee'] as num),
  shortAddress: json['short_address'] as String,
  address: json['address'] as String,
  location: GeoPoint.fromJson(json['location'] as Map<String, dynamic>),
  originalDeliveryFee: const NullableMoneyConverter().fromJson(
    json['original_delivery_fee'] as num?,
  ),
  promoLabel: json['promo_label'] as String?,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  categoryIds:
      (json['category_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  cuisineIds:
      (json['cuisine_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  dietaryLabels:
      (json['dietary_labels'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  offers:
      (json['offers'] as List<dynamic>?)
          ?.map((e) => RestaurantOffer.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  isOpen: json['is_open'] as bool? ?? true,
  reviewCount: (json['review_count'] as num?)?.toInt() ?? 0,
  opensAt: json['opens_at'] as String?,
  closesAt: json['closes_at'] as String?,
  openingHours:
      (json['opening_hours'] as List<dynamic>?)
          ?.map((e) => OpeningHours.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  allergyInfo: json['allergy_info'] as String?,
  aiSummary: json['ai_summary'] as String?,
  ordersLastYear: (json['orders_last_year'] as num?)?.toInt() ?? 0,
  isFeatured: json['is_featured'] as bool? ?? false,
  isAlcohol: json['is_alcohol'] as bool? ?? false,
);

Map<String, dynamic> _$RestaurantToJson(_Restaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo_url': instance.logoUrl,
      'cover_url': instance.coverUrl,
      'cuisine': instance.cuisine,
      'rating': instance.rating,
      'rating_count': instance.ratingCount,
      'eta_minutes': instance.etaMinutes,
      'distance_miles': instance.distanceMiles,
      'delivery_fee': const MoneyConverter().toJson(instance.deliveryFee),
      'short_address': instance.shortAddress,
      'address': instance.address,
      'location': instance.location.toJson(),
      'original_delivery_fee': ?const NullableMoneyConverter().toJson(
        instance.originalDeliveryFee,
      ),
      'promo_label': ?instance.promoLabel,
      'tags': instance.tags,
      'category_ids': instance.categoryIds,
      'cuisine_ids': instance.cuisineIds,
      'dietary_labels': instance.dietaryLabels,
      'offers': instance.offers.map((e) => e.toJson()).toList(),
      'is_open': instance.isOpen,
      'review_count': instance.reviewCount,
      'opens_at': ?instance.opensAt,
      'closes_at': ?instance.closesAt,
      'opening_hours': instance.openingHours.map((e) => e.toJson()).toList(),
      'allergy_info': ?instance.allergyInfo,
      'ai_summary': ?instance.aiSummary,
      'orders_last_year': instance.ordersLastYear,
      'is_featured': instance.isFeatured,
      'is_alcohol': instance.isAlcohol,
    };

_RestaurantOffer _$RestaurantOfferFromJson(Map<String, dynamic> json) =>
    _RestaurantOffer(
      id: json['id'] as String,
      type: $enumDecode(_$OfferTypeEnumMap, json['type']),
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
    );

Map<String, dynamic> _$RestaurantOfferToJson(_RestaurantOffer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$OfferTypeEnumMap[instance.type]!,
      'title': instance.title,
      'subtitle': instance.subtitle,
    };

const _$OfferTypeEnumMap = {
  OfferType.freeDelivery: 'free_delivery',
  OfferType.firstOrder: 'first_order',
  OfferType.discount: 'discount',
};

_OpeningHours _$OpeningHoursFromJson(Map<String, dynamic> json) =>
    _OpeningHours(days: json['days'] as String, hours: json['hours'] as String);

Map<String, dynamic> _$OpeningHoursToJson(_OpeningHours instance) =>
    <String, dynamic>{'days': instance.days, 'hours': instance.hours};
