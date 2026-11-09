import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/bloc/event_transformers.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/features/profile/domain/entities/account_settings.dart';
import 'package:tavada_eats/features/profile/domain/repositories/account_settings_repository.dart';

part 'accessibility_bloc.freezed.dart';

sealed class AccessibilityEvent {
  const AccessibilityEvent();
}

final class AccessibilityStarted extends AccessibilityEvent {
  const AccessibilityStarted();
}

final class AccessibilityHearingChanged extends AccessibilityEvent {
  const AccessibilityHearingChanged(this.hearing);

  final HearingPreference hearing;
}

@freezed
abstract class AccessibilityState with _$AccessibilityState {
  const factory AccessibilityState({
    @Default(ViewStatus.initial) ViewStatus status,
    @Default(AccessibilitySettings()) AccessibilitySettings settings,
    @Default(SubmitStatus.idle) SubmitStatus saveStatus,
    Failure? failure,
    Failure? saveFailure,
  }) = _AccessibilityState;
}

class AccessibilityBloc extends Bloc<AccessibilityEvent, AccessibilityState> {
  AccessibilityBloc(this._repository) : super(const AccessibilityState()) {
    on<AccessibilityStarted>(_onStarted, transformer: restartable());
    on<AccessibilityHearingChanged>(_onHearing, transformer: restartable());
  }

  final AccountSettingsRepository _repository;

  Future<void> _onStarted(
    AccessibilityStarted event,
    Emitter<AccessibilityState> emit,
  ) async {
    emit(state.copyWith(status: ViewStatus.loading, failure: null));
    final result = await _repository.getAccessibility();
    result.fold(
      (failure) => emit(
        state.copyWith(status: ViewStatus.failure, failure: failure),
      ),
      (settings) => emit(
        state.copyWith(status: ViewStatus.success, settings: settings),
      ),
    );
  }

  /// Optimistic: the radio moves immediately and rolls back on failure.
  Future<void> _onHearing(
    AccessibilityHearingChanged event,
    Emitter<AccessibilityState> emit,
  ) async {
    final previous = state.settings;
    if (previous.hearing == event.hearing) return;
    emit(
      state.copyWith(
        settings: previous.copyWith(hearing: event.hearing),
        saveStatus: SubmitStatus.submitting,
        saveFailure: null,
      ),
    );
    final result = await _repository.updateHearing(event.hearing);
    result.fold(
      (failure) => emit(
        state.copyWith(
          settings: previous,
          saveStatus: SubmitStatus.failure,
          saveFailure: failure,
        ),
      ),
      (settings) => emit(
        state.copyWith(settings: settings, saveStatus: SubmitStatus.success),
      ),
    );
  }
}
