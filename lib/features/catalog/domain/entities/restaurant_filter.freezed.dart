// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RestaurantFilter {

/// Home rail id, e.g. `places_near_you`, `special_discounts`.
 String? get section; String? get categoryId; Set<String> get cuisineIds; Set<String> get dietaryIds; bool get discountsOnly; bool get topRated; bool get under30Minutes; bool get offersOnly; double? get maxDeliveryFee; String? get query;
/// Create a copy of RestaurantFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RestaurantFilterCopyWith<RestaurantFilter> get copyWith => _$RestaurantFilterCopyWithImpl<RestaurantFilter>(this as RestaurantFilter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RestaurantFilter&&(identical(other.section, section) || other.section == section)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&const DeepCollectionEquality().equals(other.cuisineIds, cuisineIds)&&const DeepCollectionEquality().equals(other.dietaryIds, dietaryIds)&&(identical(other.discountsOnly, discountsOnly) || other.discountsOnly == discountsOnly)&&(identical(other.topRated, topRated) || other.topRated == topRated)&&(identical(other.under30Minutes, under30Minutes) || other.under30Minutes == under30Minutes)&&(identical(other.offersOnly, offersOnly) || other.offersOnly == offersOnly)&&(identical(other.maxDeliveryFee, maxDeliveryFee) || other.maxDeliveryFee == maxDeliveryFee)&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,section,categoryId,const DeepCollectionEquality().hash(cuisineIds),const DeepCollectionEquality().hash(dietaryIds),discountsOnly,topRated,under30Minutes,offersOnly,maxDeliveryFee,query);

@override
String toString() {
  return 'RestaurantFilter(section: $section, categoryId: $categoryId, cuisineIds: $cuisineIds, dietaryIds: $dietaryIds, discountsOnly: $discountsOnly, topRated: $topRated, under30Minutes: $under30Minutes, offersOnly: $offersOnly, maxDeliveryFee: $maxDeliveryFee, query: $query)';
}


}

/// @nodoc
abstract mixin class $RestaurantFilterCopyWith<$Res>  {
  factory $RestaurantFilterCopyWith(RestaurantFilter value, $Res Function(RestaurantFilter) _then) = _$RestaurantFilterCopyWithImpl;
@useResult
$Res call({
 String? section, String? categoryId, Set<String> cuisineIds, Set<String> dietaryIds, bool discountsOnly, bool topRated, bool under30Minutes, bool offersOnly, double? maxDeliveryFee, String? query
});




}
/// @nodoc
class _$RestaurantFilterCopyWithImpl<$Res>
    implements $RestaurantFilterCopyWith<$Res> {
  _$RestaurantFilterCopyWithImpl(this._self, this._then);

  final RestaurantFilter _self;
  final $Res Function(RestaurantFilter) _then;

/// Create a copy of RestaurantFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? section = freezed,Object? categoryId = freezed,Object? cuisineIds = null,Object? dietaryIds = null,Object? discountsOnly = null,Object? topRated = null,Object? under30Minutes = null,Object? offersOnly = null,Object? maxDeliveryFee = freezed,Object? query = freezed,}) {
  return _then(_self.copyWith(
section: freezed == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,cuisineIds: null == cuisineIds ? _self.cuisineIds : cuisineIds // ignore: cast_nullable_to_non_nullable
as Set<String>,dietaryIds: null == dietaryIds ? _self.dietaryIds : dietaryIds // ignore: cast_nullable_to_non_nullable
as Set<String>,discountsOnly: null == discountsOnly ? _self.discountsOnly : discountsOnly // ignore: cast_nullable_to_non_nullable
as bool,topRated: null == topRated ? _self.topRated : topRated // ignore: cast_nullable_to_non_nullable
as bool,under30Minutes: null == under30Minutes ? _self.under30Minutes : under30Minutes // ignore: cast_nullable_to_non_nullable
as bool,offersOnly: null == offersOnly ? _self.offersOnly : offersOnly // ignore: cast_nullable_to_non_nullable
as bool,maxDeliveryFee: freezed == maxDeliveryFee ? _self.maxDeliveryFee : maxDeliveryFee // ignore: cast_nullable_to_non_nullable
as double?,query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RestaurantFilter].
extension RestaurantFilterPatterns on RestaurantFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RestaurantFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RestaurantFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RestaurantFilter value)  $default,){
final _that = this;
switch (_that) {
case _RestaurantFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RestaurantFilter value)?  $default,){
final _that = this;
switch (_that) {
case _RestaurantFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? section,  String? categoryId,  Set<String> cuisineIds,  Set<String> dietaryIds,  bool discountsOnly,  bool topRated,  bool under30Minutes,  bool offersOnly,  double? maxDeliveryFee,  String? query)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RestaurantFilter() when $default != null:
return $default(_that.section,_that.categoryId,_that.cuisineIds,_that.dietaryIds,_that.discountsOnly,_that.topRated,_that.under30Minutes,_that.offersOnly,_that.maxDeliveryFee,_that.query);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? section,  String? categoryId,  Set<String> cuisineIds,  Set<String> dietaryIds,  bool discountsOnly,  bool topRated,  bool under30Minutes,  bool offersOnly,  double? maxDeliveryFee,  String? query)  $default,) {final _that = this;
switch (_that) {
case _RestaurantFilter():
return $default(_that.section,_that.categoryId,_that.cuisineIds,_that.dietaryIds,_that.discountsOnly,_that.topRated,_that.under30Minutes,_that.offersOnly,_that.maxDeliveryFee,_that.query);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? section,  String? categoryId,  Set<String> cuisineIds,  Set<String> dietaryIds,  bool discountsOnly,  bool topRated,  bool under30Minutes,  bool offersOnly,  double? maxDeliveryFee,  String? query)?  $default,) {final _that = this;
switch (_that) {
case _RestaurantFilter() when $default != null:
return $default(_that.section,_that.categoryId,_that.cuisineIds,_that.dietaryIds,_that.discountsOnly,_that.topRated,_that.under30Minutes,_that.offersOnly,_that.maxDeliveryFee,_that.query);case _:
  return null;

}
}

}

/// @nodoc


class _RestaurantFilter extends RestaurantFilter {
  const _RestaurantFilter({this.section, this.categoryId, final  Set<String> cuisineIds = const {}, final  Set<String> dietaryIds = const {}, this.discountsOnly = false, this.topRated = false, this.under30Minutes = false, this.offersOnly = false, this.maxDeliveryFee, this.query}): _cuisineIds = cuisineIds,_dietaryIds = dietaryIds,super._();
  

/// Home rail id, e.g. `places_near_you`, `special_discounts`.
@override final  String? section;
@override final  String? categoryId;
 final  Set<String> _cuisineIds;
@override@JsonKey() Set<String> get cuisineIds {
  if (_cuisineIds is EqualUnmodifiableSetView) return _cuisineIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_cuisineIds);
}

 final  Set<String> _dietaryIds;
@override@JsonKey() Set<String> get dietaryIds {
  if (_dietaryIds is EqualUnmodifiableSetView) return _dietaryIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_dietaryIds);
}

@override@JsonKey() final  bool discountsOnly;
@override@JsonKey() final  bool topRated;
@override@JsonKey() final  bool under30Minutes;
@override@JsonKey() final  bool offersOnly;
@override final  double? maxDeliveryFee;
@override final  String? query;

/// Create a copy of RestaurantFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RestaurantFilterCopyWith<_RestaurantFilter> get copyWith => __$RestaurantFilterCopyWithImpl<_RestaurantFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RestaurantFilter&&(identical(other.section, section) || other.section == section)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&const DeepCollectionEquality().equals(other._cuisineIds, _cuisineIds)&&const DeepCollectionEquality().equals(other._dietaryIds, _dietaryIds)&&(identical(other.discountsOnly, discountsOnly) || other.discountsOnly == discountsOnly)&&(identical(other.topRated, topRated) || other.topRated == topRated)&&(identical(other.under30Minutes, under30Minutes) || other.under30Minutes == under30Minutes)&&(identical(other.offersOnly, offersOnly) || other.offersOnly == offersOnly)&&(identical(other.maxDeliveryFee, maxDeliveryFee) || other.maxDeliveryFee == maxDeliveryFee)&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,section,categoryId,const DeepCollectionEquality().hash(_cuisineIds),const DeepCollectionEquality().hash(_dietaryIds),discountsOnly,topRated,under30Minutes,offersOnly,maxDeliveryFee,query);

@override
String toString() {
  return 'RestaurantFilter(section: $section, categoryId: $categoryId, cuisineIds: $cuisineIds, dietaryIds: $dietaryIds, discountsOnly: $discountsOnly, topRated: $topRated, under30Minutes: $under30Minutes, offersOnly: $offersOnly, maxDeliveryFee: $maxDeliveryFee, query: $query)';
}


}

/// @nodoc
abstract mixin class _$RestaurantFilterCopyWith<$Res> implements $RestaurantFilterCopyWith<$Res> {
  factory _$RestaurantFilterCopyWith(_RestaurantFilter value, $Res Function(_RestaurantFilter) _then) = __$RestaurantFilterCopyWithImpl;
@override @useResult
$Res call({
 String? section, String? categoryId, Set<String> cuisineIds, Set<String> dietaryIds, bool discountsOnly, bool topRated, bool under30Minutes, bool offersOnly, double? maxDeliveryFee, String? query
});




}
/// @nodoc
class __$RestaurantFilterCopyWithImpl<$Res>
    implements _$RestaurantFilterCopyWith<$Res> {
  __$RestaurantFilterCopyWithImpl(this._self, this._then);

  final _RestaurantFilter _self;
  final $Res Function(_RestaurantFilter) _then;

/// Create a copy of RestaurantFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? section = freezed,Object? categoryId = freezed,Object? cuisineIds = null,Object? dietaryIds = null,Object? discountsOnly = null,Object? topRated = null,Object? under30Minutes = null,Object? offersOnly = null,Object? maxDeliveryFee = freezed,Object? query = freezed,}) {
  return _then(_RestaurantFilter(
section: freezed == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,cuisineIds: null == cuisineIds ? _self._cuisineIds : cuisineIds // ignore: cast_nullable_to_non_nullable
as Set<String>,dietaryIds: null == dietaryIds ? _self._dietaryIds : dietaryIds // ignore: cast_nullable_to_non_nullable
as Set<String>,discountsOnly: null == discountsOnly ? _self.discountsOnly : discountsOnly // ignore: cast_nullable_to_non_nullable
as bool,topRated: null == topRated ? _self.topRated : topRated // ignore: cast_nullable_to_non_nullable
as bool,under30Minutes: null == under30Minutes ? _self.under30Minutes : under30Minutes // ignore: cast_nullable_to_non_nullable
as bool,offersOnly: null == offersOnly ? _self.offersOnly : offersOnly // ignore: cast_nullable_to_non_nullable
as bool,maxDeliveryFee: freezed == maxDeliveryFee ? _self.maxDeliveryFee : maxDeliveryFee // ignore: cast_nullable_to_non_nullable
as double?,query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
