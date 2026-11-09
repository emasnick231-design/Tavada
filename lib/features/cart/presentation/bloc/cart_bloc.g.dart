// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartState _$CartStateFromJson(Map<String, dynamic> json) => _CartState(
  carts:
      (json['carts'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, StoreCart.fromJson(e as Map<String, dynamic>)),
      ) ??
      const {},
  lastAddedLineId: json['last_added_line_id'] as String?,
);

Map<String, dynamic> _$CartStateToJson(_CartState instance) =>
    <String, dynamic>{
      'carts': instance.carts.map((k, e) => MapEntry(k, e.toJson())),
      'last_added_line_id': ?instance.lastAddedLineId,
    };
