// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OtpState {

 String get code; SubmitStatus get status; int get secondsLeft; bool get isResending;/// Increments on every failed attempt so the UI can re-run its shake.
 int get errorCount; Failure? get failure;/// Sign up / phone login result.
 AuthSession? get session;/// Password reset result.
 String? get resetToken;
/// Create a copy of OtpState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtpStateCopyWith<OtpState> get copyWith => _$OtpStateCopyWithImpl<OtpState>(this as OtpState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpState&&(identical(other.code, code) || other.code == code)&&(identical(other.status, status) || other.status == status)&&(identical(other.secondsLeft, secondsLeft) || other.secondsLeft == secondsLeft)&&(identical(other.isResending, isResending) || other.isResending == isResending)&&(identical(other.errorCount, errorCount) || other.errorCount == errorCount)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.session, session) || other.session == session)&&(identical(other.resetToken, resetToken) || other.resetToken == resetToken));
}


@override
int get hashCode => Object.hash(runtimeType,code,status,secondsLeft,isResending,errorCount,failure,session,resetToken);

@override
String toString() {
  return 'OtpState(code: $code, status: $status, secondsLeft: $secondsLeft, isResending: $isResending, errorCount: $errorCount, failure: $failure, session: $session, resetToken: $resetToken)';
}


}

/// @nodoc
abstract mixin class $OtpStateCopyWith<$Res>  {
  factory $OtpStateCopyWith(OtpState value, $Res Function(OtpState) _then) = _$OtpStateCopyWithImpl;
@useResult
$Res call({
 String code, SubmitStatus status, int secondsLeft, bool isResending, int errorCount, Failure? failure, AuthSession? session, String? resetToken
});


$AuthSessionCopyWith<$Res>? get session;

}
/// @nodoc
class _$OtpStateCopyWithImpl<$Res>
    implements $OtpStateCopyWith<$Res> {
  _$OtpStateCopyWithImpl(this._self, this._then);

  final OtpState _self;
  final $Res Function(OtpState) _then;

/// Create a copy of OtpState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? status = null,Object? secondsLeft = null,Object? isResending = null,Object? errorCount = null,Object? failure = freezed,Object? session = freezed,Object? resetToken = freezed,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubmitStatus,secondsLeft: null == secondsLeft ? _self.secondsLeft : secondsLeft // ignore: cast_nullable_to_non_nullable
as int,isResending: null == isResending ? _self.isResending : isResending // ignore: cast_nullable_to_non_nullable
as bool,errorCount: null == errorCount ? _self.errorCount : errorCount // ignore: cast_nullable_to_non_nullable
as int,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as AuthSession?,resetToken: freezed == resetToken ? _self.resetToken : resetToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of OtpState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthSessionCopyWith<$Res>? get session {
    if (_self.session == null) {
    return null;
  }

  return $AuthSessionCopyWith<$Res>(_self.session!, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}


/// Adds pattern-matching-related methods to [OtpState].
extension OtpStatePatterns on OtpState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OtpState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OtpState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OtpState value)  $default,){
final _that = this;
switch (_that) {
case _OtpState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OtpState value)?  $default,){
final _that = this;
switch (_that) {
case _OtpState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  SubmitStatus status,  int secondsLeft,  bool isResending,  int errorCount,  Failure? failure,  AuthSession? session,  String? resetToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OtpState() when $default != null:
return $default(_that.code,_that.status,_that.secondsLeft,_that.isResending,_that.errorCount,_that.failure,_that.session,_that.resetToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  SubmitStatus status,  int secondsLeft,  bool isResending,  int errorCount,  Failure? failure,  AuthSession? session,  String? resetToken)  $default,) {final _that = this;
switch (_that) {
case _OtpState():
return $default(_that.code,_that.status,_that.secondsLeft,_that.isResending,_that.errorCount,_that.failure,_that.session,_that.resetToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  SubmitStatus status,  int secondsLeft,  bool isResending,  int errorCount,  Failure? failure,  AuthSession? session,  String? resetToken)?  $default,) {final _that = this;
switch (_that) {
case _OtpState() when $default != null:
return $default(_that.code,_that.status,_that.secondsLeft,_that.isResending,_that.errorCount,_that.failure,_that.session,_that.resetToken);case _:
  return null;

}
}

}

/// @nodoc


class _OtpState extends OtpState {
  const _OtpState({this.code = '', this.status = SubmitStatus.idle, this.secondsLeft = 0, this.isResending = false, this.errorCount = 0, this.failure, this.session, this.resetToken}): super._();
  

@override@JsonKey() final  String code;
@override@JsonKey() final  SubmitStatus status;
@override@JsonKey() final  int secondsLeft;
@override@JsonKey() final  bool isResending;
/// Increments on every failed attempt so the UI can re-run its shake.
@override@JsonKey() final  int errorCount;
@override final  Failure? failure;
/// Sign up / phone login result.
@override final  AuthSession? session;
/// Password reset result.
@override final  String? resetToken;

/// Create a copy of OtpState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtpStateCopyWith<_OtpState> get copyWith => __$OtpStateCopyWithImpl<_OtpState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpState&&(identical(other.code, code) || other.code == code)&&(identical(other.status, status) || other.status == status)&&(identical(other.secondsLeft, secondsLeft) || other.secondsLeft == secondsLeft)&&(identical(other.isResending, isResending) || other.isResending == isResending)&&(identical(other.errorCount, errorCount) || other.errorCount == errorCount)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.session, session) || other.session == session)&&(identical(other.resetToken, resetToken) || other.resetToken == resetToken));
}


@override
int get hashCode => Object.hash(runtimeType,code,status,secondsLeft,isResending,errorCount,failure,session,resetToken);

@override
String toString() {
  return 'OtpState(code: $code, status: $status, secondsLeft: $secondsLeft, isResending: $isResending, errorCount: $errorCount, failure: $failure, session: $session, resetToken: $resetToken)';
}


}

/// @nodoc
abstract mixin class _$OtpStateCopyWith<$Res> implements $OtpStateCopyWith<$Res> {
  factory _$OtpStateCopyWith(_OtpState value, $Res Function(_OtpState) _then) = __$OtpStateCopyWithImpl;
@override @useResult
$Res call({
 String code, SubmitStatus status, int secondsLeft, bool isResending, int errorCount, Failure? failure, AuthSession? session, String? resetToken
});


@override $AuthSessionCopyWith<$Res>? get session;

}
/// @nodoc
class __$OtpStateCopyWithImpl<$Res>
    implements _$OtpStateCopyWith<$Res> {
  __$OtpStateCopyWithImpl(this._self, this._then);

  final _OtpState _self;
  final $Res Function(_OtpState) _then;

/// Create a copy of OtpState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? status = null,Object? secondsLeft = null,Object? isResending = null,Object? errorCount = null,Object? failure = freezed,Object? session = freezed,Object? resetToken = freezed,}) {
  return _then(_OtpState(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubmitStatus,secondsLeft: null == secondsLeft ? _self.secondsLeft : secondsLeft // ignore: cast_nullable_to_non_nullable
as int,isResending: null == isResending ? _self.isResending : isResending // ignore: cast_nullable_to_non_nullable
as bool,errorCount: null == errorCount ? _self.errorCount : errorCount // ignore: cast_nullable_to_non_nullable
as int,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as AuthSession?,resetToken: freezed == resetToken ? _self.resetToken : resetToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of OtpState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthSessionCopyWith<$Res>? get session {
    if (_self.session == null) {
    return null;
  }

  return $AuthSessionCopyWith<$Res>(_self.session!, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

// dart format on
