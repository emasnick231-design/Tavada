// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginState {

 LoginMode get mode; String get email; String get password; String get phone; bool get phoneValid; SubmitStatus get status; Failure? get failure;/// Set after a successful email/password log in.
 AuthSession? get session;/// Set once a phone login code has been sent.
 OtpDispatch? get dispatch;
/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginStateCopyWith<LoginState> get copyWith => _$LoginStateCopyWithImpl<LoginState>(this as LoginState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.phoneValid, phoneValid) || other.phoneValid == phoneValid)&&(identical(other.status, status) || other.status == status)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.session, session) || other.session == session)&&(identical(other.dispatch, dispatch) || other.dispatch == dispatch));
}


@override
int get hashCode => Object.hash(runtimeType,mode,email,password,phone,phoneValid,status,failure,session,dispatch);

@override
String toString() {
  return 'LoginState(mode: $mode, email: $email, password: $password, phone: $phone, phoneValid: $phoneValid, status: $status, failure: $failure, session: $session, dispatch: $dispatch)';
}


}

/// @nodoc
abstract mixin class $LoginStateCopyWith<$Res>  {
  factory $LoginStateCopyWith(LoginState value, $Res Function(LoginState) _then) = _$LoginStateCopyWithImpl;
@useResult
$Res call({
 LoginMode mode, String email, String password, String phone, bool phoneValid, SubmitStatus status, Failure? failure, AuthSession? session, OtpDispatch? dispatch
});


$AuthSessionCopyWith<$Res>? get session;$OtpDispatchCopyWith<$Res>? get dispatch;

}
/// @nodoc
class _$LoginStateCopyWithImpl<$Res>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._self, this._then);

  final LoginState _self;
  final $Res Function(LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? email = null,Object? password = null,Object? phone = null,Object? phoneValid = null,Object? status = null,Object? failure = freezed,Object? session = freezed,Object? dispatch = freezed,}) {
  return _then(_self.copyWith(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as LoginMode,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,phoneValid: null == phoneValid ? _self.phoneValid : phoneValid // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubmitStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as AuthSession?,dispatch: freezed == dispatch ? _self.dispatch : dispatch // ignore: cast_nullable_to_non_nullable
as OtpDispatch?,
  ));
}
/// Create a copy of LoginState
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
}/// Create a copy of LoginState
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


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginState value)  $default,){
final _that = this;
switch (_that) {
case _LoginState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginState value)?  $default,){
final _that = this;
switch (_that) {
case _LoginState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LoginMode mode,  String email,  String password,  String phone,  bool phoneValid,  SubmitStatus status,  Failure? failure,  AuthSession? session,  OtpDispatch? dispatch)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginState() when $default != null:
return $default(_that.mode,_that.email,_that.password,_that.phone,_that.phoneValid,_that.status,_that.failure,_that.session,_that.dispatch);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LoginMode mode,  String email,  String password,  String phone,  bool phoneValid,  SubmitStatus status,  Failure? failure,  AuthSession? session,  OtpDispatch? dispatch)  $default,) {final _that = this;
switch (_that) {
case _LoginState():
return $default(_that.mode,_that.email,_that.password,_that.phone,_that.phoneValid,_that.status,_that.failure,_that.session,_that.dispatch);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LoginMode mode,  String email,  String password,  String phone,  bool phoneValid,  SubmitStatus status,  Failure? failure,  AuthSession? session,  OtpDispatch? dispatch)?  $default,) {final _that = this;
switch (_that) {
case _LoginState() when $default != null:
return $default(_that.mode,_that.email,_that.password,_that.phone,_that.phoneValid,_that.status,_that.failure,_that.session,_that.dispatch);case _:
  return null;

}
}

}

/// @nodoc


class _LoginState extends LoginState {
  const _LoginState({this.mode = LoginMode.email, this.email = '', this.password = '', this.phone = '', this.phoneValid = false, this.status = SubmitStatus.idle, this.failure, this.session, this.dispatch}): super._();
  

@override@JsonKey() final  LoginMode mode;
@override@JsonKey() final  String email;
@override@JsonKey() final  String password;
@override@JsonKey() final  String phone;
@override@JsonKey() final  bool phoneValid;
@override@JsonKey() final  SubmitStatus status;
@override final  Failure? failure;
/// Set after a successful email/password log in.
@override final  AuthSession? session;
/// Set once a phone login code has been sent.
@override final  OtpDispatch? dispatch;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginStateCopyWith<_LoginState> get copyWith => __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.phoneValid, phoneValid) || other.phoneValid == phoneValid)&&(identical(other.status, status) || other.status == status)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.session, session) || other.session == session)&&(identical(other.dispatch, dispatch) || other.dispatch == dispatch));
}


@override
int get hashCode => Object.hash(runtimeType,mode,email,password,phone,phoneValid,status,failure,session,dispatch);

@override
String toString() {
  return 'LoginState(mode: $mode, email: $email, password: $password, phone: $phone, phoneValid: $phoneValid, status: $status, failure: $failure, session: $session, dispatch: $dispatch)';
}


}

/// @nodoc
abstract mixin class _$LoginStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(_LoginState value, $Res Function(_LoginState) _then) = __$LoginStateCopyWithImpl;
@override @useResult
$Res call({
 LoginMode mode, String email, String password, String phone, bool phoneValid, SubmitStatus status, Failure? failure, AuthSession? session, OtpDispatch? dispatch
});


@override $AuthSessionCopyWith<$Res>? get session;@override $OtpDispatchCopyWith<$Res>? get dispatch;

}
/// @nodoc
class __$LoginStateCopyWithImpl<$Res>
    implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(this._self, this._then);

  final _LoginState _self;
  final $Res Function(_LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? email = null,Object? password = null,Object? phone = null,Object? phoneValid = null,Object? status = null,Object? failure = freezed,Object? session = freezed,Object? dispatch = freezed,}) {
  return _then(_LoginState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as LoginMode,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,phoneValid: null == phoneValid ? _self.phoneValid : phoneValid // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubmitStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as AuthSession?,dispatch: freezed == dispatch ? _self.dispatch : dispatch // ignore: cast_nullable_to_non_nullable
as OtpDispatch?,
  ));
}

/// Create a copy of LoginState
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
}/// Create a copy of LoginState
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
