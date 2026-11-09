import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/bloc/event_transformers.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/features/profile/domain/entities/account_settings.dart';
import 'package:tavada_eats/features/profile/domain/repositories/account_settings_repository.dart';

part 'notification_preferences_bloc.freezed.dart';

sealed class NotificationPreferencesEvent {
  const NotificationPreferencesEvent();
}

final class NotificationPreferencesStarted
    extends NotificationPreferencesEvent {
  const NotificationPreferencesStarted();
}

final class NotificationCategoryToggled extends NotificationPreferencesEvent {
  const NotificationCategoryToggled(this.channel, this.category);

  final NotificationChannel channel;
  final NotificationCategory category;
}

final class NotificationChannelSaved extends NotificationPreferencesEvent {
  const NotificationChannelSaved(this.channel);

  final NotificationChannel channel;
}

@freezed
abstract class NotificationPreferencesState
    with _$NotificationPreferencesState {
  const factory NotificationPreferencesState({
    @Default(ViewStatus.initial) ViewStatus status,

    /// Last values confirmed by the server.
    @Default({}) Map<NotificationChannel, ChannelPreferences> saved,

    /// Values being edited on screen.
    @Default({}) Map<NotificationChannel, ChannelPreferences> edited,
    @Default(SubmitStatus.idle) SubmitStatus saveStatus,
    Failure? failure,
    Failure? saveFailure,
  }) = _NotificationPreferencesState;

  const NotificationPreferencesState._();

  ChannelPreferences preferencesFor(NotificationChannel channel) =>
      edited[channel] ?? ChannelPreferences(channel: channel);

  bool isDirty(NotificationChannel channel) =>
      edited[channel] != saved[channel];
}

class NotificationPreferencesBloc
    extends Bloc<NotificationPreferencesEvent, NotificationPreferencesState> {
  NotificationPreferencesBloc(this._repository)
    : super(const NotificationPreferencesState()) {
    on<NotificationPreferencesStarted>(_onStarted, transformer: restartable());
    on<NotificationCategoryToggled>(_onToggled);
    on<NotificationChannelSaved>(_onSaved, transformer: droppable());
  }

  final AccountSettingsRepository _repository;

  Future<void> _onStarted(
    NotificationPreferencesStarted event,
    Emitter<NotificationPreferencesState> emit,
  ) async {
    emit(state.copyWith(status: ViewStatus.loading, failure: null));
    final result = await _repository.getNotificationPreferences();
    result.fold(
      (failure) => emit(
        state.copyWith(status: ViewStatus.failure, failure: failure),
      ),
      (prefs) {
        final byChannel = {for (final p in prefs) p.channel: p};
        emit(
          state.copyWith(
            status: ViewStatus.success,
            saved: byChannel,
            edited: byChannel,
          ),
        );
      },
    );
  }

  void _onToggled(
    NotificationCategoryToggled event,
    Emitter<NotificationPreferencesState> emit,
  ) {
    final current = state.preferencesFor(event.channel);
    emit(
      state.copyWith(
        edited: {
          ...state.edited,
          event.channel: current.toggle(event.category),
        },
        saveStatus: SubmitStatus.idle,
        saveFailure: null,
      ),
    );
  }

  Future<void> _onSaved(
    NotificationChannelSaved event,
    Emitter<NotificationPreferencesState> emit,
  ) async {
    if (!state.isDirty(event.channel)) return;
    emit(state.copyWith(saveStatus: SubmitStatus.submitting));
    final result = await _repository.updateNotificationPreferences(
      state.preferencesFor(event.channel),
    );
    result.fold(
      (failure) => emit(
        state.copyWith(saveStatus: SubmitStatus.failure, saveFailure: failure),
      ),
      (prefs) => emit(
        state.copyWith(
          saveStatus: SubmitStatus.success,
          saved: {...state.saved, prefs.channel: prefs},
          edited: {...state.edited, prefs.channel: prefs},
        ),
      ),
    );
  }
}
