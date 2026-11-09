// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_overview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RewardsSummary {

 int get points;/// Points needed to unlock the next reward (e.g. 200).
 int get nextRewardPoints;/// Wallet credit granted per reward (e.g. £5).
@MoneyConverter() Money get rewardValue;/// Points granted for each successful referral.
 int get referralPoints; String get referralCode;
/// Create a copy of RewardsSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RewardsSummaryCopyWith<RewardsSummary> get copyWith => _$RewardsSummaryCopyWithImpl<RewardsSummary>(this as RewardsSummary, _$identity);

  /// Serializes this RewardsSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RewardsSummary&&(identical(other.points, points) || other.points == points)&&(identical(other.nextRewardPoints, nextRewardPoints) || other.nextRewardPoints == nextRewardPoints)&&(identical(other.rewardValue, rewardValue) || other.rewardValue == rewardValue)&&(identical(other.referralPoints, referralPoints) || other.referralPoints == referralPoints)&&(identical(other.referralCode, referralCode) || other.referralCode == referralCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,points,nextRewardPoints,rewardValue,referralPoints,referralCode);

@override
String toString() {
  return 'RewardsSummary(points: $points, nextRewardPoints: $nextRewardPoints, rewardValue: $rewardValue, referralPoints: $referralPoints, referralCode: $referralCode)';
}


}

/// @nodoc
abstract mixin class $RewardsSummaryCopyWith<$Res>  {
  factory $RewardsSummaryCopyWith(RewardsSummary value, $Res Function(RewardsSummary) _then) = _$RewardsSummaryCopyWithImpl;
@useResult
$Res call({
 int points, int nextRewardPoints,@MoneyConverter() Money rewardValue, int referralPoints, String referralCode
});




}
/// @nodoc
class _$RewardsSummaryCopyWithImpl<$Res>
    implements $RewardsSummaryCopyWith<$Res> {
  _$RewardsSummaryCopyWithImpl(this._self, this._then);

  final RewardsSummary _self;
  final $Res Function(RewardsSummary) _then;

/// Create a copy of RewardsSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? points = null,Object? nextRewardPoints = null,Object? rewardValue = null,Object? referralPoints = null,Object? referralCode = null,}) {
  return _then(_self.copyWith(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,nextRewardPoints: null == nextRewardPoints ? _self.nextRewardPoints : nextRewardPoints // ignore: cast_nullable_to_non_nullable
as int,rewardValue: null == rewardValue ? _self.rewardValue : rewardValue // ignore: cast_nullable_to_non_nullable
as Money,referralPoints: null == referralPoints ? _self.referralPoints : referralPoints // ignore: cast_nullable_to_non_nullable
as int,referralCode: null == referralCode ? _self.referralCode : referralCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RewardsSummary].
extension RewardsSummaryPatterns on RewardsSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RewardsSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RewardsSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RewardsSummary value)  $default,){
final _that = this;
switch (_that) {
case _RewardsSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RewardsSummary value)?  $default,){
final _that = this;
switch (_that) {
case _RewardsSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int points,  int nextRewardPoints, @MoneyConverter()  Money rewardValue,  int referralPoints,  String referralCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RewardsSummary() when $default != null:
return $default(_that.points,_that.nextRewardPoints,_that.rewardValue,_that.referralPoints,_that.referralCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int points,  int nextRewardPoints, @MoneyConverter()  Money rewardValue,  int referralPoints,  String referralCode)  $default,) {final _that = this;
switch (_that) {
case _RewardsSummary():
return $default(_that.points,_that.nextRewardPoints,_that.rewardValue,_that.referralPoints,_that.referralCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int points,  int nextRewardPoints, @MoneyConverter()  Money rewardValue,  int referralPoints,  String referralCode)?  $default,) {final _that = this;
switch (_that) {
case _RewardsSummary() when $default != null:
return $default(_that.points,_that.nextRewardPoints,_that.rewardValue,_that.referralPoints,_that.referralCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RewardsSummary extends RewardsSummary {
  const _RewardsSummary({required this.points, required this.nextRewardPoints, @MoneyConverter() required this.rewardValue, this.referralPoints = 0, this.referralCode = ''}): super._();
  factory _RewardsSummary.fromJson(Map<String, dynamic> json) => _$RewardsSummaryFromJson(json);

@override final  int points;
/// Points needed to unlock the next reward (e.g. 200).
@override final  int nextRewardPoints;
/// Wallet credit granted per reward (e.g. £5).
@override@MoneyConverter() final  Money rewardValue;
/// Points granted for each successful referral.
@override@JsonKey() final  int referralPoints;
@override@JsonKey() final  String referralCode;

/// Create a copy of RewardsSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RewardsSummaryCopyWith<_RewardsSummary> get copyWith => __$RewardsSummaryCopyWithImpl<_RewardsSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RewardsSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RewardsSummary&&(identical(other.points, points) || other.points == points)&&(identical(other.nextRewardPoints, nextRewardPoints) || other.nextRewardPoints == nextRewardPoints)&&(identical(other.rewardValue, rewardValue) || other.rewardValue == rewardValue)&&(identical(other.referralPoints, referralPoints) || other.referralPoints == referralPoints)&&(identical(other.referralCode, referralCode) || other.referralCode == referralCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,points,nextRewardPoints,rewardValue,referralPoints,referralCode);

@override
String toString() {
  return 'RewardsSummary(points: $points, nextRewardPoints: $nextRewardPoints, rewardValue: $rewardValue, referralPoints: $referralPoints, referralCode: $referralCode)';
}


}

/// @nodoc
abstract mixin class _$RewardsSummaryCopyWith<$Res> implements $RewardsSummaryCopyWith<$Res> {
  factory _$RewardsSummaryCopyWith(_RewardsSummary value, $Res Function(_RewardsSummary) _then) = __$RewardsSummaryCopyWithImpl;
@override @useResult
$Res call({
 int points, int nextRewardPoints,@MoneyConverter() Money rewardValue, int referralPoints, String referralCode
});




}
/// @nodoc
class __$RewardsSummaryCopyWithImpl<$Res>
    implements _$RewardsSummaryCopyWith<$Res> {
  __$RewardsSummaryCopyWithImpl(this._self, this._then);

  final _RewardsSummary _self;
  final $Res Function(_RewardsSummary) _then;

/// Create a copy of RewardsSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? points = null,Object? nextRewardPoints = null,Object? rewardValue = null,Object? referralPoints = null,Object? referralCode = null,}) {
  return _then(_RewardsSummary(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,nextRewardPoints: null == nextRewardPoints ? _self.nextRewardPoints : nextRewardPoints // ignore: cast_nullable_to_non_nullable
as int,rewardValue: null == rewardValue ? _self.rewardValue : rewardValue // ignore: cast_nullable_to_non_nullable
as Money,referralPoints: null == referralPoints ? _self.referralPoints : referralPoints // ignore: cast_nullable_to_non_nullable
as int,referralCode: null == referralCode ? _self.referralCode : referralCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AccountOverview {

@MoneyConverter() Money get walletBalance; RewardsSummary get rewards;
/// Create a copy of AccountOverview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountOverviewCopyWith<AccountOverview> get copyWith => _$AccountOverviewCopyWithImpl<AccountOverview>(this as AccountOverview, _$identity);

  /// Serializes this AccountOverview to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountOverview&&(identical(other.walletBalance, walletBalance) || other.walletBalance == walletBalance)&&(identical(other.rewards, rewards) || other.rewards == rewards));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,walletBalance,rewards);

@override
String toString() {
  return 'AccountOverview(walletBalance: $walletBalance, rewards: $rewards)';
}


}

/// @nodoc
abstract mixin class $AccountOverviewCopyWith<$Res>  {
  factory $AccountOverviewCopyWith(AccountOverview value, $Res Function(AccountOverview) _then) = _$AccountOverviewCopyWithImpl;
@useResult
$Res call({
@MoneyConverter() Money walletBalance, RewardsSummary rewards
});


$RewardsSummaryCopyWith<$Res> get rewards;

}
/// @nodoc
class _$AccountOverviewCopyWithImpl<$Res>
    implements $AccountOverviewCopyWith<$Res> {
  _$AccountOverviewCopyWithImpl(this._self, this._then);

  final AccountOverview _self;
  final $Res Function(AccountOverview) _then;

/// Create a copy of AccountOverview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? walletBalance = null,Object? rewards = null,}) {
  return _then(_self.copyWith(
walletBalance: null == walletBalance ? _self.walletBalance : walletBalance // ignore: cast_nullable_to_non_nullable
as Money,rewards: null == rewards ? _self.rewards : rewards // ignore: cast_nullable_to_non_nullable
as RewardsSummary,
  ));
}
/// Create a copy of AccountOverview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RewardsSummaryCopyWith<$Res> get rewards {
  
  return $RewardsSummaryCopyWith<$Res>(_self.rewards, (value) {
    return _then(_self.copyWith(rewards: value));
  });
}
}


/// Adds pattern-matching-related methods to [AccountOverview].
extension AccountOverviewPatterns on AccountOverview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountOverview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountOverview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountOverview value)  $default,){
final _that = this;
switch (_that) {
case _AccountOverview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountOverview value)?  $default,){
final _that = this;
switch (_that) {
case _AccountOverview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@MoneyConverter()  Money walletBalance,  RewardsSummary rewards)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountOverview() when $default != null:
return $default(_that.walletBalance,_that.rewards);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@MoneyConverter()  Money walletBalance,  RewardsSummary rewards)  $default,) {final _that = this;
switch (_that) {
case _AccountOverview():
return $default(_that.walletBalance,_that.rewards);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@MoneyConverter()  Money walletBalance,  RewardsSummary rewards)?  $default,) {final _that = this;
switch (_that) {
case _AccountOverview() when $default != null:
return $default(_that.walletBalance,_that.rewards);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountOverview implements AccountOverview {
  const _AccountOverview({@MoneyConverter() required this.walletBalance, required this.rewards});
  factory _AccountOverview.fromJson(Map<String, dynamic> json) => _$AccountOverviewFromJson(json);

@override@MoneyConverter() final  Money walletBalance;
@override final  RewardsSummary rewards;

/// Create a copy of AccountOverview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountOverviewCopyWith<_AccountOverview> get copyWith => __$AccountOverviewCopyWithImpl<_AccountOverview>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountOverviewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountOverview&&(identical(other.walletBalance, walletBalance) || other.walletBalance == walletBalance)&&(identical(other.rewards, rewards) || other.rewards == rewards));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,walletBalance,rewards);

@override
String toString() {
  return 'AccountOverview(walletBalance: $walletBalance, rewards: $rewards)';
}


}

/// @nodoc
abstract mixin class _$AccountOverviewCopyWith<$Res> implements $AccountOverviewCopyWith<$Res> {
  factory _$AccountOverviewCopyWith(_AccountOverview value, $Res Function(_AccountOverview) _then) = __$AccountOverviewCopyWithImpl;
@override @useResult
$Res call({
@MoneyConverter() Money walletBalance, RewardsSummary rewards
});


@override $RewardsSummaryCopyWith<$Res> get rewards;

}
/// @nodoc
class __$AccountOverviewCopyWithImpl<$Res>
    implements _$AccountOverviewCopyWith<$Res> {
  __$AccountOverviewCopyWithImpl(this._self, this._then);

  final _AccountOverview _self;
  final $Res Function(_AccountOverview) _then;

/// Create a copy of AccountOverview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? walletBalance = null,Object? rewards = null,}) {
  return _then(_AccountOverview(
walletBalance: null == walletBalance ? _self.walletBalance : walletBalance // ignore: cast_nullable_to_non_nullable
as Money,rewards: null == rewards ? _self.rewards : rewards // ignore: cast_nullable_to_non_nullable
as RewardsSummary,
  ));
}

/// Create a copy of AccountOverview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RewardsSummaryCopyWith<$Res> get rewards {
  
  return $RewardsSummaryCopyWith<$Res>(_self.rewards, (value) {
    return _then(_self.copyWith(rewards: value));
  });
}
}

// dart format on
