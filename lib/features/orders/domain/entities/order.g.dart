// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderRestaurant _$OrderRestaurantFromJson(Map<String, dynamic> json) =>
    _OrderRestaurant(
      id: json['id'] as String,
      name: json['name'] as String,
      logoUrl: json['logo_url'] as String,
      address: json['address'] as String?,
      location: json['location'] == null
          ? null
          : GeoPoint.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderRestaurantToJson(_OrderRestaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo_url': instance.logoUrl,
      'address': ?instance.address,
      'location': ?instance.location?.toJson(),
    };

_OrderLine _$OrderLineFromJson(Map<String, dynamic> json) => _OrderLine(
  id: json['id'] as String,
  menuItemId: json['menu_item_id'] as String,
  name: json['name'] as String,
  imageUrl: json['image_url'] as String,
  quantity: (json['quantity'] as num).toInt(),
  basePrice: const MoneyConverter().fromJson(json['base_price'] as num),
  options:
      (json['options'] as List<dynamic>?)
          ?.map((e) => SelectedOption.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  note: json['note'] as String?,
);

Map<String, dynamic> _$OrderLineToJson(_OrderLine instance) =>
    <String, dynamic>{
      'id': instance.id,
      'menu_item_id': instance.menuItemId,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'quantity': instance.quantity,
      'base_price': const MoneyConverter().toJson(instance.basePrice),
      'options': instance.options.map((e) => e.toJson()).toList(),
      'note': ?instance.note,
    };

_GiftDetails _$GiftDetailsFromJson(Map<String, dynamic> json) => _GiftDetails(
  senderName: json['sender_name'] as String,
  recipientName: json['recipient_name'] as String,
  recipientPhone: json['recipient_phone'] as String,
  note: json['note'] as String?,
);

Map<String, dynamic> _$GiftDetailsToJson(_GiftDetails instance) =>
    <String, dynamic>{
      'sender_name': instance.senderName,
      'recipient_name': instance.recipientName,
      'recipient_phone': instance.recipientPhone,
      'note': ?instance.note,
    };

_OrderRider _$OrderRiderFromJson(Map<String, dynamic> json) => _OrderRider(
  name: json['name'] as String,
  phone: json['phone'] as String,
  avatarUrl: json['avatar_url'] as String?,
);

Map<String, dynamic> _$OrderRiderToJson(_OrderRider instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'avatar_url': ?instance.avatarUrl,
    };

_OrderTimelineEntry _$OrderTimelineEntryFromJson(Map<String, dynamic> json) =>
    _OrderTimelineEntry(
      milestone: $enumDecode(_$OrderMilestoneEnumMap, json['milestone']),
      at: DateTime.parse(json['at'] as String),
    );

Map<String, dynamic> _$OrderTimelineEntryToJson(_OrderTimelineEntry instance) =>
    <String, dynamic>{
      'milestone': _$OrderMilestoneEnumMap[instance.milestone]!,
      'at': instance.at.toIso8601String(),
    };

const _$OrderMilestoneEnumMap = {
  OrderMilestone.confirmed: 'confirmed',
  OrderMilestone.riderAssigned: 'rider_assigned',
  OrderMilestone.readyForPickup: 'ready_for_pickup',
  OrderMilestone.pickedUp: 'picked_up',
  OrderMilestone.arrived: 'arrived',
};

_Order _$OrderFromJson(Map<String, dynamic> json) => _Order(
  id: json['id'] as String,
  restaurant: OrderRestaurant.fromJson(
    json['restaurant'] as Map<String, dynamic>,
  ),
  items: (json['items'] as List<dynamic>)
      .map((e) => OrderLine.fromJson(e as Map<String, dynamic>))
      .toList(),
  status: $enumDecode(_$OrderStatusEnumMap, json['status']),
  placedAt: DateTime.parse(json['placed_at'] as String),
  estimatedArrival: DateTime.parse(json['estimated_arrival'] as String),
  subtotal: const MoneyConverter().fromJson(json['subtotal'] as num),
  deliveryFee: const MoneyConverter().fromJson(json['delivery_fee'] as num),
  serviceFee: const MoneyConverter().fromJson(json['service_fee'] as num),
  total: const MoneyConverter().fromJson(json['total'] as num),
  discount: json['discount'] == null
      ? Money.zero
      : const MoneyConverter().fromJson(json['discount'] as num),
  deliveryMode:
      $enumDecodeNullable(_$DeliveryModeEnumMap, json['delivery_mode']) ??
      DeliveryMode.delivery,
  paymentMethod:
      $enumDecodeNullable(_$PaymentMethodTypeEnumMap, json['payment_method']) ??
      PaymentMethodType.wallet,
  address: json['address'] == null
      ? null
      : DeliveryAddress.fromJson(json['address'] as Map<String, dynamic>),
  instructions: json['instructions'] as String?,
  gift: json['gift'] == null
      ? null
      : GiftDetails.fromJson(json['gift'] as Map<String, dynamic>),
  cutlery: json['cutlery'] as bool? ?? false,
  rider: json['rider'] == null
      ? null
      : OrderRider.fromJson(json['rider'] as Map<String, dynamic>),
  timeline:
      (json['timeline'] as List<dynamic>?)
          ?.map((e) => OrderTimelineEntry.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  deliveredAt: json['delivered_at'] == null
      ? null
      : DateTime.parse(json['delivered_at'] as String),
  rating: (json['rating'] as num?)?.toInt(),
);

Map<String, dynamic> _$OrderToJson(_Order instance) => <String, dynamic>{
  'id': instance.id,
  'restaurant': instance.restaurant.toJson(),
  'items': instance.items.map((e) => e.toJson()).toList(),
  'status': _$OrderStatusEnumMap[instance.status]!,
  'placed_at': instance.placedAt.toIso8601String(),
  'estimated_arrival': instance.estimatedArrival.toIso8601String(),
  'subtotal': const MoneyConverter().toJson(instance.subtotal),
  'delivery_fee': const MoneyConverter().toJson(instance.deliveryFee),
  'service_fee': const MoneyConverter().toJson(instance.serviceFee),
  'total': const MoneyConverter().toJson(instance.total),
  'discount': const MoneyConverter().toJson(instance.discount),
  'delivery_mode': _$DeliveryModeEnumMap[instance.deliveryMode]!,
  'payment_method': _$PaymentMethodTypeEnumMap[instance.paymentMethod]!,
  'address': ?instance.address?.toJson(),
  'instructions': ?instance.instructions,
  'gift': ?instance.gift?.toJson(),
  'cutlery': instance.cutlery,
  'rider': ?instance.rider?.toJson(),
  'timeline': instance.timeline.map((e) => e.toJson()).toList(),
  'delivered_at': ?instance.deliveredAt?.toIso8601String(),
  'rating': ?instance.rating,
};

const _$OrderStatusEnumMap = {
  OrderStatus.placed: 'placed',
  OrderStatus.preparing: 'preparing',
  OrderStatus.riderPicked: 'rider_picked',
  OrderStatus.dispatched: 'dispatched',
  OrderStatus.delivered: 'delivered',
  OrderStatus.cancelled: 'cancelled',
};

const _$DeliveryModeEnumMap = {
  DeliveryMode.delivery: 'delivery',
  DeliveryMode.pickup: 'pickup',
};

const _$PaymentMethodTypeEnumMap = {
  PaymentMethodType.wallet: 'wallet',
  PaymentMethodType.card: 'card',
};
