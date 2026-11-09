// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_picker_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocationPickerState {

 GeoPoint get center;/// Address under the pin; `null` while (re)resolving.
 Place? get place; bool get isDragging; bool get isResolving;/// Reverse geocoding failed for [center]: the pin can still be used.
 bool get resolveFailed;
/// Create a copy of LocationPickerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationPickerStateCopyWith<LocationPickerState> get copyWith => _$LocationPickerStateCopyWithImpl<LocationPickerState>(this as LocationPickerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationPickerState&&(identical(other.center, center) || other.center == center)&&(identical(other.place, place) || other.place == place)&&(identical(other.isDragging, isDragging) || other.isDragging == isDragging)&&(identical(other.isResolving, isResolving) || other.isResolving == isResolving)&&(identical(other.resolveFailed, resolveFailed) || other.resolveFailed == resolveFailed));
}


@override
int get hashCode => Object.hash(runtimeType,center,place,isDragging,isResolving,resolveFailed);

@override
String toString() {
  return 'LocationPickerState(center: $center, place: $place, isDragging: $isDragging, isResolving: $isResolving, resolveFailed: $resolveFailed)';
}


}

/// @nodoc
abstract mixin class $LocationPickerStateCopyWith<$Res>  {
  factory $LocationPickerStateCopyWith(LocationPickerState value, $Res Function(LocationPickerState) _then) = _$LocationPickerStateCopyWithImpl;
@useResult
$Res call({
 GeoPoint center, Place? place, bool isDragging, bool isResolving, bool resolveFailed
});


$GeoPointCopyWith<$Res> get center;$PlaceCopyWith<$Res>? get place;

}
/// @nodoc
class _$LocationPickerStateCopyWithImpl<$Res>
    implements $LocationPickerStateCopyWith<$Res> {
  _$LocationPickerStateCopyWithImpl(this._self, this._then);

  final LocationPickerState _self;
  final $Res Function(LocationPickerState) _then;

/// Create a copy of LocationPickerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? center = null,Object? place = freezed,Object? isDragging = null,Object? isResolving = null,Object? resolveFailed = null,}) {
  return _then(_self.copyWith(
center: null == center ? _self.center : center // ignore: cast_nullable_to_non_nullable
as GeoPoint,place: freezed == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as Place?,isDragging: null == isDragging ? _self.isDragging : isDragging // ignore: cast_nullable_to_non_nullable
as bool,isResolving: null == isResolving ? _self.isResolving : isResolving // ignore: cast_nullable_to_non_nullable
as bool,resolveFailed: null == resolveFailed ? _self.resolveFailed : resolveFailed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of LocationPickerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res> get center {
  
  return $GeoPointCopyWith<$Res>(_self.center, (value) {
    return _then(_self.copyWith(center: value));
  });
}/// Create a copy of LocationPickerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaceCopyWith<$Res>? get place {
    if (_self.place == null) {
    return null;
  }

  return $PlaceCopyWith<$Res>(_self.place!, (value) {
    return _then(_self.copyWith(place: value));
  });
}
}


/// Adds pattern-matching-related methods to [LocationPickerState].
extension LocationPickerStatePatterns on LocationPickerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationPickerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationPickerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationPickerState value)  $default,){
final _that = this;
switch (_that) {
case _LocationPickerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationPickerState value)?  $default,){
final _that = this;
switch (_that) {
case _LocationPickerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GeoPoint center,  Place? place,  bool isDragging,  bool isResolving,  bool resolveFailed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationPickerState() when $default != null:
return $default(_that.center,_that.place,_that.isDragging,_that.isResolving,_that.resolveFailed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GeoPoint center,  Place? place,  bool isDragging,  bool isResolving,  bool resolveFailed)  $default,) {final _that = this;
switch (_that) {
case _LocationPickerState():
return $default(_that.center,_that.place,_that.isDragging,_that.isResolving,_that.resolveFailed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GeoPoint center,  Place? place,  bool isDragging,  bool isResolving,  bool resolveFailed)?  $default,) {final _that = this;
switch (_that) {
case _LocationPickerState() when $default != null:
return $default(_that.center,_that.place,_that.isDragging,_that.isResolving,_that.resolveFailed);case _:
  return null;

}
}

}

/// @nodoc


class _LocationPickerState implements LocationPickerState {
  const _LocationPickerState({required this.center, this.place, this.isDragging = false, this.isResolving = false, this.resolveFailed = false});
  

@override final  GeoPoint center;
/// Address under the pin; `null` while (re)resolving.
@override final  Place? place;
@override@JsonKey() final  bool isDragging;
@override@JsonKey() final  bool isResolving;
/// Reverse geocoding failed for [center]: the pin can still be used.
@override@JsonKey() final  bool resolveFailed;

/// Create a copy of LocationPickerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationPickerStateCopyWith<_LocationPickerState> get copyWith => __$LocationPickerStateCopyWithImpl<_LocationPickerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationPickerState&&(identical(other.center, center) || other.center == center)&&(identical(other.place, place) || other.place == place)&&(identical(other.isDragging, isDragging) || other.isDragging == isDragging)&&(identical(other.isResolving, isResolving) || other.isResolving == isResolving)&&(identical(other.resolveFailed, resolveFailed) || other.resolveFailed == resolveFailed));
}


@override
int get hashCode => Object.hash(runtimeType,center,place,isDragging,isResolving,resolveFailed);

@override
String toString() {
  return 'LocationPickerState(center: $center, place: $place, isDragging: $isDragging, isResolving: $isResolving, resolveFailed: $resolveFailed)';
}


}

/// @nodoc
abstract mixin class _$LocationPickerStateCopyWith<$Res> implements $LocationPickerStateCopyWith<$Res> {
  factory _$LocationPickerStateCopyWith(_LocationPickerState value, $Res Function(_LocationPickerState) _then) = __$LocationPickerStateCopyWithImpl;
@override @useResult
$Res call({
 GeoPoint center, Place? place, bool isDragging, bool isResolving, bool resolveFailed
});


@override $GeoPointCopyWith<$Res> get center;@override $PlaceCopyWith<$Res>? get place;

}
/// @nodoc
class __$LocationPickerStateCopyWithImpl<$Res>
    implements _$LocationPickerStateCopyWith<$Res> {
  __$LocationPickerStateCopyWithImpl(this._self, this._then);

  final _LocationPickerState _self;
  final $Res Function(_LocationPickerState) _then;

/// Create a copy of LocationPickerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? center = null,Object? place = freezed,Object? isDragging = null,Object? isResolving = null,Object? resolveFailed = null,}) {
  return _then(_LocationPickerState(
center: null == center ? _self.center : center // ignore: cast_nullable_to_non_nullable
as GeoPoint,place: freezed == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as Place?,isDragging: null == isDragging ? _self.isDragging : isDragging // ignore: cast_nullable_to_non_nullable
as bool,isResolving: null == isResolving ? _self.isResolving : isResolving // ignore: cast_nullable_to_non_nullable
as bool,resolveFailed: null == resolveFailed ? _self.resolveFailed : resolveFailed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of LocationPickerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res> get center {
  
  return $GeoPointCopyWith<$Res>(_self.center, (value) {
    return _then(_self.copyWith(center: value));
  });
}/// Create a copy of LocationPickerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaceCopyWith<$Res>? get place {
    if (_self.place == null) {
    return null;
  }

  return $PlaceCopyWith<$Res>(_self.place!, (value) {
    return _then(_self.copyWith(place: value));
  });
}
}

// dart format on
