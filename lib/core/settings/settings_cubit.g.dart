// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SettingsState _$SettingsStateFromJson(Map<String, dynamic> json) =>
    _SettingsState(
      languageCode: json['language_code'] as String?,
      hapticsEnabled: json['haptics_enabled'] as bool? ?? true,
    );

Map<String, dynamic> _$SettingsStateToJson(_SettingsState instance) =>
    <String, dynamic>{
      'language_code': ?instance.languageCode,
      'haptics_enabled': instance.hapticsEnabled,
    };
