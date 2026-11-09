// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Restaurant {

 String get id; String get name; String get logoUrl; String get coverUrl;/// Primary cuisine label shown above the name ("Nigerian").
 String get cuisine; double get rating; int get ratingCount;/// Delivery ETA in minutes ("20 min" pill).
 int get etaMinutes; double get distanceMiles;@MoneyConverter() Money get deliveryFee;/// Street line shown in the header ("28 High Street").
 String get shortAddress;/// Full address in the info sheet.
 String get address; GeoPoint get location;/// Struck-through fee when delivery is discounted.
@NullableMoneyConverter() Money? get originalDeliveryFee;/// Promo badge on the cover ("Over 40% off").
 String? get promoLabel;/// Descriptive tags ("Caribbean · Chicken · Halal · African").
 List<String> get tags; List<String> get categoryIds; List<String> get cuisineIds; List<String> get dietaryLabels; List<RestaurantOffer> get offers; bool get isOpen;/// Written reviews (comments), as listed on the reviews page.
 int get reviewCount;/// "11:00 AM" — when closed, when it opens next.
 String? get opensAt;/// "22:00 PM" — closing time today.
 String? get closesAt; List<OpeningHours> get openingHours; String? get allergyInfo;/// AI generated review summary.
 String? get aiSummary; int get ordersLastYear; bool get isFeatured; bool get isAlcohol;
/// Create a copy of Restaurant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RestaurantCopyWith<Restaurant> get copyWith => _$RestaurantCopyWithImpl<Restaurant>(this as Restaurant, _$identity);

  /// Serializes this Restaurant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Restaurant&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.cuisine, cuisine) || other.cuisine == cuisine)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.ratingCount, ratingCount) || other.ratingCount == ratingCount)&&(identical(other.etaMinutes, etaMinutes) || other.etaMinutes == etaMinutes)&&(identical(other.distanceMiles, distanceMiles) || other.distanceMiles == distanceMiles)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.shortAddress, shortAddress) || other.shortAddress == shortAddress)&&(identical(other.address, address) || other.address == address)&&(identical(other.location, location) || other.location == location)&&(identical(other.originalDeliveryFee, originalDeliveryFee) || other.originalDeliveryFee == originalDeliveryFee)&&(identical(other.promoLabel, promoLabel) || other.promoLabel == promoLabel)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.categoryIds, categoryIds)&&const DeepCollectionEquality().equals(other.cuisineIds, cuisineIds)&&const DeepCollectionEquality().equals(other.dietaryLabels, dietaryLabels)&&const DeepCollectionEquality().equals(other.offers, offers)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.opensAt, opensAt) || other.opensAt == opensAt)&&(identical(other.closesAt, closesAt) || other.closesAt == closesAt)&&const DeepCollectionEquality().equals(other.openingHours, openingHours)&&(identical(other.allergyInfo, allergyInfo) || other.allergyInfo == allergyInfo)&&(identical(other.aiSummary, aiSummary) || other.aiSummary == aiSummary)&&(identical(other.ordersLastYear, ordersLastYear) || other.ordersLastYear == ordersLastYear)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured)&&(identical(other.isAlcohol, isAlcohol) || other.isAlcohol == isAlcohol));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,logoUrl,coverUrl,cuisine,rating,ratingCount,etaMinutes,distanceMiles,deliveryFee,shortAddress,address,location,originalDeliveryFee,promoLabel,const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(categoryIds),const DeepCollectionEquality().hash(cuisineIds),const DeepCollectionEquality().hash(dietaryLabels),const DeepCollectionEquality().hash(offers),isOpen,reviewCount,opensAt,closesAt,const DeepCollectionEquality().hash(openingHours),allergyInfo,aiSummary,ordersLastYear,isFeatured,isAlcohol]);

@override
String toString() {
  return 'Restaurant(id: $id, name: $name, logoUrl: $logoUrl, coverUrl: $coverUrl, cuisine: $cuisine, rating: $rating, ratingCount: $ratingCount, etaMinutes: $etaMinutes, distanceMiles: $distanceMiles, deliveryFee: $deliveryFee, shortAddress: $shortAddress, address: $address, location: $location, originalDeliveryFee: $originalDeliveryFee, promoLabel: $promoLabel, tags: $tags, categoryIds: $categoryIds, cuisineIds: $cuisineIds, dietaryLabels: $dietaryLabels, offers: $offers, isOpen: $isOpen, reviewCount: $reviewCount, opensAt: $opensAt, closesAt: $closesAt, openingHours: $openingHours, allergyInfo: $allergyInfo, aiSummary: $aiSummary, ordersLastYear: $ordersLastYear, isFeatured: $isFeatured, isAlcohol: $isAlcohol)';
}


}

/// @nodoc
abstract mixin class $RestaurantCopyWith<$Res>  {
  factory $RestaurantCopyWith(Restaurant value, $Res Function(Restaurant) _then) = _$RestaurantCopyWithImpl;
@useResult
$Res call({
 String id, String name, String logoUrl, String coverUrl, String cuisine, double rating, int ratingCount, int etaMinutes, double distanceMiles,@MoneyConverter() Money deliveryFee, String shortAddress, String address, GeoPoint location,@NullableMoneyConverter() Money? originalDeliveryFee, String? promoLabel, List<String> tags, List<String> categoryIds, List<String> cuisineIds, List<String> dietaryLabels, List<RestaurantOffer> offers, bool isOpen, int reviewCount, String? opensAt, String? closesAt, List<OpeningHours> openingHours, String? allergyInfo, String? aiSummary, int ordersLastYear, bool isFeatured, bool isAlcohol
});


$GeoPointCopyWith<$Res> get location;

}
/// @nodoc
class _$RestaurantCopyWithImpl<$Res>
    implements $RestaurantCopyWith<$Res> {
  _$RestaurantCopyWithImpl(this._self, this._then);

  final Restaurant _self;
  final $Res Function(Restaurant) _then;

/// Create a copy of Restaurant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? logoUrl = null,Object? coverUrl = null,Object? cuisine = null,Object? rating = null,Object? ratingCount = null,Object? etaMinutes = null,Object? distanceMiles = null,Object? deliveryFee = null,Object? shortAddress = null,Object? address = null,Object? location = null,Object? originalDeliveryFee = freezed,Object? promoLabel = freezed,Object? tags = null,Object? categoryIds = null,Object? cuisineIds = null,Object? dietaryLabels = null,Object? offers = null,Object? isOpen = null,Object? reviewCount = null,Object? opensAt = freezed,Object? closesAt = freezed,Object? openingHours = null,Object? allergyInfo = freezed,Object? aiSummary = freezed,Object? ordersLastYear = null,Object? isFeatured = null,Object? isAlcohol = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,cuisine: null == cuisine ? _self.cuisine : cuisine // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,ratingCount: null == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int,etaMinutes: null == etaMinutes ? _self.etaMinutes : etaMinutes // ignore: cast_nullable_to_non_nullable
as int,distanceMiles: null == distanceMiles ? _self.distanceMiles : distanceMiles // ignore: cast_nullable_to_non_nullable
as double,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as Money,shortAddress: null == shortAddress ? _self.shortAddress : shortAddress // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as GeoPoint,originalDeliveryFee: freezed == originalDeliveryFee ? _self.originalDeliveryFee : originalDeliveryFee // ignore: cast_nullable_to_non_nullable
as Money?,promoLabel: freezed == promoLabel ? _self.promoLabel : promoLabel // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,categoryIds: null == categoryIds ? _self.categoryIds : categoryIds // ignore: cast_nullable_to_non_nullable
as List<String>,cuisineIds: null == cuisineIds ? _self.cuisineIds : cuisineIds // ignore: cast_nullable_to_non_nullable
as List<String>,dietaryLabels: null == dietaryLabels ? _self.dietaryLabels : dietaryLabels // ignore: cast_nullable_to_non_nullable
as List<String>,offers: null == offers ? _self.offers : offers // ignore: cast_nullable_to_non_nullable
as List<RestaurantOffer>,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,opensAt: freezed == opensAt ? _self.opensAt : opensAt // ignore: cast_nullable_to_non_nullable
as String?,closesAt: freezed == closesAt ? _self.closesAt : closesAt // ignore: cast_nullable_to_non_nullable
as String?,openingHours: null == openingHours ? _self.openingHours : openingHours // ignore: cast_nullable_to_non_nullable
as List<OpeningHours>,allergyInfo: freezed == allergyInfo ? _self.allergyInfo : allergyInfo // ignore: cast_nullable_to_non_nullable
as String?,aiSummary: freezed == aiSummary ? _self.aiSummary : aiSummary // ignore: cast_nullable_to_non_nullable
as String?,ordersLastYear: null == ordersLastYear ? _self.ordersLastYear : ordersLastYear // ignore: cast_nullable_to_non_nullable
as int,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,isAlcohol: null == isAlcohol ? _self.isAlcohol : isAlcohol // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of Restaurant
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res> get location {
  
  return $GeoPointCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [Restaurant].
extension RestaurantPatterns on Restaurant {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Restaurant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Restaurant() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Restaurant value)  $default,){
final _that = this;
switch (_that) {
case _Restaurant():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Restaurant value)?  $default,){
final _that = this;
switch (_that) {
case _Restaurant() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String logoUrl,  String coverUrl,  String cuisine,  double rating,  int ratingCount,  int etaMinutes,  double distanceMiles, @MoneyConverter()  Money deliveryFee,  String shortAddress,  String address,  GeoPoint location, @NullableMoneyConverter()  Money? originalDeliveryFee,  String? promoLabel,  List<String> tags,  List<String> categoryIds,  List<String> cuisineIds,  List<String> dietaryLabels,  List<RestaurantOffer> offers,  bool isOpen,  int reviewCount,  String? opensAt,  String? closesAt,  List<OpeningHours> openingHours,  String? allergyInfo,  String? aiSummary,  int ordersLastYear,  bool isFeatured,  bool isAlcohol)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Restaurant() when $default != null:
return $default(_that.id,_that.name,_that.logoUrl,_that.coverUrl,_that.cuisine,_that.rating,_that.ratingCount,_that.etaMinutes,_that.distanceMiles,_that.deliveryFee,_that.shortAddress,_that.address,_that.location,_that.originalDeliveryFee,_that.promoLabel,_that.tags,_that.categoryIds,_that.cuisineIds,_that.dietaryLabels,_that.offers,_that.isOpen,_that.reviewCount,_that.opensAt,_that.closesAt,_that.openingHours,_that.allergyInfo,_that.aiSummary,_that.ordersLastYear,_that.isFeatured,_that.isAlcohol);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String logoUrl,  String coverUrl,  String cuisine,  double rating,  int ratingCount,  int etaMinutes,  double distanceMiles, @MoneyConverter()  Money deliveryFee,  String shortAddress,  String address,  GeoPoint location, @NullableMoneyConverter()  Money? originalDeliveryFee,  String? promoLabel,  List<String> tags,  List<String> categoryIds,  List<String> cuisineIds,  List<String> dietaryLabels,  List<RestaurantOffer> offers,  bool isOpen,  int reviewCount,  String? opensAt,  String? closesAt,  List<OpeningHours> openingHours,  String? allergyInfo,  String? aiSummary,  int ordersLastYear,  bool isFeatured,  bool isAlcohol)  $default,) {final _that = this;
switch (_that) {
case _Restaurant():
return $default(_that.id,_that.name,_that.logoUrl,_that.coverUrl,_that.cuisine,_that.rating,_that.ratingCount,_that.etaMinutes,_that.distanceMiles,_that.deliveryFee,_that.shortAddress,_that.address,_that.location,_that.originalDeliveryFee,_that.promoLabel,_that.tags,_that.categoryIds,_that.cuisineIds,_that.dietaryLabels,_that.offers,_that.isOpen,_that.reviewCount,_that.opensAt,_that.closesAt,_that.openingHours,_that.allergyInfo,_that.aiSummary,_that.ordersLastYear,_that.isFeatured,_that.isAlcohol);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String logoUrl,  String coverUrl,  String cuisine,  double rating,  int ratingCount,  int etaMinutes,  double distanceMiles, @MoneyConverter()  Money deliveryFee,  String shortAddress,  String address,  GeoPoint location, @NullableMoneyConverter()  Money? originalDeliveryFee,  String? promoLabel,  List<String> tags,  List<String> categoryIds,  List<String> cuisineIds,  List<String> dietaryLabels,  List<RestaurantOffer> offers,  bool isOpen,  int reviewCount,  String? opensAt,  String? closesAt,  List<OpeningHours> openingHours,  String? allergyInfo,  String? aiSummary,  int ordersLastYear,  bool isFeatured,  bool isAlcohol)?  $default,) {final _that = this;
switch (_that) {
case _Restaurant() when $default != null:
return $default(_that.id,_that.name,_that.logoUrl,_that.coverUrl,_that.cuisine,_that.rating,_that.ratingCount,_that.etaMinutes,_that.distanceMiles,_that.deliveryFee,_that.shortAddress,_that.address,_that.location,_that.originalDeliveryFee,_that.promoLabel,_that.tags,_that.categoryIds,_that.cuisineIds,_that.dietaryLabels,_that.offers,_that.isOpen,_that.reviewCount,_that.opensAt,_that.closesAt,_that.openingHours,_that.allergyInfo,_that.aiSummary,_that.ordersLastYear,_that.isFeatured,_that.isAlcohol);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Restaurant extends Restaurant {
  const _Restaurant({required this.id, required this.name, required this.logoUrl, required this.coverUrl, required this.cuisine, required this.rating, required this.ratingCount, required this.etaMinutes, required this.distanceMiles, @MoneyConverter() required this.deliveryFee, required this.shortAddress, required this.address, required this.location, @NullableMoneyConverter() this.originalDeliveryFee, this.promoLabel, final  List<String> tags = const [], final  List<String> categoryIds = const [], final  List<String> cuisineIds = const [], final  List<String> dietaryLabels = const [], final  List<RestaurantOffer> offers = const [], this.isOpen = true, this.reviewCount = 0, this.opensAt, this.closesAt, final  List<OpeningHours> openingHours = const [], this.allergyInfo, this.aiSummary, this.ordersLastYear = 0, this.isFeatured = false, this.isAlcohol = false}): _tags = tags,_categoryIds = categoryIds,_cuisineIds = cuisineIds,_dietaryLabels = dietaryLabels,_offers = offers,_openingHours = openingHours,super._();
  factory _Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json);

@override final  String id;
@override final  String name;
@override final  String logoUrl;
@override final  String coverUrl;
/// Primary cuisine label shown above the name ("Nigerian").
@override final  String cuisine;
@override final  double rating;
@override final  int ratingCount;
/// Delivery ETA in minutes ("20 min" pill).
@override final  int etaMinutes;
@override final  double distanceMiles;
@override@MoneyConverter() final  Money deliveryFee;
/// Street line shown in the header ("28 High Street").
@override final  String shortAddress;
/// Full address in the info sheet.
@override final  String address;
@override final  GeoPoint location;
/// Struck-through fee when delivery is discounted.
@override@NullableMoneyConverter() final  Money? originalDeliveryFee;
/// Promo badge on the cover ("Over 40% off").
@override final  String? promoLabel;
/// Descriptive tags ("Caribbean · Chicken · Halal · African").
 final  List<String> _tags;
/// Descriptive tags ("Caribbean · Chicken · Halal · African").
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  List<String> _categoryIds;
@override@JsonKey() List<String> get categoryIds {
  if (_categoryIds is EqualUnmodifiableListView) return _categoryIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categoryIds);
}

 final  List<String> _cuisineIds;
@override@JsonKey() List<String> get cuisineIds {
  if (_cuisineIds is EqualUnmodifiableListView) return _cuisineIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cuisineIds);
}

 final  List<String> _dietaryLabels;
@override@JsonKey() List<String> get dietaryLabels {
  if (_dietaryLabels is EqualUnmodifiableListView) return _dietaryLabels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dietaryLabels);
}

 final  List<RestaurantOffer> _offers;
@override@JsonKey() List<RestaurantOffer> get offers {
  if (_offers is EqualUnmodifiableListView) return _offers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_offers);
}

@override@JsonKey() final  bool isOpen;
/// Written reviews (comments), as listed on the reviews page.
@override@JsonKey() final  int reviewCount;
/// "11:00 AM" — when closed, when it opens next.
@override final  String? opensAt;
/// "22:00 PM" — closing time today.
@override final  String? closesAt;
 final  List<OpeningHours> _openingHours;
@override@JsonKey() List<OpeningHours> get openingHours {
  if (_openingHours is EqualUnmodifiableListView) return _openingHours;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_openingHours);
}

@override final  String? allergyInfo;
/// AI generated review summary.
@override final  String? aiSummary;
@override@JsonKey() final  int ordersLastYear;
@override@JsonKey() final  bool isFeatured;
@override@JsonKey() final  bool isAlcohol;

/// Create a copy of Restaurant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RestaurantCopyWith<_Restaurant> get copyWith => __$RestaurantCopyWithImpl<_Restaurant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RestaurantToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Restaurant&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.cuisine, cuisine) || other.cuisine == cuisine)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.ratingCount, ratingCount) || other.ratingCount == ratingCount)&&(identical(other.etaMinutes, etaMinutes) || other.etaMinutes == etaMinutes)&&(identical(other.distanceMiles, distanceMiles) || other.distanceMiles == distanceMiles)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.shortAddress, shortAddress) || other.shortAddress == shortAddress)&&(identical(other.address, address) || other.address == address)&&(identical(other.location, location) || other.location == location)&&(identical(other.originalDeliveryFee, originalDeliveryFee) || other.originalDeliveryFee == originalDeliveryFee)&&(identical(other.promoLabel, promoLabel) || other.promoLabel == promoLabel)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._categoryIds, _categoryIds)&&const DeepCollectionEquality().equals(other._cuisineIds, _cuisineIds)&&const DeepCollectionEquality().equals(other._dietaryLabels, _dietaryLabels)&&const DeepCollectionEquality().equals(other._offers, _offers)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.opensAt, opensAt) || other.opensAt == opensAt)&&(identical(other.closesAt, closesAt) || other.closesAt == closesAt)&&const DeepCollectionEquality().equals(other._openingHours, _openingHours)&&(identical(other.allergyInfo, allergyInfo) || other.allergyInfo == allergyInfo)&&(identical(other.aiSummary, aiSummary) || other.aiSummary == aiSummary)&&(identical(other.ordersLastYear, ordersLastYear) || other.ordersLastYear == ordersLastYear)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured)&&(identical(other.isAlcohol, isAlcohol) || other.isAlcohol == isAlcohol));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,logoUrl,coverUrl,cuisine,rating,ratingCount,etaMinutes,distanceMiles,deliveryFee,shortAddress,address,location,originalDeliveryFee,promoLabel,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_categoryIds),const DeepCollectionEquality().hash(_cuisineIds),const DeepCollectionEquality().hash(_dietaryLabels),const DeepCollectionEquality().hash(_offers),isOpen,reviewCount,opensAt,closesAt,const DeepCollectionEquality().hash(_openingHours),allergyInfo,aiSummary,ordersLastYear,isFeatured,isAlcohol]);

@override
String toString() {
  return 'Restaurant(id: $id, name: $name, logoUrl: $logoUrl, coverUrl: $coverUrl, cuisine: $cuisine, rating: $rating, ratingCount: $ratingCount, etaMinutes: $etaMinutes, distanceMiles: $distanceMiles, deliveryFee: $deliveryFee, shortAddress: $shortAddress, address: $address, location: $location, originalDeliveryFee: $originalDeliveryFee, promoLabel: $promoLabel, tags: $tags, categoryIds: $categoryIds, cuisineIds: $cuisineIds, dietaryLabels: $dietaryLabels, offers: $offers, isOpen: $isOpen, reviewCount: $reviewCount, opensAt: $opensAt, closesAt: $closesAt, openingHours: $openingHours, allergyInfo: $allergyInfo, aiSummary: $aiSummary, ordersLastYear: $ordersLastYear, isFeatured: $isFeatured, isAlcohol: $isAlcohol)';
}


}

/// @nodoc
abstract mixin class _$RestaurantCopyWith<$Res> implements $RestaurantCopyWith<$Res> {
  factory _$RestaurantCopyWith(_Restaurant value, $Res Function(_Restaurant) _then) = __$RestaurantCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String logoUrl, String coverUrl, String cuisine, double rating, int ratingCount, int etaMinutes, double distanceMiles,@MoneyConverter() Money deliveryFee, String shortAddress, String address, GeoPoint location,@NullableMoneyConverter() Money? originalDeliveryFee, String? promoLabel, List<String> tags, List<String> categoryIds, List<String> cuisineIds, List<String> dietaryLabels, List<RestaurantOffer> offers, bool isOpen, int reviewCount, String? opensAt, String? closesAt, List<OpeningHours> openingHours, String? allergyInfo, String? aiSummary, int ordersLastYear, bool isFeatured, bool isAlcohol
});


@override $GeoPointCopyWith<$Res> get location;

}
/// @nodoc
class __$RestaurantCopyWithImpl<$Res>
    implements _$RestaurantCopyWith<$Res> {
  __$RestaurantCopyWithImpl(this._self, this._then);

  final _Restaurant _self;
  final $Res Function(_Restaurant) _then;

/// Create a copy of Restaurant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? logoUrl = null,Object? coverUrl = null,Object? cuisine = null,Object? rating = null,Object? ratingCount = null,Object? etaMinutes = null,Object? distanceMiles = null,Object? deliveryFee = null,Object? shortAddress = null,Object? address = null,Object? location = null,Object? originalDeliveryFee = freezed,Object? promoLabel = freezed,Object? tags = null,Object? categoryIds = null,Object? cuisineIds = null,Object? dietaryLabels = null,Object? offers = null,Object? isOpen = null,Object? reviewCount = null,Object? opensAt = freezed,Object? closesAt = freezed,Object? openingHours = null,Object? allergyInfo = freezed,Object? aiSummary = freezed,Object? ordersLastYear = null,Object? isFeatured = null,Object? isAlcohol = null,}) {
  return _then(_Restaurant(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,cuisine: null == cuisine ? _self.cuisine : cuisine // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,ratingCount: null == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int,etaMinutes: null == etaMinutes ? _self.etaMinutes : etaMinutes // ignore: cast_nullable_to_non_nullable
as int,distanceMiles: null == distanceMiles ? _self.distanceMiles : distanceMiles // ignore: cast_nullable_to_non_nullable
as double,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as Money,shortAddress: null == shortAddress ? _self.shortAddress : shortAddress // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as GeoPoint,originalDeliveryFee: freezed == originalDeliveryFee ? _self.originalDeliveryFee : originalDeliveryFee // ignore: cast_nullable_to_non_nullable
as Money?,promoLabel: freezed == promoLabel ? _self.promoLabel : promoLabel // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,categoryIds: null == categoryIds ? _self._categoryIds : categoryIds // ignore: cast_nullable_to_non_nullable
as List<String>,cuisineIds: null == cuisineIds ? _self._cuisineIds : cuisineIds // ignore: cast_nullable_to_non_nullable
as List<String>,dietaryLabels: null == dietaryLabels ? _self._dietaryLabels : dietaryLabels // ignore: cast_nullable_to_non_nullable
as List<String>,offers: null == offers ? _self._offers : offers // ignore: cast_nullable_to_non_nullable
as List<RestaurantOffer>,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,opensAt: freezed == opensAt ? _self.opensAt : opensAt // ignore: cast_nullable_to_non_nullable
as String?,closesAt: freezed == closesAt ? _self.closesAt : closesAt // ignore: cast_nullable_to_non_nullable
as String?,openingHours: null == openingHours ? _self._openingHours : openingHours // ignore: cast_nullable_to_non_nullable
as List<OpeningHours>,allergyInfo: freezed == allergyInfo ? _self.allergyInfo : allergyInfo // ignore: cast_nullable_to_non_nullable
as String?,aiSummary: freezed == aiSummary ? _self.aiSummary : aiSummary // ignore: cast_nullable_to_non_nullable
as String?,ordersLastYear: null == ordersLastYear ? _self.ordersLastYear : ordersLastYear // ignore: cast_nullable_to_non_nullable
as int,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,isAlcohol: null == isAlcohol ? _self.isAlcohol : isAlcohol // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of Restaurant
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res> get location {
  
  return $GeoPointCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// @nodoc
mixin _$RestaurantOffer {

 String get id; OfferType get type; String get title; String get subtitle;
/// Create a copy of RestaurantOffer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RestaurantOfferCopyWith<RestaurantOffer> get copyWith => _$RestaurantOfferCopyWithImpl<RestaurantOffer>(this as RestaurantOffer, _$identity);

  /// Serializes this RestaurantOffer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RestaurantOffer&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title,subtitle);

@override
String toString() {
  return 'RestaurantOffer(id: $id, type: $type, title: $title, subtitle: $subtitle)';
}


}

/// @nodoc
abstract mixin class $RestaurantOfferCopyWith<$Res>  {
  factory $RestaurantOfferCopyWith(RestaurantOffer value, $Res Function(RestaurantOffer) _then) = _$RestaurantOfferCopyWithImpl;
@useResult
$Res call({
 String id, OfferType type, String title, String subtitle
});




}
/// @nodoc
class _$RestaurantOfferCopyWithImpl<$Res>
    implements $RestaurantOfferCopyWith<$Res> {
  _$RestaurantOfferCopyWithImpl(this._self, this._then);

  final RestaurantOffer _self;
  final $Res Function(RestaurantOffer) _then;

/// Create a copy of RestaurantOffer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? title = null,Object? subtitle = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OfferType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RestaurantOffer].
extension RestaurantOfferPatterns on RestaurantOffer {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RestaurantOffer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RestaurantOffer() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RestaurantOffer value)  $default,){
final _that = this;
switch (_that) {
case _RestaurantOffer():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RestaurantOffer value)?  $default,){
final _that = this;
switch (_that) {
case _RestaurantOffer() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  OfferType type,  String title,  String subtitle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RestaurantOffer() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.subtitle);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  OfferType type,  String title,  String subtitle)  $default,) {final _that = this;
switch (_that) {
case _RestaurantOffer():
return $default(_that.id,_that.type,_that.title,_that.subtitle);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  OfferType type,  String title,  String subtitle)?  $default,) {final _that = this;
switch (_that) {
case _RestaurantOffer() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.subtitle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RestaurantOffer implements RestaurantOffer {
  const _RestaurantOffer({required this.id, required this.type, required this.title, required this.subtitle});
  factory _RestaurantOffer.fromJson(Map<String, dynamic> json) => _$RestaurantOfferFromJson(json);

@override final  String id;
@override final  OfferType type;
@override final  String title;
@override final  String subtitle;

/// Create a copy of RestaurantOffer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RestaurantOfferCopyWith<_RestaurantOffer> get copyWith => __$RestaurantOfferCopyWithImpl<_RestaurantOffer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RestaurantOfferToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RestaurantOffer&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title,subtitle);

@override
String toString() {
  return 'RestaurantOffer(id: $id, type: $type, title: $title, subtitle: $subtitle)';
}


}

/// @nodoc
abstract mixin class _$RestaurantOfferCopyWith<$Res> implements $RestaurantOfferCopyWith<$Res> {
  factory _$RestaurantOfferCopyWith(_RestaurantOffer value, $Res Function(_RestaurantOffer) _then) = __$RestaurantOfferCopyWithImpl;
@override @useResult
$Res call({
 String id, OfferType type, String title, String subtitle
});




}
/// @nodoc
class __$RestaurantOfferCopyWithImpl<$Res>
    implements _$RestaurantOfferCopyWith<$Res> {
  __$RestaurantOfferCopyWithImpl(this._self, this._then);

  final _RestaurantOffer _self;
  final $Res Function(_RestaurantOffer) _then;

/// Create a copy of RestaurantOffer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? title = null,Object? subtitle = null,}) {
  return _then(_RestaurantOffer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OfferType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$OpeningHours {

 String get days; String get hours;
/// Create a copy of OpeningHours
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpeningHoursCopyWith<OpeningHours> get copyWith => _$OpeningHoursCopyWithImpl<OpeningHours>(this as OpeningHours, _$identity);

  /// Serializes this OpeningHours to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpeningHours&&(identical(other.days, days) || other.days == days)&&(identical(other.hours, hours) || other.hours == hours));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,days,hours);

@override
String toString() {
  return 'OpeningHours(days: $days, hours: $hours)';
}


}

/// @nodoc
abstract mixin class $OpeningHoursCopyWith<$Res>  {
  factory $OpeningHoursCopyWith(OpeningHours value, $Res Function(OpeningHours) _then) = _$OpeningHoursCopyWithImpl;
@useResult
$Res call({
 String days, String hours
});




}
/// @nodoc
class _$OpeningHoursCopyWithImpl<$Res>
    implements $OpeningHoursCopyWith<$Res> {
  _$OpeningHoursCopyWithImpl(this._self, this._then);

  final OpeningHours _self;
  final $Res Function(OpeningHours) _then;

/// Create a copy of OpeningHours
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? days = null,Object? hours = null,}) {
  return _then(_self.copyWith(
days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as String,hours: null == hours ? _self.hours : hours // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OpeningHours].
extension OpeningHoursPatterns on OpeningHours {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OpeningHours value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OpeningHours() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OpeningHours value)  $default,){
final _that = this;
switch (_that) {
case _OpeningHours():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OpeningHours value)?  $default,){
final _that = this;
switch (_that) {
case _OpeningHours() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String days,  String hours)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OpeningHours() when $default != null:
return $default(_that.days,_that.hours);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String days,  String hours)  $default,) {final _that = this;
switch (_that) {
case _OpeningHours():
return $default(_that.days,_that.hours);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String days,  String hours)?  $default,) {final _that = this;
switch (_that) {
case _OpeningHours() when $default != null:
return $default(_that.days,_that.hours);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OpeningHours implements OpeningHours {
  const _OpeningHours({required this.days, required this.hours});
  factory _OpeningHours.fromJson(Map<String, dynamic> json) => _$OpeningHoursFromJson(json);

@override final  String days;
@override final  String hours;

/// Create a copy of OpeningHours
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpeningHoursCopyWith<_OpeningHours> get copyWith => __$OpeningHoursCopyWithImpl<_OpeningHours>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OpeningHoursToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpeningHours&&(identical(other.days, days) || other.days == days)&&(identical(other.hours, hours) || other.hours == hours));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,days,hours);

@override
String toString() {
  return 'OpeningHours(days: $days, hours: $hours)';
}


}

/// @nodoc
abstract mixin class _$OpeningHoursCopyWith<$Res> implements $OpeningHoursCopyWith<$Res> {
  factory _$OpeningHoursCopyWith(_OpeningHours value, $Res Function(_OpeningHours) _then) = __$OpeningHoursCopyWithImpl;
@override @useResult
$Res call({
 String days, String hours
});




}
/// @nodoc
class __$OpeningHoursCopyWithImpl<$Res>
    implements _$OpeningHoursCopyWith<$Res> {
  __$OpeningHoursCopyWithImpl(this._self, this._then);

  final _OpeningHours _self;
  final $Res Function(_OpeningHours) _then;

/// Create a copy of OpeningHours
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? days = null,Object? hours = null,}) {
  return _then(_OpeningHours(
days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as String,hours: null == hours ? _self.hours : hours // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
