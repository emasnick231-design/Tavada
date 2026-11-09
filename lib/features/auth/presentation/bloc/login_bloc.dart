import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/bloc/event_transformers.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/utils/validators.dart';
import 'package:tavada_eats/features/auth/domain/entities/auth_session.dart';
import 'package:tavada_eats/features/auth/domain/repositories/auth_repository.dart';

part 'login_bloc.freezed.dart';

enum LoginMode { email, phone }

sealed class LoginEvent {
  const LoginEvent();
}

final class LoginModeToggled extends LoginEvent {
  const LoginModeToggled();
}

final class LoginEmailChanged extends LoginEvent {
  const LoginEmailChanged(this.email);

  final String email;
}

final class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);

  final String password;
}

final class LoginPhoneChanged extends LoginEvent {
  const LoginPhoneChanged({required this.e164, required this.isValid});

  final String e164;
  final bool isValid;
}

final class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(LoginMode.email) LoginMode mode,
    @Default('') String email,
    @Default('') String password,
    @Default('') String phone,
    @Default(false) bool phoneValid,
    @Default(SubmitStatus.idle) SubmitStatus status,
    Failure? failure,

    /// Set after a successful email/password log in.
    AuthSession? session,

    /// Set once a phone login code has been sent.
    OtpDispatch? dispatch,
  }) = _LoginState;

  const LoginState._();

  bool get canSubmit => switch (mode) {
    LoginMode.email => Validators.isEmail(email) && password.isNotEmpty,
    LoginMode.phone => phoneValid,
  };
}

/// Log in with email + password, or request a phone login code.
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._repository) : super(const LoginState()) {
    on<LoginModeToggled>(
      (_, emit) => emit(
        LoginState(
          mode: state.mode == LoginMode.email
              ? LoginMode.phone
              : LoginMode.email,
          email: state.email,
        ),
      ),
    );
    on<LoginEmailChanged>(
      (e, emit) => emit(_edited(state.copyWith(email: e.email.trim()))),
    );
    on<LoginPasswordChanged>(
      (e, emit) => emit(_edited(state.copyWith(password: e.password))),
    );
    on<LoginPhoneChanged>(
      (e, emit) => emit(
        _edited(state.copyWith(phone: e.e164, phoneValid: e.isValid)),
      ),
    );
    on<LoginSubmitted>(_onSubmitted, transformer: droppable());
  }

  final AuthRepository _repository;

  static LoginState _edited(LoginState s) =>
      s.copyWith(status: SubmitStatus.idle, failure: null);

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (!state.canSubmit) return;
    emit(state.copyWith(status: SubmitStatus.submitting, failure: null));
    switch (state.mode) {
      case LoginMode.email:
        final result = await _repository.loginWithEmail(
          email: state.email,
          password: state.password,
        );
        emit(
          result.fold(
            (f) => state.copyWith(status: SubmitStatus.failure, failure: f),
            (s) => state.copyWith(status: SubmitStatus.success, session: s),
          ),
        );
      case LoginMode.phone:
        final result = await _repository.requestPhoneLogin(state.phone);
        emit(
          result.fold(
            (f) => state.copyWith(status: SubmitStatus.failure, failure: f),
            (d) => state.copyWith(status: SubmitStatus.success, dispatch: d),
          ),
        );
    }
  }
}
