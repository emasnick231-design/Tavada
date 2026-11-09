// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_step_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PasswordStepState {

 String get password; SubmitStatus get status; Failure? get failure; OtpDispatch? get dispatch;
/// Create a copy of PasswordStepState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordStepStateCopyWith<PasswordStepState> get copyWith => _$PasswordStepStateCopyWithImpl<PasswordStepState>(this as PasswordStepState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordStepState&&(identical(other.password, password) || other.password == password)&&(identical(other.status, status) || other.status == status)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.dispatch, dispatch) || other.dispatch == dispatch));
}


@override
int get hashCode => Object.hash(runtimeType,password,status,failure,dispatch);

@override
String toString() {
  return 'PasswordStepState(password: $password, status: $status, failure: $failure, dispatch: $dispatch)';
}


}

/// @nodoc
abstract mixin class $PasswordStepStateCopyWith<$Res>  {
  factory $PasswordStepStateCopyWith(PasswordStepState value, $Res Function(PasswordStepState) _then) = _$PasswordStepStateCopyWithImpl;
@useResult
$Res call({
 String password, SubmitStatus status, Failure? failure, OtpDispatch? dispatch
});


$OtpDispatchCopyWith<$Res>? get dispatch;

}
/// @nodoc
class _$PasswordStepStateCopyWithImpl<$Res>
    implements $PasswordStepStateCopyWith<$Res> {
  _$PasswordStepStateCopyWithImpl(this._self, this._then);

  final PasswordStepState _self;
  final $Res Function(PasswordStepState) _then;

/// Create a copy of PasswordStepState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? password = null,Object? status = null,Object? failure = freezed,Object? dispatch = freezed,}) {
  return _then(_self.copyWith(
password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubmitStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,dispatch: freezed == dispatch ? _self.dispatch : dispatch // ignore: cast_nullable_to_non_nullable
as OtpDispatch?,
  ));
}
/// Create a copy of PasswordStepState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OtpDispatchCopyWith<$Res>? get dispatch {
    if (_self.dispatch == null) {
    return null;
  }

  return $OtpDispatchCopyWith<$Res>(_self.dispatch!, (value) {
    return _then(_self.copyWith(dispatch: value));
  });
}
}


/// Adds pattern-matching-related methods to [PasswordStepState].
extension PasswordStepStatePatterns on PasswordStepState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PasswordStepState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PasswordStepState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PasswordStepState value)  $default,){
final _that = this;
switch (_that) {
case _PasswordStepState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PasswordStepState value)?  $default,){
final _that = this;
switch (_that) {
case _PasswordStepState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String password,  SubmitStatus status,  Failure? failure,  OtpDispatch? dispatch)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PasswordStepState() when $default != null:
return $default(_that.password,_that.status,_that.failure,_that.dispatch);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String password,  SubmitStatus status,  Failure? failure,  OtpDispatch? dispatch)  $default,) {final _that = this;
switch (_that) {
case _PasswordStepState():
return $default(_that.password,_that.status,_that.failure,_that.dispatch);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String password,  SubmitStatus status,  Failure? failure,  OtpDispatch? dispatch)?  $default,) {final _that = this;
switch (_that) {
case _PasswordStepState() when $default != null:
return $default(_that.password,_that.status,_that.failure,_that.dispatch);case _:
  return null;

}
}

}

/// @nodoc


class _PasswordStepState extends PasswordStepState {
  const _PasswordStepState({this.password = '', this.status = SubmitStatus.idle, this.failure, this.dispatch}): super._();
  

@override@JsonKey() final  String password;
@override@JsonKey() final  SubmitStatus status;
@override final  Failure? failure;
@override final  OtpDispatch? dispatch;

/// Create a copy of PasswordStepState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PasswordStepStateCopyWith<_PasswordStepState> get copyWith => __$PasswordStepStateCopyWithImpl<_PasswordStepState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PasswordStepState&&(identical(other.password, password) || other.password == password)&&(identical(other.status, status) || other.status == status)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.dispatch, dispatch) || other.dispatch == dispatch));
}


@override
int get hashCode => Object.hash(runtimeType,password,status,failure,dispatch);

@override
String toString() {
  return 'PasswordStepState(password: $password, status: $status, failure: $failure, dispatch: $dispatch)';
}


}

/// @nodoc
abstract mixin class _$PasswordStepStateCopyWith<$Res> implements $PasswordStepStateCopyWith<$Res> {
  factory _$PasswordStepStateCopyWith(_PasswordStepState value, $Res Function(_PasswordStepState) _then) = __$PasswordStepStateCopyWithImpl;
@override @useResult
$Res call({
 String password, SubmitStatus status, Failure? failure, OtpDispatch? dispatch
});


@override $OtpDispatchCopyWith<$Res>? get dispatch;

}
/// @nodoc
class __$PasswordStepStateCopyWithImpl<$Res>
    implements _$PasswordStepStateCopyWith<$Res> {
  __$PasswordStepStateCopyWithImpl(this._self, this._then);

  final _PasswordStepState _self;
  final $Res Function(_PasswordStepState) _then;

/// Create a copy of PasswordStepState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? password = null,Object? status = null,Object? failure = freezed,Object? dispatch = freezed,}) {
  return _then(_PasswordStepState(
password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubmitStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,dispatch: freezed == dispatch ? _self.dispatch : dispatch // ignore: cast_nullable_to_non_nullable
as OtpDispatch?,
  ));
}

/// Create a copy of PasswordStepState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OtpDispatchCopyWith<$Res>? get dispatch {
    if (_self.dispatch == null) {
    return null;
  }

  return $OtpDispatchCopyWith<$Res>(_self.dispatch!, (value) {
    return _then(_self.copyWith(dispatch: value));
  });
}
}

// dart format on
