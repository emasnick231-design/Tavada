// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartState {

/// Baskets keyed by restaurant id.
 Map<String, StoreCart> get carts;/// Id of the last line added — lets the UI celebrate it.
 String? get lastAddedLineId;
/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartStateCopyWith<CartState> get copyWith => _$CartStateCopyWithImpl<CartState>(this as CartState, _$identity);

  /// Serializes this CartState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartState&&const DeepCollectionEquality().equals(other.carts, carts)&&(identical(other.lastAddedLineId, lastAddedLineId) || other.lastAddedLineId == lastAddedLineId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(carts),lastAddedLineId);

@override
String toString() {
  return 'CartState(carts: $carts, lastAddedLineId: $lastAddedLineId)';
}


}

/// @nodoc
abstract mixin class $CartStateCopyWith<$Res>  {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) _then) = _$CartStateCopyWithImpl;
@useResult
$Res call({
 Map<String, StoreCart> carts, String? lastAddedLineId
});




}
/// @nodoc
class _$CartStateCopyWithImpl<$Res>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._self, this._then);

  final CartState _self;
  final $Res Function(CartState) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? carts = null,Object? lastAddedLineId = freezed,}) {
  return _then(_self.copyWith(
carts: null == carts ? _self.carts : carts // ignore: cast_nullable_to_non_nullable
as Map<String, StoreCart>,lastAddedLineId: freezed == lastAddedLineId ? _self.lastAddedLineId : lastAddedLineId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CartState].
extension CartStatePatterns on CartState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartState value)  $default,){
final _that = this;
switch (_that) {
case _CartState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartState value)?  $default,){
final _that = this;
switch (_that) {
case _CartState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, StoreCart> carts,  String? lastAddedLineId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartState() when $default != null:
return $default(_that.carts,_that.lastAddedLineId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, StoreCart> carts,  String? lastAddedLineId)  $default,) {final _that = this;
switch (_that) {
case _CartState():
return $default(_that.carts,_that.lastAddedLineId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, StoreCart> carts,  String? lastAddedLineId)?  $default,) {final _that = this;
switch (_that) {
case _CartState() when $default != null:
return $default(_that.carts,_that.lastAddedLineId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartState extends CartState {
  const _CartState({final  Map<String, StoreCart> carts = const {}, this.lastAddedLineId}): _carts = carts,super._();
  factory _CartState.fromJson(Map<String, dynamic> json) => _$CartStateFromJson(json);

/// Baskets keyed by restaurant id.
 final  Map<String, StoreCart> _carts;
/// Baskets keyed by restaurant id.
@override@JsonKey() Map<String, StoreCart> get carts {
  if (_carts is EqualUnmodifiableMapView) return _carts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_carts);
}

/// Id of the last line added — lets the UI celebrate it.
@override final  String? lastAddedLineId;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartStateCopyWith<_CartState> get copyWith => __$CartStateCopyWithImpl<_CartState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartState&&const DeepCollectionEquality().equals(other._carts, _carts)&&(identical(other.lastAddedLineId, lastAddedLineId) || other.lastAddedLineId == lastAddedLineId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_carts),lastAddedLineId);

@override
String toString() {
  return 'CartState(carts: $carts, lastAddedLineId: $lastAddedLineId)';
}


}

/// @nodoc
abstract mixin class _$CartStateCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$CartStateCopyWith(_CartState value, $Res Function(_CartState) _then) = __$CartStateCopyWithImpl;
@override @useResult
$Res call({
 Map<String, StoreCart> carts, String? lastAddedLineId
});




}
/// @nodoc
class __$CartStateCopyWithImpl<$Res>
    implements _$CartStateCopyWith<$Res> {
  __$CartStateCopyWithImpl(this._self, this._then);

  final _CartState _self;
  final $Res Function(_CartState) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? carts = null,Object? lastAddedLineId = freezed,}) {
  return _then(_CartState(
carts: null == carts ? _self._carts : carts // ignore: cast_nullable_to_non_nullable
as Map<String, StoreCart>,lastAddedLineId: freezed == lastAddedLineId ? _self.lastAddedLineId : lastAddedLineId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
