// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MenuSection _$MenuSectionFromJson(Map<String, dynamic> json) => _MenuSection(
  id: json['id'] as String,
  name: json['name'] as String,
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => MenuItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$MenuSectionToJson(_MenuSection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

_MenuItem _$MenuItemFromJson(Map<String, dynamic> json) => _MenuItem(
  id: json['id'] as String,
  restaurantId: json['restaurant_id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  price: const MoneyConverter().fromJson(json['price'] as num),
  imageUrl: json['image_url'] as String,
  originalPrice: const NullableMoneyConverter().fromJson(
    json['original_price'] as num?,
  ),
  sectionId: json['section_id'] as String?,
  isPopular: json['is_popular'] as bool? ?? false,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  optionGroups:
      (json['option_groups'] as List<dynamic>?)
          ?.map((e) => OptionGroup.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  restaurantName: json['restaurant_name'] as String?,
);

Map<String, dynamic> _$MenuItemToJson(_MenuItem instance) => <String, dynamic>{
  'id': instance.id,
  'restaurant_id': instance.restaurantId,
  'name': instance.name,
  'description': instance.description,
  'price': const MoneyConverter().toJson(instance.price),
  'image_url': instance.imageUrl,
  'original_price': ?const NullableMoneyConverter().toJson(
    instance.originalPrice,
  ),
  'section_id': ?instance.sectionId,
  'is_popular': instance.isPopular,
  'tags': instance.tags,
  'option_groups': instance.optionGroups.map((e) => e.toJson()).toList(),
  'restaurant_name': ?instance.restaurantName,
};

_OptionGroup _$OptionGroupFromJson(Map<String, dynamic> json) => _OptionGroup(
  id: json['id'] as String,
  title: json['title'] as String,
  options:
      (json['options'] as List<dynamic>?)
          ?.map((e) => MenuOption.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  isRequired: json['is_required'] as bool? ?? false,
  minSelect: (json['min_select'] as num?)?.toInt() ?? 0,
  maxSelect: (json['max_select'] as num?)?.toInt() ?? 1,
);

Map<String, dynamic> _$OptionGroupToJson(_OptionGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'options': instance.options.map((e) => e.toJson()).toList(),
      'is_required': instance.isRequired,
      'min_select': instance.minSelect,
      'max_select': instance.maxSelect,
    };

_MenuOption _$MenuOptionFromJson(Map<String, dynamic> json) => _MenuOption(
  id: json['id'] as String,
  name: json['name'] as String,
  price: json['price'] == null
      ? Money.zero
      : const MoneyConverter().fromJson(json['price'] as num),
);

Map<String, dynamic> _$MenuOptionToJson(_MenuOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': const MoneyConverter().toJson(instance.price),
    };
