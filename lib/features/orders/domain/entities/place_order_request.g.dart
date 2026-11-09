// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlaceOrderRequest _$PlaceOrderRequestFromJson(Map<String, dynamic> json) =>
    _PlaceOrderRequest(
      restaurantId: json['restaurant_id'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderLine.fromJson(e as Map<String, dynamic>))
          .toList(),
      deliveryMode:
          $enumDecodeNullable(_$DeliveryModeEnumMap, json['delivery_mode']) ??
          DeliveryMode.delivery,
      paymentMethod:
          $enumDecodeNullable(
            _$PaymentMethodTypeEnumMap,
            json['payment_method'],
          ) ??
          PaymentMethodType.wallet,
      address: json['address'] == null
          ? null
          : DeliveryAddress.fromJson(json['address'] as Map<String, dynamic>),
      instructions: json['instructions'] as String?,
      gift: json['gift'] == null
          ? null
          : GiftDetails.fromJson(json['gift'] as Map<String, dynamic>),
      cutlery: json['cutlery'] as bool? ?? false,
    );

Map<String, dynamic> _$PlaceOrderRequestToJson(_PlaceOrderRequest instance) =>
    <String, dynamic>{
      'restaurant_id': instance.restaurantId,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'delivery_mode': _$DeliveryModeEnumMap[instance.deliveryMode]!,
      'payment_method': _$PaymentMethodTypeEnumMap[instance.paymentMethod]!,
      'address': ?instance.address?.toJson(),
      'instructions': ?instance.instructions,
      'gift': ?instance.gift?.toJson(),
      'cutlery': instance.cutlery,
    };

const _$DeliveryModeEnumMap = {
  DeliveryMode.delivery: 'delivery',
  DeliveryMode.pickup: 'pickup',
};

const _$PaymentMethodTypeEnumMap = {
  PaymentMethodType.wallet: 'wallet',
  PaymentMethodType.card: 'card',
};
