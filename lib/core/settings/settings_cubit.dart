import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'settings_cubit.freezed.dart';
part 'settings_cubit.g.dart';

/// Device-level preferences (not synced to the server).
@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState({
    /// `null` follows the system locale.
    String? languageCode,
    @Default(true) bool hapticsEnabled,
  }) = _SettingsState;

  const SettingsState._();

  factory SettingsState.fromJson(Map<String, dynamic> json) =>
      _$SettingsStateFromJson(json);

  Locale? get locale => languageCode == null ? null : Locale(languageCode!);
}

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit() : super(const SettingsState());

  void setLanguage(String? languageCode) =>
      emit(state.copyWith(languageCode: languageCode));

  void setHaptics({required bool enabled}) =>
      emit(state.copyWith(hapticsEnabled: enabled));

  @override
  SettingsState? fromJson(Map<String, dynamic> json) =>
      SettingsState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(SettingsState state) => state.toJson();
}
