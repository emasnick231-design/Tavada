// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthSession _$AuthSessionFromJson(Map<String, dynamic> json) => _AuthSession(
  user: UserProfile.fromJson(json['user'] as Map<String, dynamic>),
  accessToken: json['access_token'] as String,
  refreshToken: json['refresh_token'] as String?,
);

Map<String, dynamic> _$AuthSessionToJson(_AuthSession instance) =>
    <String, dynamic>{
      'user': instance.user.toJson(),
      'access_token': instance.accessToken,
      'refresh_token': ?instance.refreshToken,
    };

_OtpDispatch _$OtpDispatchFromJson(Map<String, dynamic> json) => _OtpDispatch(
  destination: json['destination'] as String,
  resendInSeconds: (json['resend_in_seconds'] as num?)?.toInt() ?? 30,
);

Map<String, dynamic> _$OtpDispatchToJson(_OtpDispatch instance) =>
    <String, dynamic>{
      'destination': instance.destination,
      'resend_in_seconds': instance.resendInSeconds,
    };
