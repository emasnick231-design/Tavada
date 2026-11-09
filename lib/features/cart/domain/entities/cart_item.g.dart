// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SelectedOption _$SelectedOptionFromJson(Map<String, dynamic> json) =>
    _SelectedOption(
      groupId: json['group_id'] as String,
      groupTitle: json['group_title'] as String,
      optionId: json['option_id'] as String,
      name: json['name'] as String,
      price: json['price'] == null
          ? Money.zero
          : const MoneyConverter().fromJson(json['price'] as num),
    );

Map<String, dynamic> _$SelectedOptionToJson(_SelectedOption instance) =>
    <String, dynamic>{
      'group_id': instance.groupId,
      'group_title': instance.groupTitle,
      'option_id': instance.optionId,
      'name': instance.name,
      'price': const MoneyConverter().toJson(instance.price),
    };

_CartItem _$CartItemFromJson(Map<String, dynamic> json) => _CartItem(
  id: json['id'] as String,
  restaurantId: json['restaurant_id'] as String,
  menuItemId: json['menu_item_id'] as String,
  name: json['name'] as String,
  imageUrl: json['image_url'] as String,
  basePrice: const MoneyConverter().fromJson(json['base_price'] as num),
  quantity: (json['quantity'] as num?)?.toInt() ?? 1,
  options:
      (json['options'] as List<dynamic>?)
          ?.map((e) => SelectedOption.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  note: json['note'] as String?,
);

Map<String, dynamic> _$CartItemToJson(_CartItem instance) => <String, dynamic>{
  'id': instance.id,
  'restaurant_id': instance.restaurantId,
  'menu_item_id': instance.menuItemId,
  'name': instance.name,
  'image_url': instance.imageUrl,
  'base_price': const MoneyConverter().toJson(instance.basePrice),
  'quantity': instance.quantity,
  'options': instance.options.map((e) => e.toJson()).toList(),
  'note': ?instance.note,
};

_StoreCart _$StoreCartFromJson(Map<String, dynamic> json) => _StoreCart(
  restaurantId: json['restaurant_id'] as String,
  restaurantName: json['restaurant_name'] as String,
  restaurantLogoUrl: json['restaurant_logo_url'] as String,
  updatedAt: DateTime.parse(json['updated_at'] as String),
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$StoreCartToJson(_StoreCart instance) =>
    <String, dynamic>{
      'restaurant_id': instance.restaurantId,
      'restaurant_name': instance.restaurantName,
      'restaurant_logo_url': instance.restaurantLogoUrl,
      'updated_at': instance.updatedAt.toIso8601String(),
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
