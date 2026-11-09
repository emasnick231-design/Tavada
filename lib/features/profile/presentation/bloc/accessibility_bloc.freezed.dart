// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accessibility_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AccessibilityState {

 ViewStatus get status; AccessibilitySettings get settings; SubmitStatus get saveStatus; Failure? get failure; Failure? get saveFailure;
/// Create a copy of AccessibilityState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccessibilityStateCopyWith<AccessibilityState> get copyWith => _$AccessibilityStateCopyWithImpl<AccessibilityState>(this as AccessibilityState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccessibilityState&&(identical(other.status, status) || other.status == status)&&(identical(other.settings, settings) || other.settings == settings)&&(identical(other.saveStatus, saveStatus) || other.saveStatus == saveStatus)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.saveFailure, saveFailure) || other.saveFailure == saveFailure));
}


@override
int get hashCode => Object.hash(runtimeType,status,settings,saveStatus,failure,saveFailure);

@override
String toString() {
  return 'AccessibilityState(status: $status, settings: $settings, saveStatus: $saveStatus, failure: $failure, saveFailure: $saveFailure)';
}


}

/// @nodoc
abstract mixin class $AccessibilityStateCopyWith<$Res>  {
  factory $AccessibilityStateCopyWith(AccessibilityState value, $Res Function(AccessibilityState) _then) = _$AccessibilityStateCopyWithImpl;
@useResult
$Res call({
 ViewStatus status, AccessibilitySettings settings, SubmitStatus saveStatus, Failure? failure, Failure? saveFailure
});


$AccessibilitySettingsCopyWith<$Res> get settings;

}
/// @nodoc
class _$AccessibilityStateCopyWithImpl<$Res>
    implements $AccessibilityStateCopyWith<$Res> {
  _$AccessibilityStateCopyWithImpl(this._self, this._then);

  final AccessibilityState _self;
  final $Res Function(AccessibilityState) _then;

/// Create a copy of AccessibilityState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? settings = null,Object? saveStatus = null,Object? failure = freezed,Object? saveFailure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ViewStatus,settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as AccessibilitySettings,saveStatus: null == saveStatus ? _self.saveStatus : saveStatus // ignore: cast_nullable_to_non_nullable
as SubmitStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,saveFailure: freezed == saveFailure ? _self.saveFailure : saveFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of AccessibilityState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccessibilitySettingsCopyWith<$Res> get settings {
  
  return $AccessibilitySettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}


/// Adds pattern-matching-related methods to [AccessibilityState].
extension AccessibilityStatePatterns on AccessibilityState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccessibilityState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccessibilityState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccessibilityState value)  $default,){
final _that = this;
switch (_that) {
case _AccessibilityState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccessibilityState value)?  $default,){
final _that = this;
switch (_that) {
case _AccessibilityState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ViewStatus status,  AccessibilitySettings settings,  SubmitStatus saveStatus,  Failure? failure,  Failure? saveFailure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccessibilityState() when $default != null:
return $default(_that.status,_that.settings,_that.saveStatus,_that.failure,_that.saveFailure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ViewStatus status,  AccessibilitySettings settings,  SubmitStatus saveStatus,  Failure? failure,  Failure? saveFailure)  $default,) {final _that = this;
switch (_that) {
case _AccessibilityState():
return $default(_that.status,_that.settings,_that.saveStatus,_that.failure,_that.saveFailure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ViewStatus status,  AccessibilitySettings settings,  SubmitStatus saveStatus,  Failure? failure,  Failure? saveFailure)?  $default,) {final _that = this;
switch (_that) {
case _AccessibilityState() when $default != null:
return $default(_that.status,_that.settings,_that.saveStatus,_that.failure,_that.saveFailure);case _:
  return null;

}
}

}

/// @nodoc


class _AccessibilityState implements AccessibilityState {
  const _AccessibilityState({this.status = ViewStatus.initial, this.settings = const AccessibilitySettings(), this.saveStatus = SubmitStatus.idle, this.failure, this.saveFailure});
  

@override@JsonKey() final  ViewStatus status;
@override@JsonKey() final  AccessibilitySettings settings;
@override@JsonKey() final  SubmitStatus saveStatus;
@override final  Failure? failure;
@override final  Failure? saveFailure;

/// Create a copy of AccessibilityState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccessibilityStateCopyWith<_AccessibilityState> get copyWith => __$AccessibilityStateCopyWithImpl<_AccessibilityState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccessibilityState&&(identical(other.status, status) || other.status == status)&&(identical(other.settings, settings) || other.settings == settings)&&(identical(other.saveStatus, saveStatus) || other.saveStatus == saveStatus)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.saveFailure, saveFailure) || other.saveFailure == saveFailure));
}


@override
int get hashCode => Object.hash(runtimeType,status,settings,saveStatus,failure,saveFailure);

@override
String toString() {
  return 'AccessibilityState(status: $status, settings: $settings, saveStatus: $saveStatus, failure: $failure, saveFailure: $saveFailure)';
}


}

/// @nodoc
abstract mixin class _$AccessibilityStateCopyWith<$Res> implements $AccessibilityStateCopyWith<$Res> {
  factory _$AccessibilityStateCopyWith(_AccessibilityState value, $Res Function(_AccessibilityState) _then) = __$AccessibilityStateCopyWithImpl;
@override @useResult
$Res call({
 ViewStatus status, AccessibilitySettings settings, SubmitStatus saveStatus, Failure? failure, Failure? saveFailure
});


@override $AccessibilitySettingsCopyWith<$Res> get settings;

}
/// @nodoc
class __$AccessibilityStateCopyWithImpl<$Res>
    implements _$AccessibilityStateCopyWith<$Res> {
  __$AccessibilityStateCopyWithImpl(this._self, this._then);

  final _AccessibilityState _self;
  final $Res Function(_AccessibilityState) _then;

/// Create a copy of AccessibilityState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? settings = null,Object? saveStatus = null,Object? failure = freezed,Object? saveFailure = freezed,}) {
  return _then(_AccessibilityState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ViewStatus,settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as AccessibilitySettings,saveStatus: null == saveStatus ? _self.saveStatus : saveStatus // ignore: cast_nullable_to_non_nullable
as SubmitStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,saveFailure: freezed == saveFailure ? _self.saveFailure : saveFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of AccessibilityState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccessibilitySettingsCopyWith<$Res> get settings {
  
  return $AccessibilitySettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}

// dart format on
