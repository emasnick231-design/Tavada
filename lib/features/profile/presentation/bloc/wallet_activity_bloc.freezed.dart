// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_activity_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WalletActivityState {

 ViewStatus get status; List<WalletTransaction> get transactions; Failure? get failure; bool get isRefreshing;
/// Create a copy of WalletActivityState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletActivityStateCopyWith<WalletActivityState> get copyWith => _$WalletActivityStateCopyWithImpl<WalletActivityState>(this as WalletActivityState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletActivityState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.transactions, transactions)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(transactions),failure,isRefreshing);

@override
String toString() {
  return 'WalletActivityState(status: $status, transactions: $transactions, failure: $failure, isRefreshing: $isRefreshing)';
}


}

/// @nodoc
abstract mixin class $WalletActivityStateCopyWith<$Res>  {
  factory $WalletActivityStateCopyWith(WalletActivityState value, $Res Function(WalletActivityState) _then) = _$WalletActivityStateCopyWithImpl;
@useResult
$Res call({
 ViewStatus status, List<WalletTransaction> transactions, Failure? failure, bool isRefreshing
});




}
/// @nodoc
class _$WalletActivityStateCopyWithImpl<$Res>
    implements $WalletActivityStateCopyWith<$Res> {
  _$WalletActivityStateCopyWithImpl(this._self, this._then);

  final WalletActivityState _self;
  final $Res Function(WalletActivityState) _then;

/// Create a copy of WalletActivityState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? transactions = null,Object? failure = freezed,Object? isRefreshing = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ViewStatus,transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<WalletTransaction>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [WalletActivityState].
extension WalletActivityStatePatterns on WalletActivityState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WalletActivityState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WalletActivityState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WalletActivityState value)  $default,){
final _that = this;
switch (_that) {
case _WalletActivityState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WalletActivityState value)?  $default,){
final _that = this;
switch (_that) {
case _WalletActivityState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ViewStatus status,  List<WalletTransaction> transactions,  Failure? failure,  bool isRefreshing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WalletActivityState() when $default != null:
return $default(_that.status,_that.transactions,_that.failure,_that.isRefreshing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ViewStatus status,  List<WalletTransaction> transactions,  Failure? failure,  bool isRefreshing)  $default,) {final _that = this;
switch (_that) {
case _WalletActivityState():
return $default(_that.status,_that.transactions,_that.failure,_that.isRefreshing);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ViewStatus status,  List<WalletTransaction> transactions,  Failure? failure,  bool isRefreshing)?  $default,) {final _that = this;
switch (_that) {
case _WalletActivityState() when $default != null:
return $default(_that.status,_that.transactions,_that.failure,_that.isRefreshing);case _:
  return null;

}
}

}

/// @nodoc


class _WalletActivityState implements WalletActivityState {
  const _WalletActivityState({this.status = ViewStatus.initial, final  List<WalletTransaction> transactions = const [], this.failure, this.isRefreshing = false}): _transactions = transactions;
  

@override@JsonKey() final  ViewStatus status;
 final  List<WalletTransaction> _transactions;
@override@JsonKey() List<WalletTransaction> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}

@override final  Failure? failure;
@override@JsonKey() final  bool isRefreshing;

/// Create a copy of WalletActivityState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletActivityStateCopyWith<_WalletActivityState> get copyWith => __$WalletActivityStateCopyWithImpl<_WalletActivityState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WalletActivityState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._transactions, _transactions)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_transactions),failure,isRefreshing);

@override
String toString() {
  return 'WalletActivityState(status: $status, transactions: $transactions, failure: $failure, isRefreshing: $isRefreshing)';
}


}

/// @nodoc
abstract mixin class _$WalletActivityStateCopyWith<$Res> implements $WalletActivityStateCopyWith<$Res> {
  factory _$WalletActivityStateCopyWith(_WalletActivityState value, $Res Function(_WalletActivityState) _then) = __$WalletActivityStateCopyWithImpl;
@override @useResult
$Res call({
 ViewStatus status, List<WalletTransaction> transactions, Failure? failure, bool isRefreshing
});




}
/// @nodoc
class __$WalletActivityStateCopyWithImpl<$Res>
    implements _$WalletActivityStateCopyWith<$Res> {
  __$WalletActivityStateCopyWithImpl(this._self, this._then);

  final _WalletActivityState _self;
  final $Res Function(_WalletActivityState) _then;

/// Create a copy of WalletActivityState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? transactions = null,Object? failure = freezed,Object? isRefreshing = null,}) {
  return _then(_WalletActivityState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ViewStatus,transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<WalletTransaction>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
