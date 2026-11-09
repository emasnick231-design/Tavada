// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeliveryAddress _$DeliveryAddressFromJson(Map<String, dynamic> json) =>
    _DeliveryAddress(
      id: json['id'] as String,
      line1: json['line1'] as String,
      city: json['city'] as String,
      location: GeoPoint.fromJson(json['location'] as Map<String, dynamic>),
      line2: json['line2'] as String?,
      postcode: json['postcode'] as String?,
      country: json['country'] as String?,
      label: json['label'] as String?,
      instructions: json['instructions'] as String?,
    );

Map<String, dynamic> _$DeliveryAddressToJson(_DeliveryAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'line1': instance.line1,
      'city': instance.city,
      'location': instance.location.toJson(),
      'line2': ?instance.line2,
      'postcode': ?instance.postcode,
      'country': ?instance.country,
      'label': ?instance.label,
      'instructions': ?instance.instructions,
    };
