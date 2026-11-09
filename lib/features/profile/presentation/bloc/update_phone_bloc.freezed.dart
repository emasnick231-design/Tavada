// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_phone_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UpdatePhoneState {

 String? get initialPhone; String get phone; bool get isValid;/// A code was sent to [phone]; waiting for it.
 bool get awaitingCode; String get code;/// Increments on every wrong code (re-runs the error shake).
 int get codeErrors; SubmitStatus get status; Failure? get failure; UserProfile? get updatedUser;
/// Create a copy of UpdatePhoneState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdatePhoneStateCopyWith<UpdatePhoneState> get copyWith => _$UpdatePhoneStateCopyWithImpl<UpdatePhoneState>(this as UpdatePhoneState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatePhoneState&&(identical(other.initialPhone, initialPhone) || other.initialPhone == initialPhone)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.awaitingCode, awaitingCode) || other.awaitingCode == awaitingCode)&&(identical(other.code, code) || other.code == code)&&(identical(other.codeErrors, codeErrors) || other.codeErrors == codeErrors)&&(identical(other.status, status) || other.status == status)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.updatedUser, updatedUser) || other.updatedUser == updatedUser));
}


@override
int get hashCode => Object.hash(runtimeType,initialPhone,phone,isValid,awaitingCode,code,codeErrors,status,failure,updatedUser);

@override
String toString() {
  return 'UpdatePhoneState(initialPhone: $initialPhone, phone: $phone, isValid: $isValid, awaitingCode: $awaitingCode, code: $code, codeErrors: $codeErrors, status: $status, failure: $failure, updatedUser: $updatedUser)';
}


}

/// @nodoc
abstract mixin class $UpdatePhoneStateCopyWith<$Res>  {
  factory $UpdatePhoneStateCopyWith(UpdatePhoneState value, $Res Function(UpdatePhoneState) _then) = _$UpdatePhoneStateCopyWithImpl;
@useResult
$Res call({
 String? initialPhone, String phone, bool isValid, bool awaitingCode, String code, int codeErrors, SubmitStatus status, Failure? failure, UserProfile? updatedUser
});


$UserProfileCopyWith<$Res>? get updatedUser;

}
/// @nodoc
class _$UpdatePhoneStateCopyWithImpl<$Res>
    implements $UpdatePhoneStateCopyWith<$Res> {
  _$UpdatePhoneStateCopyWithImpl(this._self, this._then);

  final UpdatePhoneState _self;
  final $Res Function(UpdatePhoneState) _then;

/// Create a copy of UpdatePhoneState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? initialPhone = freezed,Object? phone = null,Object? isValid = null,Object? awaitingCode = null,Object? code = null,Object? codeErrors = null,Object? status = null,Object? failure = freezed,Object? updatedUser = freezed,}) {
  return _then(_self.copyWith(
initialPhone: freezed == initialPhone ? _self.initialPhone : initialPhone // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,awaitingCode: null == awaitingCode ? _self.awaitingCode : awaitingCode // ignore: cast_nullable_to_non_nullable
as bool,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,codeErrors: null == codeErrors ? _self.codeErrors : codeErrors // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubmitStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,updatedUser: freezed == updatedUser ? _self.updatedUser : updatedUser // ignore: cast_nullable_to_non_nullable
as UserProfile?,
  ));
}
/// Create a copy of UpdatePhoneState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res>? get updatedUser {
    if (_self.updatedUser == null) {
    return null;
  }

  return $UserProfileCopyWith<$Res>(_self.updatedUser!, (value) {
    return _then(_self.copyWith(updatedUser: value));
  });
}
}


/// Adds pattern-matching-related methods to [UpdatePhoneState].
extension UpdatePhoneStatePatterns on UpdatePhoneState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdatePhoneState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdatePhoneState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdatePhoneState value)  $default,){
final _that = this;
switch (_that) {
case _UpdatePhoneState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdatePhoneState value)?  $default,){
final _that = this;
switch (_that) {
case _UpdatePhoneState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? initialPhone,  String phone,  bool isValid,  bool awaitingCode,  String code,  int codeErrors,  SubmitStatus status,  Failure? failure,  UserProfile? updatedUser)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdatePhoneState() when $default != null:
return $default(_that.initialPhone,_that.phone,_that.isValid,_that.awaitingCode,_that.code,_that.codeErrors,_that.status,_that.failure,_that.updatedUser);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? initialPhone,  String phone,  bool isValid,  bool awaitingCode,  String code,  int codeErrors,  SubmitStatus status,  Failure? failure,  UserProfile? updatedUser)  $default,) {final _that = this;
switch (_that) {
case _UpdatePhoneState():
return $default(_that.initialPhone,_that.phone,_that.isValid,_that.awaitingCode,_that.code,_that.codeErrors,_that.status,_that.failure,_that.updatedUser);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? initialPhone,  String phone,  bool isValid,  bool awaitingCode,  String code,  int codeErrors,  SubmitStatus status,  Failure? failure,  UserProfile? updatedUser)?  $default,) {final _that = this;
switch (_that) {
case _UpdatePhoneState() when $default != null:
return $default(_that.initialPhone,_that.phone,_that.isValid,_that.awaitingCode,_that.code,_that.codeErrors,_that.status,_that.failure,_that.updatedUser);case _:
  return null;

}
}

}

/// @nodoc


class _UpdatePhoneState extends UpdatePhoneState {
  const _UpdatePhoneState({this.initialPhone, this.phone = '', this.isValid = false, this.awaitingCode = false, this.code = '', this.codeErrors = 0, this.status = SubmitStatus.idle, this.failure, this.updatedUser}): super._();
  

@override final  String? initialPhone;
@override@JsonKey() final  String phone;
@override@JsonKey() final  bool isValid;
/// A code was sent to [phone]; waiting for it.
@override@JsonKey() final  bool awaitingCode;
@override@JsonKey() final  String code;
/// Increments on every wrong code (re-runs the error shake).
@override@JsonKey() final  int codeErrors;
@override@JsonKey() final  SubmitStatus status;
@override final  Failure? failure;
@override final  UserProfile? updatedUser;

/// Create a copy of UpdatePhoneState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatePhoneStateCopyWith<_UpdatePhoneState> get copyWith => __$UpdatePhoneStateCopyWithImpl<_UpdatePhoneState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatePhoneState&&(identical(other.initialPhone, initialPhone) || other.initialPhone == initialPhone)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.awaitingCode, awaitingCode) || other.awaitingCode == awaitingCode)&&(identical(other.code, code) || other.code == code)&&(identical(other.codeErrors, codeErrors) || other.codeErrors == codeErrors)&&(identical(other.status, status) || other.status == status)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.updatedUser, updatedUser) || other.updatedUser == updatedUser));
}


@override
int get hashCode => Object.hash(runtimeType,initialPhone,phone,isValid,awaitingCode,code,codeErrors,status,failure,updatedUser);

@override
String toString() {
  return 'UpdatePhoneState(initialPhone: $initialPhone, phone: $phone, isValid: $isValid, awaitingCode: $awaitingCode, code: $code, codeErrors: $codeErrors, status: $status, failure: $failure, updatedUser: $updatedUser)';
}


}

/// @nodoc
abstract mixin class _$UpdatePhoneStateCopyWith<$Res> implements $UpdatePhoneStateCopyWith<$Res> {
  factory _$UpdatePhoneStateCopyWith(_UpdatePhoneState value, $Res Function(_UpdatePhoneState) _then) = __$UpdatePhoneStateCopyWithImpl;
@override @useResult
$Res call({
 String? initialPhone, String phone, bool isValid, bool awaitingCode, String code, int codeErrors, SubmitStatus status, Failure? failure, UserProfile? updatedUser
});


@override $UserProfileCopyWith<$Res>? get updatedUser;

}
/// @nodoc
class __$UpdatePhoneStateCopyWithImpl<$Res>
    implements _$UpdatePhoneStateCopyWith<$Res> {
  __$UpdatePhoneStateCopyWithImpl(this._self, this._then);

  final _UpdatePhoneState _self;
  final $Res Function(_UpdatePhoneState) _then;

/// Create a copy of UpdatePhoneState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? initialPhone = freezed,Object? phone = null,Object? isValid = null,Object? awaitingCode = null,Object? code = null,Object? codeErrors = null,Object? status = null,Object? failure = freezed,Object? updatedUser = freezed,}) {
  return _then(_UpdatePhoneState(
initialPhone: freezed == initialPhone ? _self.initialPhone : initialPhone // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,awaitingCode: null == awaitingCode ? _self.awaitingCode : awaitingCode // ignore: cast_nullable_to_non_nullable
as bool,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,codeErrors: null == codeErrors ? _self.codeErrors : codeErrors // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubmitStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,updatedUser: freezed == updatedUser ? _self.updatedUser : updatedUser // ignore: cast_nullable_to_non_nullable
as UserProfile?,
  ));
}

/// Create a copy of UpdatePhoneState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res>? get updatedUser {
    if (_self.updatedUser == null) {
    return null;
  }

  return $UserProfileCopyWith<$Res>(_self.updatedUser!, (value) {
    return _then(_self.copyWith(updatedUser: value));
  });
}
}

// dart format on
