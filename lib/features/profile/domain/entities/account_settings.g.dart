// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChannelPreferences _$ChannelPreferencesFromJson(Map<String, dynamic> json) =>
    _ChannelPreferences(
      channel: $enumDecode(_$NotificationChannelEnumMap, json['channel']),
      categories:
          (json['categories'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$NotificationCategoryEnumMap, e))
              .toSet() ??
          const {},
    );

Map<String, dynamic> _$ChannelPreferencesToJson(_ChannelPreferences instance) =>
    <String, dynamic>{
      'channel': _$NotificationChannelEnumMap[instance.channel]!,
      'categories': instance.categories
          .map((e) => _$NotificationCategoryEnumMap[e]!)
          .toList(),
    };

const _$NotificationChannelEnumMap = {
  NotificationChannel.push: 'push',
  NotificationChannel.whatsapp: 'whatsapp',
  NotificationChannel.email: 'email',
};

const _$NotificationCategoryEnumMap = {
  NotificationCategory.orderStatus: 'order_status',
  NotificationCategory.promotions: 'promotions',
  NotificationCategory.recommendations: 'recommendations',
  NotificationCategory.reminders: 'reminders',
};

_AccessibilitySettings _$AccessibilitySettingsFromJson(
  Map<String, dynamic> json,
) => _AccessibilitySettings(
  hearing:
      $enumDecodeNullable(
        _$HearingPreferenceEnumMap,
        json['hearing'],
        unknownValue: HearingPreference.none,
      ) ??
      HearingPreference.none,
);

Map<String, dynamic> _$AccessibilitySettingsToJson(
  _AccessibilitySettings instance,
) => <String, dynamic>{
  'hearing': _$HearingPreferenceEnumMap[instance.hearing]!,
};

const _$HearingPreferenceEnumMap = {
  HearingPreference.none: 'none',
  HearingPreference.deaf: 'deaf',
  HearingPreference.hardOfHearing: 'hard_of_hearing',
};
