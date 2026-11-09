// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_money_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddMoneyState {

 Money get amount; SubmitStatus get status; AccountOverview? get result; Failure? get failure;/// Bumped whenever input is rejected (over the limit) to trigger a shake.
 int get rejectedInputs;
/// Create a copy of AddMoneyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddMoneyStateCopyWith<AddMoneyState> get copyWith => _$AddMoneyStateCopyWithImpl<AddMoneyState>(this as AddMoneyState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddMoneyState&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.result, result) || other.result == result)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.rejectedInputs, rejectedInputs) || other.rejectedInputs == rejectedInputs));
}


@override
int get hashCode => Object.hash(runtimeType,amount,status,result,failure,rejectedInputs);

@override
String toString() {
  return 'AddMoneyState(amount: $amount, status: $status, result: $result, failure: $failure, rejectedInputs: $rejectedInputs)';
}


}

/// @nodoc
abstract mixin class $AddMoneyStateCopyWith<$Res>  {
  factory $AddMoneyStateCopyWith(AddMoneyState value, $Res Function(AddMoneyState) _then) = _$AddMoneyStateCopyWithImpl;
@useResult
$Res call({
 Money amount, SubmitStatus status, AccountOverview? result, Failure? failure, int rejectedInputs
});


$AccountOverviewCopyWith<$Res>? get result;

}
/// @nodoc
class _$AddMoneyStateCopyWithImpl<$Res>
    implements $AddMoneyStateCopyWith<$Res> {
  _$AddMoneyStateCopyWithImpl(this._self, this._then);

  final AddMoneyState _self;
  final $Res Function(AddMoneyState) _then;

/// Create a copy of AddMoneyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,Object? status = null,Object? result = freezed,Object? failure = freezed,Object? rejectedInputs = null,}) {
  return _then(_self.copyWith(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubmitStatus,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as AccountOverview?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,rejectedInputs: null == rejectedInputs ? _self.rejectedInputs : rejectedInputs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of AddMoneyState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountOverviewCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $AccountOverviewCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}


/// Adds pattern-matching-related methods to [AddMoneyState].
extension AddMoneyStatePatterns on AddMoneyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddMoneyState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddMoneyState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddMoneyState value)  $default,){
final _that = this;
switch (_that) {
case _AddMoneyState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddMoneyState value)?  $default,){
final _that = this;
switch (_that) {
case _AddMoneyState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Money amount,  SubmitStatus status,  AccountOverview? result,  Failure? failure,  int rejectedInputs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddMoneyState() when $default != null:
return $default(_that.amount,_that.status,_that.result,_that.failure,_that.rejectedInputs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Money amount,  SubmitStatus status,  AccountOverview? result,  Failure? failure,  int rejectedInputs)  $default,) {final _that = this;
switch (_that) {
case _AddMoneyState():
return $default(_that.amount,_that.status,_that.result,_that.failure,_that.rejectedInputs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Money amount,  SubmitStatus status,  AccountOverview? result,  Failure? failure,  int rejectedInputs)?  $default,) {final _that = this;
switch (_that) {
case _AddMoneyState() when $default != null:
return $default(_that.amount,_that.status,_that.result,_that.failure,_that.rejectedInputs);case _:
  return null;

}
}

}

/// @nodoc


class _AddMoneyState extends AddMoneyState {
  const _AddMoneyState({this.amount = Money.zero, this.status = SubmitStatus.idle, this.result, this.failure, this.rejectedInputs = 0}): super._();
  

@override@JsonKey() final  Money amount;
@override@JsonKey() final  SubmitStatus status;
@override final  AccountOverview? result;
@override final  Failure? failure;
/// Bumped whenever input is rejected (over the limit) to trigger a shake.
@override@JsonKey() final  int rejectedInputs;

/// Create a copy of AddMoneyState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddMoneyStateCopyWith<_AddMoneyState> get copyWith => __$AddMoneyStateCopyWithImpl<_AddMoneyState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddMoneyState&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.result, result) || other.result == result)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.rejectedInputs, rejectedInputs) || other.rejectedInputs == rejectedInputs));
}


@override
int get hashCode => Object.hash(runtimeType,amount,status,result,failure,rejectedInputs);

@override
String toString() {
  return 'AddMoneyState(amount: $amount, status: $status, result: $result, failure: $failure, rejectedInputs: $rejectedInputs)';
}


}

/// @nodoc
abstract mixin class _$AddMoneyStateCopyWith<$Res> implements $AddMoneyStateCopyWith<$Res> {
  factory _$AddMoneyStateCopyWith(_AddMoneyState value, $Res Function(_AddMoneyState) _then) = __$AddMoneyStateCopyWithImpl;
@override @useResult
$Res call({
 Money amount, SubmitStatus status, AccountOverview? result, Failure? failure, int rejectedInputs
});


@override $AccountOverviewCopyWith<$Res>? get result;

}
/// @nodoc
class __$AddMoneyStateCopyWithImpl<$Res>
    implements _$AddMoneyStateCopyWith<$Res> {
  __$AddMoneyStateCopyWithImpl(this._self, this._then);

  final _AddMoneyState _self;
  final $Res Function(_AddMoneyState) _then;

/// Create a copy of AddMoneyState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,Object? status = null,Object? result = freezed,Object? failure = freezed,Object? rejectedInputs = null,}) {
  return _then(_AddMoneyState(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubmitStatus,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as AccountOverview?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,rejectedInputs: null == rejectedInputs ? _self.rejectedInputs : rejectedInputs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of AddMoneyState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountOverviewCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $AccountOverviewCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

// dart format on
