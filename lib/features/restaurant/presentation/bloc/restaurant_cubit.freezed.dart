// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RestaurantState {

 ViewStatus get status; Restaurant? get restaurant; List<MenuSection> get menu; List<MenuItem> get popular; Failure? get failure;
/// Create a copy of RestaurantState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RestaurantStateCopyWith<RestaurantState> get copyWith => _$RestaurantStateCopyWithImpl<RestaurantState>(this as RestaurantState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RestaurantState&&(identical(other.status, status) || other.status == status)&&(identical(other.restaurant, restaurant) || other.restaurant == restaurant)&&const DeepCollectionEquality().equals(other.menu, menu)&&const DeepCollectionEquality().equals(other.popular, popular)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,restaurant,const DeepCollectionEquality().hash(menu),const DeepCollectionEquality().hash(popular),failure);

@override
String toString() {
  return 'RestaurantState(status: $status, restaurant: $restaurant, menu: $menu, popular: $popular, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $RestaurantStateCopyWith<$Res>  {
  factory $RestaurantStateCopyWith(RestaurantState value, $Res Function(RestaurantState) _then) = _$RestaurantStateCopyWithImpl;
@useResult
$Res call({
 ViewStatus status, Restaurant? restaurant, List<MenuSection> menu, List<MenuItem> popular, Failure? failure
});


$RestaurantCopyWith<$Res>? get restaurant;

}
/// @nodoc
class _$RestaurantStateCopyWithImpl<$Res>
    implements $RestaurantStateCopyWith<$Res> {
  _$RestaurantStateCopyWithImpl(this._self, this._then);

  final RestaurantState _self;
  final $Res Function(RestaurantState) _then;

/// Create a copy of RestaurantState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? restaurant = freezed,Object? menu = null,Object? popular = null,Object? failure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ViewStatus,restaurant: freezed == restaurant ? _self.restaurant : restaurant // ignore: cast_nullable_to_non_nullable
as Restaurant?,menu: null == menu ? _self.menu : menu // ignore: cast_nullable_to_non_nullable
as List<MenuSection>,popular: null == popular ? _self.popular : popular // ignore: cast_nullable_to_non_nullable
as List<MenuItem>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of RestaurantState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RestaurantCopyWith<$Res>? get restaurant {
    if (_self.restaurant == null) {
    return null;
  }

  return $RestaurantCopyWith<$Res>(_self.restaurant!, (value) {
    return _then(_self.copyWith(restaurant: value));
  });
}
}


/// Adds pattern-matching-related methods to [RestaurantState].
extension RestaurantStatePatterns on RestaurantState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RestaurantState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RestaurantState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RestaurantState value)  $default,){
final _that = this;
switch (_that) {
case _RestaurantState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RestaurantState value)?  $default,){
final _that = this;
switch (_that) {
case _RestaurantState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ViewStatus status,  Restaurant? restaurant,  List<MenuSection> menu,  List<MenuItem> popular,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RestaurantState() when $default != null:
return $default(_that.status,_that.restaurant,_that.menu,_that.popular,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ViewStatus status,  Restaurant? restaurant,  List<MenuSection> menu,  List<MenuItem> popular,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _RestaurantState():
return $default(_that.status,_that.restaurant,_that.menu,_that.popular,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ViewStatus status,  Restaurant? restaurant,  List<MenuSection> menu,  List<MenuItem> popular,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _RestaurantState() when $default != null:
return $default(_that.status,_that.restaurant,_that.menu,_that.popular,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _RestaurantState implements RestaurantState {
  const _RestaurantState({this.status = ViewStatus.initial, this.restaurant, final  List<MenuSection> menu = const [], final  List<MenuItem> popular = const [], this.failure}): _menu = menu,_popular = popular;
  

@override@JsonKey() final  ViewStatus status;
@override final  Restaurant? restaurant;
 final  List<MenuSection> _menu;
@override@JsonKey() List<MenuSection> get menu {
  if (_menu is EqualUnmodifiableListView) return _menu;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_menu);
}

 final  List<MenuItem> _popular;
@override@JsonKey() List<MenuItem> get popular {
  if (_popular is EqualUnmodifiableListView) return _popular;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_popular);
}

@override final  Failure? failure;

/// Create a copy of RestaurantState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RestaurantStateCopyWith<_RestaurantState> get copyWith => __$RestaurantStateCopyWithImpl<_RestaurantState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RestaurantState&&(identical(other.status, status) || other.status == status)&&(identical(other.restaurant, restaurant) || other.restaurant == restaurant)&&const DeepCollectionEquality().equals(other._menu, _menu)&&const DeepCollectionEquality().equals(other._popular, _popular)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,restaurant,const DeepCollectionEquality().hash(_menu),const DeepCollectionEquality().hash(_popular),failure);

@override
String toString() {
  return 'RestaurantState(status: $status, restaurant: $restaurant, menu: $menu, popular: $popular, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$RestaurantStateCopyWith<$Res> implements $RestaurantStateCopyWith<$Res> {
  factory _$RestaurantStateCopyWith(_RestaurantState value, $Res Function(_RestaurantState) _then) = __$RestaurantStateCopyWithImpl;
@override @useResult
$Res call({
 ViewStatus status, Restaurant? restaurant, List<MenuSection> menu, List<MenuItem> popular, Failure? failure
});


@override $RestaurantCopyWith<$Res>? get restaurant;

}
/// @nodoc
class __$RestaurantStateCopyWithImpl<$Res>
    implements _$RestaurantStateCopyWith<$Res> {
  __$RestaurantStateCopyWithImpl(this._self, this._then);

  final _RestaurantState _self;
  final $Res Function(_RestaurantState) _then;

/// Create a copy of RestaurantState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? restaurant = freezed,Object? menu = null,Object? popular = null,Object? failure = freezed,}) {
  return _then(_RestaurantState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ViewStatus,restaurant: freezed == restaurant ? _self.restaurant : restaurant // ignore: cast_nullable_to_non_nullable
as Restaurant?,menu: null == menu ? _self._menu : menu // ignore: cast_nullable_to_non_nullable
as List<MenuSection>,popular: null == popular ? _self._popular : popular // ignore: cast_nullable_to_non_nullable
as List<MenuItem>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of RestaurantState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RestaurantCopyWith<$Res>? get restaurant {
    if (_self.restaurant == null) {
    return null;
  }

  return $RestaurantCopyWith<$Res>(_self.restaurant!, (value) {
    return _then(_self.copyWith(restaurant: value));
  });
}
}

// dart format on
