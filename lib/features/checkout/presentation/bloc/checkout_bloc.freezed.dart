// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CheckoutState {

 String get restaurantId; List<OrderLine> get lines; ViewStatus get status; bool get isQuoting; Restaurant? get restaurant; CheckoutQuote? get quote; PaymentOptions? get paymentOptions; DeliveryMode get mode; PaymentMethodType get paymentMethod; String? get instructions; GiftDetails? get gift; bool get cutlery; SubmitStatus get submitStatus; Failure? get failure; Failure? get submitFailure; Order? get placedOrder;/// The last re-price failed: [quote] may be stale.
 Failure? get quoteFailure;
/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutStateCopyWith<CheckoutState> get copyWith => _$CheckoutStateCopyWithImpl<CheckoutState>(this as CheckoutState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutState&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&const DeepCollectionEquality().equals(other.lines, lines)&&(identical(other.status, status) || other.status == status)&&(identical(other.isQuoting, isQuoting) || other.isQuoting == isQuoting)&&(identical(other.restaurant, restaurant) || other.restaurant == restaurant)&&(identical(other.quote, quote) || other.quote == quote)&&(identical(other.paymentOptions, paymentOptions) || other.paymentOptions == paymentOptions)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.gift, gift) || other.gift == gift)&&(identical(other.cutlery, cutlery) || other.cutlery == cutlery)&&(identical(other.submitStatus, submitStatus) || other.submitStatus == submitStatus)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.submitFailure, submitFailure) || other.submitFailure == submitFailure)&&(identical(other.placedOrder, placedOrder) || other.placedOrder == placedOrder)&&(identical(other.quoteFailure, quoteFailure) || other.quoteFailure == quoteFailure));
}


@override
int get hashCode => Object.hash(runtimeType,restaurantId,const DeepCollectionEquality().hash(lines),status,isQuoting,restaurant,quote,paymentOptions,mode,paymentMethod,instructions,gift,cutlery,submitStatus,failure,submitFailure,placedOrder,quoteFailure);

@override
String toString() {
  return 'CheckoutState(restaurantId: $restaurantId, lines: $lines, status: $status, isQuoting: $isQuoting, restaurant: $restaurant, quote: $quote, paymentOptions: $paymentOptions, mode: $mode, paymentMethod: $paymentMethod, instructions: $instructions, gift: $gift, cutlery: $cutlery, submitStatus: $submitStatus, failure: $failure, submitFailure: $submitFailure, placedOrder: $placedOrder, quoteFailure: $quoteFailure)';
}


}

/// @nodoc
abstract mixin class $CheckoutStateCopyWith<$Res>  {
  factory $CheckoutStateCopyWith(CheckoutState value, $Res Function(CheckoutState) _then) = _$CheckoutStateCopyWithImpl;
@useResult
$Res call({
 String restaurantId, List<OrderLine> lines, ViewStatus status, bool isQuoting, Restaurant? restaurant, CheckoutQuote? quote, PaymentOptions? paymentOptions, DeliveryMode mode, PaymentMethodType paymentMethod, String? instructions, GiftDetails? gift, bool cutlery, SubmitStatus submitStatus, Failure? failure, Failure? submitFailure, Order? placedOrder, Failure? quoteFailure
});


$RestaurantCopyWith<$Res>? get restaurant;$CheckoutQuoteCopyWith<$Res>? get quote;$PaymentOptionsCopyWith<$Res>? get paymentOptions;$GiftDetailsCopyWith<$Res>? get gift;$OrderCopyWith<$Res>? get placedOrder;

}
/// @nodoc
class _$CheckoutStateCopyWithImpl<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  _$CheckoutStateCopyWithImpl(this._self, this._then);

  final CheckoutState _self;
  final $Res Function(CheckoutState) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? restaurantId = null,Object? lines = null,Object? status = null,Object? isQuoting = null,Object? restaurant = freezed,Object? quote = freezed,Object? paymentOptions = freezed,Object? mode = null,Object? paymentMethod = null,Object? instructions = freezed,Object? gift = freezed,Object? cutlery = null,Object? submitStatus = null,Object? failure = freezed,Object? submitFailure = freezed,Object? placedOrder = freezed,Object? quoteFailure = freezed,}) {
  return _then(_self.copyWith(
restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<OrderLine>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ViewStatus,isQuoting: null == isQuoting ? _self.isQuoting : isQuoting // ignore: cast_nullable_to_non_nullable
as bool,restaurant: freezed == restaurant ? _self.restaurant : restaurant // ignore: cast_nullable_to_non_nullable
as Restaurant?,quote: freezed == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as CheckoutQuote?,paymentOptions: freezed == paymentOptions ? _self.paymentOptions : paymentOptions // ignore: cast_nullable_to_non_nullable
as PaymentOptions?,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as DeliveryMode,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethodType,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,gift: freezed == gift ? _self.gift : gift // ignore: cast_nullable_to_non_nullable
as GiftDetails?,cutlery: null == cutlery ? _self.cutlery : cutlery // ignore: cast_nullable_to_non_nullable
as bool,submitStatus: null == submitStatus ? _self.submitStatus : submitStatus // ignore: cast_nullable_to_non_nullable
as SubmitStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,submitFailure: freezed == submitFailure ? _self.submitFailure : submitFailure // ignore: cast_nullable_to_non_nullable
as Failure?,placedOrder: freezed == placedOrder ? _self.placedOrder : placedOrder // ignore: cast_nullable_to_non_nullable
as Order?,quoteFailure: freezed == quoteFailure ? _self.quoteFailure : quoteFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RestaurantCopyWith<$Res>? get restaurant {
    if (_self.restaurant == null) {
    return null;
  }

  return $RestaurantCopyWith<$Res>(_self.restaurant!, (value) {
    return _then(_self.copyWith(restaurant: value));
  });
}/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheckoutQuoteCopyWith<$Res>? get quote {
    if (_self.quote == null) {
    return null;
  }

  return $CheckoutQuoteCopyWith<$Res>(_self.quote!, (value) {
    return _then(_self.copyWith(quote: value));
  });
}/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentOptionsCopyWith<$Res>? get paymentOptions {
    if (_self.paymentOptions == null) {
    return null;
  }

  return $PaymentOptionsCopyWith<$Res>(_self.paymentOptions!, (value) {
    return _then(_self.copyWith(paymentOptions: value));
  });
}/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GiftDetailsCopyWith<$Res>? get gift {
    if (_self.gift == null) {
    return null;
  }

  return $GiftDetailsCopyWith<$Res>(_self.gift!, (value) {
    return _then(_self.copyWith(gift: value));
  });
}/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCopyWith<$Res>? get placedOrder {
    if (_self.placedOrder == null) {
    return null;
  }

  return $OrderCopyWith<$Res>(_self.placedOrder!, (value) {
    return _then(_self.copyWith(placedOrder: value));
  });
}
}


/// Adds pattern-matching-related methods to [CheckoutState].
extension CheckoutStatePatterns on CheckoutState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutState value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutState value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String restaurantId,  List<OrderLine> lines,  ViewStatus status,  bool isQuoting,  Restaurant? restaurant,  CheckoutQuote? quote,  PaymentOptions? paymentOptions,  DeliveryMode mode,  PaymentMethodType paymentMethod,  String? instructions,  GiftDetails? gift,  bool cutlery,  SubmitStatus submitStatus,  Failure? failure,  Failure? submitFailure,  Order? placedOrder,  Failure? quoteFailure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutState() when $default != null:
return $default(_that.restaurantId,_that.lines,_that.status,_that.isQuoting,_that.restaurant,_that.quote,_that.paymentOptions,_that.mode,_that.paymentMethod,_that.instructions,_that.gift,_that.cutlery,_that.submitStatus,_that.failure,_that.submitFailure,_that.placedOrder,_that.quoteFailure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String restaurantId,  List<OrderLine> lines,  ViewStatus status,  bool isQuoting,  Restaurant? restaurant,  CheckoutQuote? quote,  PaymentOptions? paymentOptions,  DeliveryMode mode,  PaymentMethodType paymentMethod,  String? instructions,  GiftDetails? gift,  bool cutlery,  SubmitStatus submitStatus,  Failure? failure,  Failure? submitFailure,  Order? placedOrder,  Failure? quoteFailure)  $default,) {final _that = this;
switch (_that) {
case _CheckoutState():
return $default(_that.restaurantId,_that.lines,_that.status,_that.isQuoting,_that.restaurant,_that.quote,_that.paymentOptions,_that.mode,_that.paymentMethod,_that.instructions,_that.gift,_that.cutlery,_that.submitStatus,_that.failure,_that.submitFailure,_that.placedOrder,_that.quoteFailure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String restaurantId,  List<OrderLine> lines,  ViewStatus status,  bool isQuoting,  Restaurant? restaurant,  CheckoutQuote? quote,  PaymentOptions? paymentOptions,  DeliveryMode mode,  PaymentMethodType paymentMethod,  String? instructions,  GiftDetails? gift,  bool cutlery,  SubmitStatus submitStatus,  Failure? failure,  Failure? submitFailure,  Order? placedOrder,  Failure? quoteFailure)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutState() when $default != null:
return $default(_that.restaurantId,_that.lines,_that.status,_that.isQuoting,_that.restaurant,_that.quote,_that.paymentOptions,_that.mode,_that.paymentMethod,_that.instructions,_that.gift,_that.cutlery,_that.submitStatus,_that.failure,_that.submitFailure,_that.placedOrder,_that.quoteFailure);case _:
  return null;

}
}

}

/// @nodoc


class _CheckoutState extends CheckoutState {
  const _CheckoutState({required this.restaurantId, final  List<OrderLine> lines = const [], this.status = ViewStatus.initial, this.isQuoting = false, this.restaurant, this.quote, this.paymentOptions, this.mode = DeliveryMode.delivery, this.paymentMethod = PaymentMethodType.wallet, this.instructions, this.gift, this.cutlery = false, this.submitStatus = SubmitStatus.idle, this.failure, this.submitFailure, this.placedOrder, this.quoteFailure}): _lines = lines,super._();
  

@override final  String restaurantId;
 final  List<OrderLine> _lines;
@override@JsonKey() List<OrderLine> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

@override@JsonKey() final  ViewStatus status;
@override@JsonKey() final  bool isQuoting;
@override final  Restaurant? restaurant;
@override final  CheckoutQuote? quote;
@override final  PaymentOptions? paymentOptions;
@override@JsonKey() final  DeliveryMode mode;
@override@JsonKey() final  PaymentMethodType paymentMethod;
@override final  String? instructions;
@override final  GiftDetails? gift;
@override@JsonKey() final  bool cutlery;
@override@JsonKey() final  SubmitStatus submitStatus;
@override final  Failure? failure;
@override final  Failure? submitFailure;
@override final  Order? placedOrder;
/// The last re-price failed: [quote] may be stale.
@override final  Failure? quoteFailure;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutStateCopyWith<_CheckoutState> get copyWith => __$CheckoutStateCopyWithImpl<_CheckoutState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutState&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&const DeepCollectionEquality().equals(other._lines, _lines)&&(identical(other.status, status) || other.status == status)&&(identical(other.isQuoting, isQuoting) || other.isQuoting == isQuoting)&&(identical(other.restaurant, restaurant) || other.restaurant == restaurant)&&(identical(other.quote, quote) || other.quote == quote)&&(identical(other.paymentOptions, paymentOptions) || other.paymentOptions == paymentOptions)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.gift, gift) || other.gift == gift)&&(identical(other.cutlery, cutlery) || other.cutlery == cutlery)&&(identical(other.submitStatus, submitStatus) || other.submitStatus == submitStatus)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.submitFailure, submitFailure) || other.submitFailure == submitFailure)&&(identical(other.placedOrder, placedOrder) || other.placedOrder == placedOrder)&&(identical(other.quoteFailure, quoteFailure) || other.quoteFailure == quoteFailure));
}


@override
int get hashCode => Object.hash(runtimeType,restaurantId,const DeepCollectionEquality().hash(_lines),status,isQuoting,restaurant,quote,paymentOptions,mode,paymentMethod,instructions,gift,cutlery,submitStatus,failure,submitFailure,placedOrder,quoteFailure);

@override
String toString() {
  return 'CheckoutState(restaurantId: $restaurantId, lines: $lines, status: $status, isQuoting: $isQuoting, restaurant: $restaurant, quote: $quote, paymentOptions: $paymentOptions, mode: $mode, paymentMethod: $paymentMethod, instructions: $instructions, gift: $gift, cutlery: $cutlery, submitStatus: $submitStatus, failure: $failure, submitFailure: $submitFailure, placedOrder: $placedOrder, quoteFailure: $quoteFailure)';
}


}

/// @nodoc
abstract mixin class _$CheckoutStateCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory _$CheckoutStateCopyWith(_CheckoutState value, $Res Function(_CheckoutState) _then) = __$CheckoutStateCopyWithImpl;
@override @useResult
$Res call({
 String restaurantId, List<OrderLine> lines, ViewStatus status, bool isQuoting, Restaurant? restaurant, CheckoutQuote? quote, PaymentOptions? paymentOptions, DeliveryMode mode, PaymentMethodType paymentMethod, String? instructions, GiftDetails? gift, bool cutlery, SubmitStatus submitStatus, Failure? failure, Failure? submitFailure, Order? placedOrder, Failure? quoteFailure
});


@override $RestaurantCopyWith<$Res>? get restaurant;@override $CheckoutQuoteCopyWith<$Res>? get quote;@override $PaymentOptionsCopyWith<$Res>? get paymentOptions;@override $GiftDetailsCopyWith<$Res>? get gift;@override $OrderCopyWith<$Res>? get placedOrder;

}
/// @nodoc
class __$CheckoutStateCopyWithImpl<$Res>
    implements _$CheckoutStateCopyWith<$Res> {
  __$CheckoutStateCopyWithImpl(this._self, this._then);

  final _CheckoutState _self;
  final $Res Function(_CheckoutState) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? restaurantId = null,Object? lines = null,Object? status = null,Object? isQuoting = null,Object? restaurant = freezed,Object? quote = freezed,Object? paymentOptions = freezed,Object? mode = null,Object? paymentMethod = null,Object? instructions = freezed,Object? gift = freezed,Object? cutlery = null,Object? submitStatus = null,Object? failure = freezed,Object? submitFailure = freezed,Object? placedOrder = freezed,Object? quoteFailure = freezed,}) {
  return _then(_CheckoutState(
restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String,lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<OrderLine>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ViewStatus,isQuoting: null == isQuoting ? _self.isQuoting : isQuoting // ignore: cast_nullable_to_non_nullable
as bool,restaurant: freezed == restaurant ? _self.restaurant : restaurant // ignore: cast_nullable_to_non_nullable
as Restaurant?,quote: freezed == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as CheckoutQuote?,paymentOptions: freezed == paymentOptions ? _self.paymentOptions : paymentOptions // ignore: cast_nullable_to_non_nullable
as PaymentOptions?,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as DeliveryMode,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethodType,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,gift: freezed == gift ? _self.gift : gift // ignore: cast_nullable_to_non_nullable
as GiftDetails?,cutlery: null == cutlery ? _self.cutlery : cutlery // ignore: cast_nullable_to_non_nullable
as bool,submitStatus: null == submitStatus ? _self.submitStatus : submitStatus // ignore: cast_nullable_to_non_nullable
as SubmitStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,submitFailure: freezed == submitFailure ? _self.submitFailure : submitFailure // ignore: cast_nullable_to_non_nullable
as Failure?,placedOrder: freezed == placedOrder ? _self.placedOrder : placedOrder // ignore: cast_nullable_to_non_nullable
as Order?,quoteFailure: freezed == quoteFailure ? _self.quoteFailure : quoteFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RestaurantCopyWith<$Res>? get restaurant {
    if (_self.restaurant == null) {
    return null;
  }

  return $RestaurantCopyWith<$Res>(_self.restaurant!, (value) {
    return _then(_self.copyWith(restaurant: value));
  });
}/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheckoutQuoteCopyWith<$Res>? get quote {
    if (_self.quote == null) {
    return null;
  }

  return $CheckoutQuoteCopyWith<$Res>(_self.quote!, (value) {
    return _then(_self.copyWith(quote: value));
  });
}/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentOptionsCopyWith<$Res>? get paymentOptions {
    if (_self.paymentOptions == null) {
    return null;
  }

  return $PaymentOptionsCopyWith<$Res>(_self.paymentOptions!, (value) {
    return _then(_self.copyWith(paymentOptions: value));
  });
}/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GiftDetailsCopyWith<$Res>? get gift {
    if (_self.gift == null) {
    return null;
  }

  return $GiftDetailsCopyWith<$Res>(_self.gift!, (value) {
    return _then(_self.copyWith(gift: value));
  });
}/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCopyWith<$Res>? get placedOrder {
    if (_self.placedOrder == null) {
    return null;
  }

  return $OrderCopyWith<$Res>(_self.placedOrder!, (value) {
    return _then(_self.copyWith(placedOrder: value));
  });
}
}

// dart format on
