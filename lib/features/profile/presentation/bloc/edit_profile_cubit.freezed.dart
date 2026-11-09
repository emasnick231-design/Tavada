// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditProfileState {

 String get initialFirstName; String get initialLastName; String get firstName; String get lastName; SubmitStatus get status; Failure? get failure; UserProfile? get updatedUser;
/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditProfileStateCopyWith<EditProfileState> get copyWith => _$EditProfileStateCopyWithImpl<EditProfileState>(this as EditProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditProfileState&&(identical(other.initialFirstName, initialFirstName) || other.initialFirstName == initialFirstName)&&(identical(other.initialLastName, initialLastName) || other.initialLastName == initialLastName)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.status, status) || other.status == status)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.updatedUser, updatedUser) || other.updatedUser == updatedUser));
}


@override
int get hashCode => Object.hash(runtimeType,initialFirstName,initialLastName,firstName,lastName,status,failure,updatedUser);

@override
String toString() {
  return 'EditProfileState(initialFirstName: $initialFirstName, initialLastName: $initialLastName, firstName: $firstName, lastName: $lastName, status: $status, failure: $failure, updatedUser: $updatedUser)';
}


}

/// @nodoc
abstract mixin class $EditProfileStateCopyWith<$Res>  {
  factory $EditProfileStateCopyWith(EditProfileState value, $Res Function(EditProfileState) _then) = _$EditProfileStateCopyWithImpl;
@useResult
$Res call({
 String initialFirstName, String initialLastName, String firstName, String lastName, SubmitStatus status, Failure? failure, UserProfile? updatedUser
});


$UserProfileCopyWith<$Res>? get updatedUser;

}
/// @nodoc
class _$EditProfileStateCopyWithImpl<$Res>
    implements $EditProfileStateCopyWith<$Res> {
  _$EditProfileStateCopyWithImpl(this._self, this._then);

  final EditProfileState _self;
  final $Res Function(EditProfileState) _then;

/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? initialFirstName = null,Object? initialLastName = null,Object? firstName = null,Object? lastName = null,Object? status = null,Object? failure = freezed,Object? updatedUser = freezed,}) {
  return _then(_self.copyWith(
initialFirstName: null == initialFirstName ? _self.initialFirstName : initialFirstName // ignore: cast_nullable_to_non_nullable
as String,initialLastName: null == initialLastName ? _self.initialLastName : initialLastName // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubmitStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,updatedUser: freezed == updatedUser ? _self.updatedUser : updatedUser // ignore: cast_nullable_to_non_nullable
as UserProfile?,
  ));
}
/// Create a copy of EditProfileState
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


/// Adds pattern-matching-related methods to [EditProfileState].
extension EditProfileStatePatterns on EditProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditProfileState value)  $default,){
final _that = this;
switch (_that) {
case _EditProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _EditProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String initialFirstName,  String initialLastName,  String firstName,  String lastName,  SubmitStatus status,  Failure? failure,  UserProfile? updatedUser)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditProfileState() when $default != null:
return $default(_that.initialFirstName,_that.initialLastName,_that.firstName,_that.lastName,_that.status,_that.failure,_that.updatedUser);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String initialFirstName,  String initialLastName,  String firstName,  String lastName,  SubmitStatus status,  Failure? failure,  UserProfile? updatedUser)  $default,) {final _that = this;
switch (_that) {
case _EditProfileState():
return $default(_that.initialFirstName,_that.initialLastName,_that.firstName,_that.lastName,_that.status,_that.failure,_that.updatedUser);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String initialFirstName,  String initialLastName,  String firstName,  String lastName,  SubmitStatus status,  Failure? failure,  UserProfile? updatedUser)?  $default,) {final _that = this;
switch (_that) {
case _EditProfileState() when $default != null:
return $default(_that.initialFirstName,_that.initialLastName,_that.firstName,_that.lastName,_that.status,_that.failure,_that.updatedUser);case _:
  return null;

}
}

}

/// @nodoc


class _EditProfileState extends EditProfileState {
  const _EditProfileState({this.initialFirstName = '', this.initialLastName = '', this.firstName = '', this.lastName = '', this.status = SubmitStatus.idle, this.failure, this.updatedUser}): super._();
  

@override@JsonKey() final  String initialFirstName;
@override@JsonKey() final  String initialLastName;
@override@JsonKey() final  String firstName;
@override@JsonKey() final  String lastName;
@override@JsonKey() final  SubmitStatus status;
@override final  Failure? failure;
@override final  UserProfile? updatedUser;

/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditProfileStateCopyWith<_EditProfileState> get copyWith => __$EditProfileStateCopyWithImpl<_EditProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditProfileState&&(identical(other.initialFirstName, initialFirstName) || other.initialFirstName == initialFirstName)&&(identical(other.initialLastName, initialLastName) || other.initialLastName == initialLastName)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.status, status) || other.status == status)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.updatedUser, updatedUser) || other.updatedUser == updatedUser));
}


@override
int get hashCode => Object.hash(runtimeType,initialFirstName,initialLastName,firstName,lastName,status,failure,updatedUser);

@override
String toString() {
  return 'EditProfileState(initialFirstName: $initialFirstName, initialLastName: $initialLastName, firstName: $firstName, lastName: $lastName, status: $status, failure: $failure, updatedUser: $updatedUser)';
}


}

/// @nodoc
abstract mixin class _$EditProfileStateCopyWith<$Res> implements $EditProfileStateCopyWith<$Res> {
  factory _$EditProfileStateCopyWith(_EditProfileState value, $Res Function(_EditProfileState) _then) = __$EditProfileStateCopyWithImpl;
@override @useResult
$Res call({
 String initialFirstName, String initialLastName, String firstName, String lastName, SubmitStatus status, Failure? failure, UserProfile? updatedUser
});


@override $UserProfileCopyWith<$Res>? get updatedUser;

}
/// @nodoc
class __$EditProfileStateCopyWithImpl<$Res>
    implements _$EditProfileStateCopyWith<$Res> {
  __$EditProfileStateCopyWithImpl(this._self, this._then);

  final _EditProfileState _self;
  final $Res Function(_EditProfileState) _then;

/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? initialFirstName = null,Object? initialLastName = null,Object? firstName = null,Object? lastName = null,Object? status = null,Object? failure = freezed,Object? updatedUser = freezed,}) {
  return _then(_EditProfileState(
initialFirstName: null == initialFirstName ? _self.initialFirstName : initialFirstName // ignore: cast_nullable_to_non_nullable
as String,initialLastName: null == initialLastName ? _self.initialLastName : initialLastName // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubmitStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,updatedUser: freezed == updatedUser ? _self.updatedUser : updatedUser // ignore: cast_nullable_to_non_nullable
as UserProfile?,
  ));
}

/// Create a copy of EditProfileState
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
