// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_quote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckoutQuote {

@MoneyConverter() Money get subtotal;@MoneyConverter() Money get deliveryFee;@MoneyConverter() Money get serviceFee;@MoneyConverter() Money get total;@MoneyConverter() Money get discount;/// Struck-through fee when delivery is discounted/free.
@NullableMoneyConverter() Money? get originalDeliveryFee;/// Struck-through total when savings apply.
@NullableMoneyConverter() Money? get originalTotal; int get etaMinutes; double get distanceMiles; bool get firstOrderApplied;
/// Create a copy of CheckoutQuote
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutQuoteCopyWith<CheckoutQuote> get copyWith => _$CheckoutQuoteCopyWithImpl<CheckoutQuote>(this as CheckoutQuote, _$identity);

  /// Serializes this CheckoutQuote to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutQuote&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.serviceFee, serviceFee) || other.serviceFee == serviceFee)&&(identical(other.total, total) || other.total == total)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.originalDeliveryFee, originalDeliveryFee) || other.originalDeliveryFee == originalDeliveryFee)&&(identical(other.originalTotal, originalTotal) || other.originalTotal == originalTotal)&&(identical(other.etaMinutes, etaMinutes) || other.etaMinutes == etaMinutes)&&(identical(other.distanceMiles, distanceMiles) || other.distanceMiles == distanceMiles)&&(identical(other.firstOrderApplied, firstOrderApplied) || other.firstOrderApplied == firstOrderApplied));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subtotal,deliveryFee,serviceFee,total,discount,originalDeliveryFee,originalTotal,etaMinutes,distanceMiles,firstOrderApplied);

@override
String toString() {
  return 'CheckoutQuote(subtotal: $subtotal, deliveryFee: $deliveryFee, serviceFee: $serviceFee, total: $total, discount: $discount, originalDeliveryFee: $originalDeliveryFee, originalTotal: $originalTotal, etaMinutes: $etaMinutes, distanceMiles: $distanceMiles, firstOrderApplied: $firstOrderApplied)';
}


}

/// @nodoc
abstract mixin class $CheckoutQuoteCopyWith<$Res>  {
  factory $CheckoutQuoteCopyWith(CheckoutQuote value, $Res Function(CheckoutQuote) _then) = _$CheckoutQuoteCopyWithImpl;
@useResult
$Res call({
@MoneyConverter() Money subtotal,@MoneyConverter() Money deliveryFee,@MoneyConverter() Money serviceFee,@MoneyConverter() Money total,@MoneyConverter() Money discount,@NullableMoneyConverter() Money? originalDeliveryFee,@NullableMoneyConverter() Money? originalTotal, int etaMinutes, double distanceMiles, bool firstOrderApplied
});




}
/// @nodoc
class _$CheckoutQuoteCopyWithImpl<$Res>
    implements $CheckoutQuoteCopyWith<$Res> {
  _$CheckoutQuoteCopyWithImpl(this._self, this._then);

  final CheckoutQuote _self;
  final $Res Function(CheckoutQuote) _then;

/// Create a copy of CheckoutQuote
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subtotal = null,Object? deliveryFee = null,Object? serviceFee = null,Object? total = null,Object? discount = null,Object? originalDeliveryFee = freezed,Object? originalTotal = freezed,Object? etaMinutes = null,Object? distanceMiles = null,Object? firstOrderApplied = null,}) {
  return _then(_self.copyWith(
subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as Money,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as Money,serviceFee: null == serviceFee ? _self.serviceFee : serviceFee // ignore: cast_nullable_to_non_nullable
as Money,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as Money,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as Money,originalDeliveryFee: freezed == originalDeliveryFee ? _self.originalDeliveryFee : originalDeliveryFee // ignore: cast_nullable_to_non_nullable
as Money?,originalTotal: freezed == originalTotal ? _self.originalTotal : originalTotal // ignore: cast_nullable_to_non_nullable
as Money?,etaMinutes: null == etaMinutes ? _self.etaMinutes : etaMinutes // ignore: cast_nullable_to_non_nullable
as int,distanceMiles: null == distanceMiles ? _self.distanceMiles : distanceMiles // ignore: cast_nullable_to_non_nullable
as double,firstOrderApplied: null == firstOrderApplied ? _self.firstOrderApplied : firstOrderApplied // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckoutQuote].
extension CheckoutQuotePatterns on CheckoutQuote {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutQuote value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutQuote() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutQuote value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutQuote():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutQuote value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutQuote() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@MoneyConverter()  Money subtotal, @MoneyConverter()  Money deliveryFee, @MoneyConverter()  Money serviceFee, @MoneyConverter()  Money total, @MoneyConverter()  Money discount, @NullableMoneyConverter()  Money? originalDeliveryFee, @NullableMoneyConverter()  Money? originalTotal,  int etaMinutes,  double distanceMiles,  bool firstOrderApplied)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutQuote() when $default != null:
return $default(_that.subtotal,_that.deliveryFee,_that.serviceFee,_that.total,_that.discount,_that.originalDeliveryFee,_that.originalTotal,_that.etaMinutes,_that.distanceMiles,_that.firstOrderApplied);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@MoneyConverter()  Money subtotal, @MoneyConverter()  Money deliveryFee, @MoneyConverter()  Money serviceFee, @MoneyConverter()  Money total, @MoneyConverter()  Money discount, @NullableMoneyConverter()  Money? originalDeliveryFee, @NullableMoneyConverter()  Money? originalTotal,  int etaMinutes,  double distanceMiles,  bool firstOrderApplied)  $default,) {final _that = this;
switch (_that) {
case _CheckoutQuote():
return $default(_that.subtotal,_that.deliveryFee,_that.serviceFee,_that.total,_that.discount,_that.originalDeliveryFee,_that.originalTotal,_that.etaMinutes,_that.distanceMiles,_that.firstOrderApplied);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@MoneyConverter()  Money subtotal, @MoneyConverter()  Money deliveryFee, @MoneyConverter()  Money serviceFee, @MoneyConverter()  Money total, @MoneyConverter()  Money discount, @NullableMoneyConverter()  Money? originalDeliveryFee, @NullableMoneyConverter()  Money? originalTotal,  int etaMinutes,  double distanceMiles,  bool firstOrderApplied)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutQuote() when $default != null:
return $default(_that.subtotal,_that.deliveryFee,_that.serviceFee,_that.total,_that.discount,_that.originalDeliveryFee,_that.originalTotal,_that.etaMinutes,_that.distanceMiles,_that.firstOrderApplied);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckoutQuote implements CheckoutQuote {
  const _CheckoutQuote({@MoneyConverter() required this.subtotal, @MoneyConverter() required this.deliveryFee, @MoneyConverter() required this.serviceFee, @MoneyConverter() required this.total, @MoneyConverter() this.discount = Money.zero, @NullableMoneyConverter() this.originalDeliveryFee, @NullableMoneyConverter() this.originalTotal, this.etaMinutes = 20, this.distanceMiles = 0.5, this.firstOrderApplied = false});
  factory _CheckoutQuote.fromJson(Map<String, dynamic> json) => _$CheckoutQuoteFromJson(json);

@override@MoneyConverter() final  Money subtotal;
@override@MoneyConverter() final  Money deliveryFee;
@override@MoneyConverter() final  Money serviceFee;
@override@MoneyConverter() final  Money total;
@override@JsonKey()@MoneyConverter() final  Money discount;
/// Struck-through fee when delivery is discounted/free.
@override@NullableMoneyConverter() final  Money? originalDeliveryFee;
/// Struck-through total when savings apply.
@override@NullableMoneyConverter() final  Money? originalTotal;
@override@JsonKey() final  int etaMinutes;
@override@JsonKey() final  double distanceMiles;
@override@JsonKey() final  bool firstOrderApplied;

/// Create a copy of CheckoutQuote
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutQuoteCopyWith<_CheckoutQuote> get copyWith => __$CheckoutQuoteCopyWithImpl<_CheckoutQuote>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckoutQuoteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutQuote&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.serviceFee, serviceFee) || other.serviceFee == serviceFee)&&(identical(other.total, total) || other.total == total)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.originalDeliveryFee, originalDeliveryFee) || other.originalDeliveryFee == originalDeliveryFee)&&(identical(other.originalTotal, originalTotal) || other.originalTotal == originalTotal)&&(identical(other.etaMinutes, etaMinutes) || other.etaMinutes == etaMinutes)&&(identical(other.distanceMiles, distanceMiles) || other.distanceMiles == distanceMiles)&&(identical(other.firstOrderApplied, firstOrderApplied) || other.firstOrderApplied == firstOrderApplied));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subtotal,deliveryFee,serviceFee,total,discount,originalDeliveryFee,originalTotal,etaMinutes,distanceMiles,firstOrderApplied);

@override
String toString() {
  return 'CheckoutQuote(subtotal: $subtotal, deliveryFee: $deliveryFee, serviceFee: $serviceFee, total: $total, discount: $discount, originalDeliveryFee: $originalDeliveryFee, originalTotal: $originalTotal, etaMinutes: $etaMinutes, distanceMiles: $distanceMiles, firstOrderApplied: $firstOrderApplied)';
}


}

/// @nodoc
abstract mixin class _$CheckoutQuoteCopyWith<$Res> implements $CheckoutQuoteCopyWith<$Res> {
  factory _$CheckoutQuoteCopyWith(_CheckoutQuote value, $Res Function(_CheckoutQuote) _then) = __$CheckoutQuoteCopyWithImpl;
@override @useResult
$Res call({
@MoneyConverter() Money subtotal,@MoneyConverter() Money deliveryFee,@MoneyConverter() Money serviceFee,@MoneyConverter() Money total,@MoneyConverter() Money discount,@NullableMoneyConverter() Money? originalDeliveryFee,@NullableMoneyConverter() Money? originalTotal, int etaMinutes, double distanceMiles, bool firstOrderApplied
});




}
/// @nodoc
class __$CheckoutQuoteCopyWithImpl<$Res>
    implements _$CheckoutQuoteCopyWith<$Res> {
  __$CheckoutQuoteCopyWithImpl(this._self, this._then);

  final _CheckoutQuote _self;
  final $Res Function(_CheckoutQuote) _then;

/// Create a copy of CheckoutQuote
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subtotal = null,Object? deliveryFee = null,Object? serviceFee = null,Object? total = null,Object? discount = null,Object? originalDeliveryFee = freezed,Object? originalTotal = freezed,Object? etaMinutes = null,Object? distanceMiles = null,Object? firstOrderApplied = null,}) {
  return _then(_CheckoutQuote(
subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as Money,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as Money,serviceFee: null == serviceFee ? _self.serviceFee : serviceFee // ignore: cast_nullable_to_non_nullable
as Money,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as Money,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as Money,originalDeliveryFee: freezed == originalDeliveryFee ? _self.originalDeliveryFee : originalDeliveryFee // ignore: cast_nullable_to_non_nullable
as Money?,originalTotal: freezed == originalTotal ? _self.originalTotal : originalTotal // ignore: cast_nullable_to_non_nullable
as Money?,etaMinutes: null == etaMinutes ? _self.etaMinutes : etaMinutes // ignore: cast_nullable_to_non_nullable
as int,distanceMiles: null == distanceMiles ? _self.distanceMiles : distanceMiles // ignore: cast_nullable_to_non_nullable
as double,firstOrderApplied: null == firstOrderApplied ? _self.firstOrderApplied : firstOrderApplied // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$PaymentOptions {

@MoneyConverter() Money get walletBalance; String? get cardLabel;
/// Create a copy of PaymentOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentOptionsCopyWith<PaymentOptions> get copyWith => _$PaymentOptionsCopyWithImpl<PaymentOptions>(this as PaymentOptions, _$identity);

  /// Serializes this PaymentOptions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentOptions&&(identical(other.walletBalance, walletBalance) || other.walletBalance == walletBalance)&&(identical(other.cardLabel, cardLabel) || other.cardLabel == cardLabel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,walletBalance,cardLabel);

@override
String toString() {
  return 'PaymentOptions(walletBalance: $walletBalance, cardLabel: $cardLabel)';
}


}

/// @nodoc
abstract mixin class $PaymentOptionsCopyWith<$Res>  {
  factory $PaymentOptionsCopyWith(PaymentOptions value, $Res Function(PaymentOptions) _then) = _$PaymentOptionsCopyWithImpl;
@useResult
$Res call({
@MoneyConverter() Money walletBalance, String? cardLabel
});




}
/// @nodoc
class _$PaymentOptionsCopyWithImpl<$Res>
    implements $PaymentOptionsCopyWith<$Res> {
  _$PaymentOptionsCopyWithImpl(this._self, this._then);

  final PaymentOptions _self;
  final $Res Function(PaymentOptions) _then;

/// Create a copy of PaymentOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? walletBalance = null,Object? cardLabel = freezed,}) {
  return _then(_self.copyWith(
walletBalance: null == walletBalance ? _self.walletBalance : walletBalance // ignore: cast_nullable_to_non_nullable
as Money,cardLabel: freezed == cardLabel ? _self.cardLabel : cardLabel // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentOptions].
extension PaymentOptionsPatterns on PaymentOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentOptions value)  $default,){
final _that = this;
switch (_that) {
case _PaymentOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentOptions value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentOptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@MoneyConverter()  Money walletBalance,  String? cardLabel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentOptions() when $default != null:
return $default(_that.walletBalance,_that.cardLabel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@MoneyConverter()  Money walletBalance,  String? cardLabel)  $default,) {final _that = this;
switch (_that) {
case _PaymentOptions():
return $default(_that.walletBalance,_that.cardLabel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@MoneyConverter()  Money walletBalance,  String? cardLabel)?  $default,) {final _that = this;
switch (_that) {
case _PaymentOptions() when $default != null:
return $default(_that.walletBalance,_that.cardLabel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentOptions implements PaymentOptions {
  const _PaymentOptions({@MoneyConverter() required this.walletBalance, this.cardLabel});
  factory _PaymentOptions.fromJson(Map<String, dynamic> json) => _$PaymentOptionsFromJson(json);

@override@MoneyConverter() final  Money walletBalance;
@override final  String? cardLabel;

/// Create a copy of PaymentOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentOptionsCopyWith<_PaymentOptions> get copyWith => __$PaymentOptionsCopyWithImpl<_PaymentOptions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentOptionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentOptions&&(identical(other.walletBalance, walletBalance) || other.walletBalance == walletBalance)&&(identical(other.cardLabel, cardLabel) || other.cardLabel == cardLabel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,walletBalance,cardLabel);

@override
String toString() {
  return 'PaymentOptions(walletBalance: $walletBalance, cardLabel: $cardLabel)';
}


}

/// @nodoc
abstract mixin class _$PaymentOptionsCopyWith<$Res> implements $PaymentOptionsCopyWith<$Res> {
  factory _$PaymentOptionsCopyWith(_PaymentOptions value, $Res Function(_PaymentOptions) _then) = __$PaymentOptionsCopyWithImpl;
@override @useResult
$Res call({
@MoneyConverter() Money walletBalance, String? cardLabel
});




}
/// @nodoc
class __$PaymentOptionsCopyWithImpl<$Res>
    implements _$PaymentOptionsCopyWith<$Res> {
  __$PaymentOptionsCopyWithImpl(this._self, this._then);

  final _PaymentOptions _self;
  final $Res Function(_PaymentOptions) _then;

/// Create a copy of PaymentOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? walletBalance = null,Object? cardLabel = freezed,}) {
  return _then(_PaymentOptions(
walletBalance: null == walletBalance ? _self.walletBalance : walletBalance // ignore: cast_nullable_to_non_nullable
as Money,cardLabel: freezed == cardLabel ? _self.cardLabel : cardLabel // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
