import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_settings.freezed.dart';
part 'account_settings.g.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum NotificationChannel {
  push,
  whatsapp,
  email;

  /// Parses a route/path value such as `whatsapp`.
  static NotificationChannel? tryParse(String value) =>
      values.firstWhereOrNull((c) => c.name == value);
}

@JsonEnum(fieldRename: FieldRename.snake)
enum NotificationCategory {
  orderStatus,
  promotions,
  recommendations,
  reminders,
}

/// Which notification categories the customer receives on a channel.
@freezed
abstract class ChannelPreferences with _$ChannelPreferences {
  const factory ChannelPreferences({
    required NotificationChannel channel,
    @Default({}) Set<NotificationCategory> categories,
  }) = _ChannelPreferences;

  const ChannelPreferences._();

  factory ChannelPreferences.fromJson(Map<String, dynamic> json) =>
      _$ChannelPreferencesFromJson(json);

  bool get isEnabled => categories.isNotEmpty;

  ChannelPreferences toggle(NotificationCategory category) => copyWith(
    categories: categories.contains(category)
        ? ({...categories}..remove(category))
        : {...categories, category},
  );
}

/// Shared with riders so they can adapt (e.g. text instead of calling).
@JsonEnum(fieldRename: FieldRename.snake)
enum HearingPreference { none, deaf, hardOfHearing }

@freezed
abstract class AccessibilitySettings with _$AccessibilitySettings {
  const factory AccessibilitySettings({
    @JsonKey(unknownEnumValue: HearingPreference.none)
    @Default(HearingPreference.none)
    HearingPreference hearing,
  }) = _AccessibilitySettings;

  factory AccessibilitySettings.fromJson(Map<String, dynamic> json) =>
      _$AccessibilitySettingsFromJson(json);
}
