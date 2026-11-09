// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_step_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EmailStepState {

 String get email; String get firstName; String get lastName; SubmitStatus get status; Failure? get failure;
/// Create a copy of EmailStepState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailStepStateCopyWith<EmailStepState> get copyWith => _$EmailStepStateCopyWithImpl<EmailStepState>(this as EmailStepState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailStepState&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.status, status) || other.status == status)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,email,firstName,lastName,status,failure);

@override
String toString() {
  return 'EmailStepState(email: $email, firstName: $firstName, lastName: $lastName, status: $status, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $EmailStepStateCopyWith<$Res>  {
  factory $EmailStepStateCopyWith(EmailStepState value, $Res Function(EmailStepState) _then) = _$EmailStepStateCopyWithImpl;
@useResult
$Res call({
 String email, String firstName, String lastName, SubmitStatus status, Failure? failure
});




}
/// @nodoc
class _$EmailStepStateCopyWithImpl<$Res>
    implements $EmailStepStateCopyWith<$Res> {
  _$EmailStepStateCopyWithImpl(this._self, this._then);

  final EmailStepState _self;
  final $Res Function(EmailStepState) _then;

/// Create a copy of EmailStepState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? firstName = null,Object? lastName = null,Object? status = null,Object? failure = freezed,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubmitStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [EmailStepState].
extension EmailStepStatePatterns on EmailStepState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmailStepState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmailStepState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmailStepState value)  $default,){
final _that = this;
switch (_that) {
case _EmailStepState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmailStepState value)?  $default,){
final _that = this;
switch (_that) {
case _EmailStepState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String firstName,  String lastName,  SubmitStatus status,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmailStepState() when $default != null:
return $default(_that.email,_that.firstName,_that.lastName,_that.status,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String firstName,  String lastName,  SubmitStatus status,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _EmailStepState():
return $default(_that.email,_that.firstName,_that.lastName,_that.status,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String firstName,  String lastName,  SubmitStatus status,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _EmailStepState() when $default != null:
return $default(_that.email,_that.firstName,_that.lastName,_that.status,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _EmailStepState extends EmailStepState {
  const _EmailStepState({this.email = '', this.firstName = '', this.lastName = '', this.status = SubmitStatus.idle, this.failure}): super._();
  

@override@JsonKey() final  String email;
@override@JsonKey() final  String firstName;
@override@JsonKey() final  String lastName;
@override@JsonKey() final  SubmitStatus status;
@override final  Failure? failure;

/// Create a copy of EmailStepState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailStepStateCopyWith<_EmailStepState> get copyWith => __$EmailStepStateCopyWithImpl<_EmailStepState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailStepState&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.status, status) || other.status == status)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,email,firstName,lastName,status,failure);

@override
String toString() {
  return 'EmailStepState(email: $email, firstName: $firstName, lastName: $lastName, status: $status, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$EmailStepStateCopyWith<$Res> implements $EmailStepStateCopyWith<$Res> {
  factory _$EmailStepStateCopyWith(_EmailStepState value, $Res Function(_EmailStepState) _then) = __$EmailStepStateCopyWithImpl;
@override @useResult
$Res call({
 String email, String firstName, String lastName, SubmitStatus status, Failure? failure
});




}
/// @nodoc
class __$EmailStepStateCopyWithImpl<$Res>
    implements _$EmailStepStateCopyWith<$Res> {
  __$EmailStepStateCopyWithImpl(this._self, this._then);

  final _EmailStepState _self;
  final $Res Function(_EmailStepState) _then;

/// Create a copy of EmailStepState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? firstName = null,Object? lastName = null,Object? status = null,Object? failure = freezed,}) {
  return _then(_EmailStepState(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubmitStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
