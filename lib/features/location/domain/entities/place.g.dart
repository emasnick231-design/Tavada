// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Place _$PlaceFromJson(Map<String, dynamic> json) => _Place(
  id: json['id'] as String,
  title: json['title'] as String,
  location: GeoPoint.fromJson(json['location'] as Map<String, dynamic>),
  subtitle: json['subtitle'] as String? ?? '',
  city: json['city'] as String? ?? '',
  postcode: json['postcode'] as String?,
  country: json['country'] as String?,
);

Map<String, dynamic> _$PlaceToJson(_Place instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'location': instance.location.toJson(),
  'subtitle': instance.subtitle,
  'city': instance.city,
  'postcode': ?instance.postcode,
  'country': ?instance.country,
};
