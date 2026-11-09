import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/bloc/event_transformers.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/error/result.dart';
import 'package:tavada_eats/features/auth/domain/entities/auth_session.dart';
import 'package:tavada_eats/features/auth/domain/repositories/auth_repository.dart';
import 'package:tavada_eats/features/auth/presentation/flow/auth_flow.dart';

part 'otp_bloc.freezed.dart';

sealed class OtpEvent {
  const OtpEvent();
}

final class OtpCodeChanged extends OtpEvent {
  const OtpCodeChanged(this.code);

  final String code;
}

final class OtpSubmitted extends OtpEvent {
  const OtpSubmitted();
}

final class OtpResendRequested extends OtpEvent {
  const OtpResendRequested();
}

final class _OtpTicked extends OtpEvent {
  const _OtpTicked();
}

@freezed
abstract class OtpState with _$OtpState {
  const factory OtpState({
    @Default('') String code,
    @Default(SubmitStatus.idle) SubmitStatus status,
    @Default(0) int secondsLeft,
    @Default(false) bool isResending,

    /// Increments on every failed attempt so the UI can re-run its shake.
    @Default(0) int errorCount,
    Failure? failure,

    /// Sign up / phone login result.
    AuthSession? session,

    /// Password reset result.
    String? resetToken,
  }) = _OtpState;

  const OtpState._();

  static const codeLength = 4;

  bool get isComplete => code.length == codeLength;
  bool get canResend => secondsLeft == 0 && !isResending;
}

/// Verifies a one-time code for sign up, phone login or password reset.
class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc({required this._repository, required this._args})
    : super(OtpState(secondsLeft: _args.resendInSeconds)) {
    on<OtpCodeChanged>((e, emit) {
      // The page clears the boxes after a wrong code / resend, which echoes
      // back as an empty change: keep the error visible until the customer
      // types again.
      if (e.code == state.code) return;
      emit(
        state.copyWith(
          code: e.code,
          status: SubmitStatus.idle,
          failure: null,
        ),
      );
    });
    on<_OtpTicked>(
      (_, emit) => emit(
        state.copyWith(secondsLeft: (state.secondsLeft - 1).clamp(0, 999)),
      ),
    );
    on<OtpSubmitted>(_onSubmitted, transformer: droppable());
    on<OtpResendRequested>(_onResend, transformer: droppable());
    _startTicker();
  }

  final AuthRepository _repository;
  final OtpArgs _args;
  Timer? _ticker;

  void _startTicker() {
    _ticker?.cancel();
    _ticker = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.secondsLeft <= 0) {
        timer.cancel();
      } else {
        add(const _OtpTicked());
      }
    });
  }

  Future<void> _onSubmitted(OtpSubmitted _, Emitter<OtpState> emit) async {
    if (!state.isComplete) return;
    emit(state.copyWith(status: SubmitStatus.submitting, failure: null));
    final draft = _args.flow.draft;
    switch (_args.purpose) {
      case OtpPurpose.signUp:
        _emitSession(
          emit,
          await _repository.signUp(
            email: draft.email,
            phone: draft.phone,
            password: draft.password,
            code: state.code,
            firstName: draft.firstName,
            lastName: draft.lastName,
          ),
        );
      case OtpPurpose.phoneLogin:
        _emitSession(
          emit,
          await _repository.verifyPhoneLogin(
            phone: _args.destination,
            code: state.code,
          ),
        );
      case OtpPurpose.resetPassword:
        final result = await _repository.verifyResetCode(
          email: _args.destination,
          code: state.code,
        );
        emit(
          result.fold(
            _failed,
            (token) => state.copyWith(
              status: SubmitStatus.success,
              resetToken: token,
            ),
          ),
        );
    }
  }

  void _emitSession(Emitter<OtpState> emit, Result<AuthSession> result) {
    emit(
      result.fold(
        _failed,
        (session) =>
            state.copyWith(status: SubmitStatus.success, session: session),
      ),
    );
  }

  OtpState _failed(Failure failure) => state.copyWith(
    status: SubmitStatus.failure,
    failure: failure,
    code: '',
    errorCount: state.errorCount + 1,
  );

  Future<void> _onResend(OtpResendRequested _, Emitter<OtpState> emit) async {
    if (!state.canResend) return;
    emit(state.copyWith(isResending: true, failure: null));
    final result = switch (_args.purpose) {
      OtpPurpose.signUp => await _repository.sendOtp(
        destination: _args.destination,
        purpose: OtpPurpose.signUp,
      ),
      OtpPurpose.phoneLogin => await _repository.requestPhoneLogin(
        _args.destination,
      ),
      OtpPurpose.resetPassword => await _repository.requestPasswordReset(
        _args.destination,
      ),
    };
    emit(
      result.fold(
        (failure) => state.copyWith(isResending: false, failure: failure),
        (dispatch) => state.copyWith(
          isResending: false,
          code: '',
          secondsLeft: dispatch.resendInSeconds,
        ),
      ),
    );
    _startTicker();
  }

  @override
  Future<void> close() {
    _ticker?.cancel();
    return super.close();
  }
}
