import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/bloc/event_transformers.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/utils/validators.dart';
import 'package:tavada_eats/features/profile/domain/repositories/account_settings_repository.dart';

part 'change_password_bloc.freezed.dart';

sealed class ChangePasswordEvent {
  const ChangePasswordEvent();
}

final class ChangePasswordCurrentChanged extends ChangePasswordEvent {
  const ChangePasswordCurrentChanged(this.value);

  final String value;
}

final class ChangePasswordPasswordChanged extends ChangePasswordEvent {
  const ChangePasswordPasswordChanged(this.value);

  final String value;
}

final class ChangePasswordConfirmationChanged extends ChangePasswordEvent {
  const ChangePasswordConfirmationChanged(this.value);

  final String value;
}

final class ChangePasswordSubmitted extends ChangePasswordEvent {
  const ChangePasswordSubmitted();
}

@freezed
abstract class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState({
    @Default('') String current,
    @Default('') String password,
    @Default('') String confirmation,
    @Default(SubmitStatus.idle) SubmitStatus status,
    Failure? failure,
  }) = _ChangePasswordState;

  const ChangePasswordState._();

  PasswordRules get rules => Validators.passwordRules(password);

  /// The rules shown under the fields (same as sign up and the server).
  bool get meetsRules => rules.isValid;

  /// The server rejected [current].
  bool get wrongCurrent =>
      failure is ValidationFailure &&
      (failure! as ValidationFailure).code == 'wrong_password';

  bool get matches => password == confirmation;

  /// Flag a mismatch as soon as the confirmation diverges from the password.
  bool get showMismatch =>
      confirmation.isNotEmpty && !password.startsWith(confirmation);

  bool get canSubmit =>
      current.isNotEmpty && meetsRules && matches && !status.isSubmitting;
}

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc(this._repository) : super(const ChangePasswordState()) {
    on<ChangePasswordCurrentChanged>(
      (event, emit) => emit(
        state.copyWith(
          current: event.value,
          status: SubmitStatus.idle,
          failure: null,
        ),
      ),
    );
    on<ChangePasswordPasswordChanged>(
      (event, emit) => emit(
        state.copyWith(
          password: event.value,
          status: SubmitStatus.idle,
          failure: null,
        ),
      ),
    );
    on<ChangePasswordConfirmationChanged>(
      (event, emit) => emit(
        state.copyWith(
          confirmation: event.value,
          status: SubmitStatus.idle,
          failure: null,
        ),
      ),
    );
    on<ChangePasswordSubmitted>(_onSubmitted, transformer: droppable());
  }

  final AccountSettingsRepository _repository;

  Future<void> _onSubmitted(
    ChangePasswordSubmitted event,
    Emitter<ChangePasswordState> emit,
  ) async {
    if (!state.canSubmit) return;
    emit(state.copyWith(status: SubmitStatus.submitting, failure: null));
    final result = await _repository.changePassword(
      currentPassword: state.current,
      newPassword: state.password,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(status: SubmitStatus.failure, failure: failure),
      ),
      (_) => emit(state.copyWith(status: SubmitStatus.success)),
    );
  }
}
