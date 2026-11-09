// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_order_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaceOrderRequest {

 String get restaurantId; List<OrderLine> get items; DeliveryMode get deliveryMode; PaymentMethodType get paymentMethod; DeliveryAddress? get address; String? get instructions; GiftDetails? get gift; bool get cutlery;
/// Create a copy of PlaceOrderRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceOrderRequestCopyWith<PlaceOrderRequest> get copyWith => _$PlaceOrderRequestCopyWithImpl<PlaceOrderRequest>(this as PlaceOrderRequest, _$identity);

  /// Serializes this PlaceOrderRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceOrderRequest&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.deliveryMode, deliveryMode) || other.deliveryMode == deliveryMode)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.address, address) || other.address == address)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.gift, gift) || other.gift == gift)&&(identical(other.cutlery, cutlery) || other.cutlery == cutlery));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,restaurantId,const DeepCollectionEquality().hash(items),deliveryMode,paymentMethod,address,instructions,gift,cutlery);

@override
String toString() {
  return 'PlaceOrderRequest(restaurantId: $restaurantId, items: $items, deliveryMode: $deliveryMode, paymentMethod: $paymentMethod, address: $address, instructions: $instructions, gift: $gift, cutlery: $cutlery)';
}


}

/// @nodoc
abstract mixin class $PlaceOrderRequestCopyWith<$Res>  {
  factory $PlaceOrderRequestCopyWith(PlaceOrderRequest value, $Res Function(PlaceOrderRequest) _then) = _$PlaceOrderRequestCopyWithImpl;
@useResult
$Res call({
 String restaurantId, List<OrderLine> items, DeliveryMode deliveryMode, PaymentMethodType paymentMethod, DeliveryAddress? address, String? instructions, GiftDetails? gift, bool cutlery
});


$DeliveryAddressCopyWith<$Res>? get address;$GiftDetailsCopyWith<$Res>? get gift;

}
/// @nodoc
class _$PlaceOrderRequestCopyWithImpl<$Res>
    implements $PlaceOrderRequestCopyWith<$Res> {
  _$PlaceOrderRequestCopyWithImpl(this._self, this._then);

  final PlaceOrderRequest _self;
  final $Res Function(PlaceOrderRequest) _then;

/// Create a copy of PlaceOrderRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? restaurantId = null,Object? items = null,Object? deliveryMode = null,Object? paymentMethod = null,Object? address = freezed,Object? instructions = freezed,Object? gift = freezed,Object? cutlery = null,}) {
  return _then(_self.copyWith(
restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderLine>,deliveryMode: null == deliveryMode ? _self.deliveryMode : deliveryMode // ignore: cast_nullable_to_non_nullable
as DeliveryMode,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethodType,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as DeliveryAddress?,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,gift: freezed == gift ? _self.gift : gift // ignore: cast_nullable_to_non_nullable
as GiftDetails?,cutlery: null == cutlery ? _self.cutlery : cutlery // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of PlaceOrderRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeliveryAddressCopyWith<$Res>? get address {
    if (_self.address == null) {
    return null;
  }

  return $DeliveryAddressCopyWith<$Res>(_self.address!, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of PlaceOrderRequest
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
}
}


/// Adds pattern-matching-related methods to [PlaceOrderRequest].
extension PlaceOrderRequestPatterns on PlaceOrderRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaceOrderRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaceOrderRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaceOrderRequest value)  $default,){
final _that = this;
switch (_that) {
case _PlaceOrderRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaceOrderRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PlaceOrderRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String restaurantId,  List<OrderLine> items,  DeliveryMode deliveryMode,  PaymentMethodType paymentMethod,  DeliveryAddress? address,  String? instructions,  GiftDetails? gift,  bool cutlery)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaceOrderRequest() when $default != null:
return $default(_that.restaurantId,_that.items,_that.deliveryMode,_that.paymentMethod,_that.address,_that.instructions,_that.gift,_that.cutlery);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String restaurantId,  List<OrderLine> items,  DeliveryMode deliveryMode,  PaymentMethodType paymentMethod,  DeliveryAddress? address,  String? instructions,  GiftDetails? gift,  bool cutlery)  $default,) {final _that = this;
switch (_that) {
case _PlaceOrderRequest():
return $default(_that.restaurantId,_that.items,_that.deliveryMode,_that.paymentMethod,_that.address,_that.instructions,_that.gift,_that.cutlery);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String restaurantId,  List<OrderLine> items,  DeliveryMode deliveryMode,  PaymentMethodType paymentMethod,  DeliveryAddress? address,  String? instructions,  GiftDetails? gift,  bool cutlery)?  $default,) {final _that = this;
switch (_that) {
case _PlaceOrderRequest() when $default != null:
return $default(_that.restaurantId,_that.items,_that.deliveryMode,_that.paymentMethod,_that.address,_that.instructions,_that.gift,_that.cutlery);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaceOrderRequest implements PlaceOrderRequest {
  const _PlaceOrderRequest({required this.restaurantId, required final  List<OrderLine> items, this.deliveryMode = DeliveryMode.delivery, this.paymentMethod = PaymentMethodType.wallet, this.address, this.instructions, this.gift, this.cutlery = false}): _items = items;
  factory _PlaceOrderRequest.fromJson(Map<String, dynamic> json) => _$PlaceOrderRequestFromJson(json);

@override final  String restaurantId;
 final  List<OrderLine> _items;
@override List<OrderLine> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  DeliveryMode deliveryMode;
@override@JsonKey() final  PaymentMethodType paymentMethod;
@override final  DeliveryAddress? address;
@override final  String? instructions;
@override final  GiftDetails? gift;
@override@JsonKey() final  bool cutlery;

/// Create a copy of PlaceOrderRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaceOrderRequestCopyWith<_PlaceOrderRequest> get copyWith => __$PlaceOrderRequestCopyWithImpl<_PlaceOrderRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaceOrderRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaceOrderRequest&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.deliveryMode, deliveryMode) || other.deliveryMode == deliveryMode)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.address, address) || other.address == address)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.gift, gift) || other.gift == gift)&&(identical(other.cutlery, cutlery) || other.cutlery == cutlery));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,restaurantId,const DeepCollectionEquality().hash(_items),deliveryMode,paymentMethod,address,instructions,gift,cutlery);

@override
String toString() {
  return 'PlaceOrderRequest(restaurantId: $restaurantId, items: $items, deliveryMode: $deliveryMode, paymentMethod: $paymentMethod, address: $address, instructions: $instructions, gift: $gift, cutlery: $cutlery)';
}


}

/// @nodoc
abstract mixin class _$PlaceOrderRequestCopyWith<$Res> implements $PlaceOrderRequestCopyWith<$Res> {
  factory _$PlaceOrderRequestCopyWith(_PlaceOrderRequest value, $Res Function(_PlaceOrderRequest) _then) = __$PlaceOrderRequestCopyWithImpl;
@override @useResult
$Res call({
 String restaurantId, List<OrderLine> items, DeliveryMode deliveryMode, PaymentMethodType paymentMethod, DeliveryAddress? address, String? instructions, GiftDetails? gift, bool cutlery
});


@override $DeliveryAddressCopyWith<$Res>? get address;@override $GiftDetailsCopyWith<$Res>? get gift;

}
/// @nodoc
class __$PlaceOrderRequestCopyWithImpl<$Res>
    implements _$PlaceOrderRequestCopyWith<$Res> {
  __$PlaceOrderRequestCopyWithImpl(this._self, this._then);

  final _PlaceOrderRequest _self;
  final $Res Function(_PlaceOrderRequest) _then;

/// Create a copy of PlaceOrderRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? restaurantId = null,Object? items = null,Object? deliveryMode = null,Object? paymentMethod = null,Object? address = freezed,Object? instructions = freezed,Object? gift = freezed,Object? cutlery = null,}) {
  return _then(_PlaceOrderRequest(
restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderLine>,deliveryMode: null == deliveryMode ? _self.deliveryMode : deliveryMode // ignore: cast_nullable_to_non_nullable
as DeliveryMode,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethodType,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as DeliveryAddress?,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,gift: freezed == gift ? _self.gift : gift // ignore: cast_nullable_to_non_nullable
as GiftDetails?,cutlery: null == cutlery ? _self.cutlery : cutlery // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of PlaceOrderRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeliveryAddressCopyWith<$Res>? get address {
    if (_self.address == null) {
    return null;
  }

  return $DeliveryAddressCopyWith<$Res>(_self.address!, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of PlaceOrderRequest
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
}
}

// dart format on
