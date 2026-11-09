// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionState _$SessionStateFromJson(Map<String, dynamic> json) =>
    _SessionState(
      hasCompletedWelcome: json['has_completed_welcome'] as bool? ?? false,
      user: json['user'] == null
          ? null
          : UserProfile.fromJson(json['user'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : DeliveryAddress.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SessionStateToJson(_SessionState instance) =>
    <String, dynamic>{
      'has_completed_welcome': instance.hasCompletedWelcome,
      'user': ?instance.user?.toJson(),
      'address': ?instance.address?.toJson(),
    };
