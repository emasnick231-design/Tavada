// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rewards_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RewardsState {

 ViewStatus get status; AccountOverview? get overview; SubmitStatus get redeemStatus; Failure? get failure; Failure? get redeemFailure;/// Incremented on every successful redemption (drives the confetti).
 int get redemptions;
/// Create a copy of RewardsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RewardsStateCopyWith<RewardsState> get copyWith => _$RewardsStateCopyWithImpl<RewardsState>(this as RewardsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RewardsState&&(identical(other.status, status) || other.status == status)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.redeemStatus, redeemStatus) || other.redeemStatus == redeemStatus)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.redeemFailure, redeemFailure) || other.redeemFailure == redeemFailure)&&(identical(other.redemptions, redemptions) || other.redemptions == redemptions));
}


@override
int get hashCode => Object.hash(runtimeType,status,overview,redeemStatus,failure,redeemFailure,redemptions);

@override
String toString() {
  return 'RewardsState(status: $status, overview: $overview, redeemStatus: $redeemStatus, failure: $failure, redeemFailure: $redeemFailure, redemptions: $redemptions)';
}


}

/// @nodoc
abstract mixin class $RewardsStateCopyWith<$Res>  {
  factory $RewardsStateCopyWith(RewardsState value, $Res Function(RewardsState) _then) = _$RewardsStateCopyWithImpl;
@useResult
$Res call({
 ViewStatus status, AccountOverview? overview, SubmitStatus redeemStatus, Failure? failure, Failure? redeemFailure, int redemptions
});


$AccountOverviewCopyWith<$Res>? get overview;

}
/// @nodoc
class _$RewardsStateCopyWithImpl<$Res>
    implements $RewardsStateCopyWith<$Res> {
  _$RewardsStateCopyWithImpl(this._self, this._then);

  final RewardsState _self;
  final $Res Function(RewardsState) _then;

/// Create a copy of RewardsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? overview = freezed,Object? redeemStatus = null,Object? failure = freezed,Object? redeemFailure = freezed,Object? redemptions = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ViewStatus,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as AccountOverview?,redeemStatus: null == redeemStatus ? _self.redeemStatus : redeemStatus // ignore: cast_nullable_to_non_nullable
as SubmitStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,redeemFailure: freezed == redeemFailure ? _self.redeemFailure : redeemFailure // ignore: cast_nullable_to_non_nullable
as Failure?,redemptions: null == redemptions ? _self.redemptions : redemptions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of RewardsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountOverviewCopyWith<$Res>? get overview {
    if (_self.overview == null) {
    return null;
  }

  return $AccountOverviewCopyWith<$Res>(_self.overview!, (value) {
    return _then(_self.copyWith(overview: value));
  });
}
}


/// Adds pattern-matching-related methods to [RewardsState].
extension RewardsStatePatterns on RewardsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RewardsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RewardsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RewardsState value)  $default,){
final _that = this;
switch (_that) {
case _RewardsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RewardsState value)?  $default,){
final _that = this;
switch (_that) {
case _RewardsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ViewStatus status,  AccountOverview? overview,  SubmitStatus redeemStatus,  Failure? failure,  Failure? redeemFailure,  int redemptions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RewardsState() when $default != null:
return $default(_that.status,_that.overview,_that.redeemStatus,_that.failure,_that.redeemFailure,_that.redemptions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ViewStatus status,  AccountOverview? overview,  SubmitStatus redeemStatus,  Failure? failure,  Failure? redeemFailure,  int redemptions)  $default,) {final _that = this;
switch (_that) {
case _RewardsState():
return $default(_that.status,_that.overview,_that.redeemStatus,_that.failure,_that.redeemFailure,_that.redemptions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ViewStatus status,  AccountOverview? overview,  SubmitStatus redeemStatus,  Failure? failure,  Failure? redeemFailure,  int redemptions)?  $default,) {final _that = this;
switch (_that) {
case _RewardsState() when $default != null:
return $default(_that.status,_that.overview,_that.redeemStatus,_that.failure,_that.redeemFailure,_that.redemptions);case _:
  return null;

}
}

}

/// @nodoc


class _RewardsState extends RewardsState {
  const _RewardsState({this.status = ViewStatus.initial, this.overview, this.redeemStatus = SubmitStatus.idle, this.failure, this.redeemFailure, this.redemptions = 0}): super._();
  

@override@JsonKey() final  ViewStatus status;
@override final  AccountOverview? overview;
@override@JsonKey() final  SubmitStatus redeemStatus;
@override final  Failure? failure;
@override final  Failure? redeemFailure;
/// Incremented on every successful redemption (drives the confetti).
@override@JsonKey() final  int redemptions;

/// Create a copy of RewardsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RewardsStateCopyWith<_RewardsState> get copyWith => __$RewardsStateCopyWithImpl<_RewardsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RewardsState&&(identical(other.status, status) || other.status == status)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.redeemStatus, redeemStatus) || other.redeemStatus == redeemStatus)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.redeemFailure, redeemFailure) || other.redeemFailure == redeemFailure)&&(identical(other.redemptions, redemptions) || other.redemptions == redemptions));
}


@override
int get hashCode => Object.hash(runtimeType,status,overview,redeemStatus,failure,redeemFailure,redemptions);

@override
String toString() {
  return 'RewardsState(status: $status, overview: $overview, redeemStatus: $redeemStatus, failure: $failure, redeemFailure: $redeemFailure, redemptions: $redemptions)';
}


}

/// @nodoc
abstract mixin class _$RewardsStateCopyWith<$Res> implements $RewardsStateCopyWith<$Res> {
  factory _$RewardsStateCopyWith(_RewardsState value, $Res Function(_RewardsState) _then) = __$RewardsStateCopyWithImpl;
@override @useResult
$Res call({
 ViewStatus status, AccountOverview? overview, SubmitStatus redeemStatus, Failure? failure, Failure? redeemFailure, int redemptions
});


@override $AccountOverviewCopyWith<$Res>? get overview;

}
/// @nodoc
class __$RewardsStateCopyWithImpl<$Res>
    implements _$RewardsStateCopyWith<$Res> {
  __$RewardsStateCopyWithImpl(this._self, this._then);

  final _RewardsState _self;
  final $Res Function(_RewardsState) _then;

/// Create a copy of RewardsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? overview = freezed,Object? redeemStatus = null,Object? failure = freezed,Object? redeemFailure = freezed,Object? redemptions = null,}) {
  return _then(_RewardsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ViewStatus,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as AccountOverview?,redeemStatus: null == redeemStatus ? _self.redeemStatus : redeemStatus // ignore: cast_nullable_to_non_nullable
as SubmitStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,redeemFailure: freezed == redeemFailure ? _self.redeemFailure : redeemFailure // ignore: cast_nullable_to_non_nullable
as Failure?,redemptions: null == redemptions ? _self.redemptions : redemptions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of RewardsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountOverviewCopyWith<$Res>? get overview {
    if (_self.overview == null) {
    return null;
  }

  return $AccountOverviewCopyWith<$Res>(_self.overview!, (value) {
    return _then(_self.copyWith(overview: value));
  });
}
}

// dart format on
