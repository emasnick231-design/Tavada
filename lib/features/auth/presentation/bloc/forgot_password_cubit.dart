import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/utils/validators.dart';
import 'package:tavada_eats/features/auth/domain/entities/auth_session.dart';
import 'package:tavada_eats/features/auth/domain/repositories/auth_repository.dart';

part 'forgot_password_cubit.freezed.dart';

@freezed
abstract class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    @Default('') String email,
    @Default(SubmitStatus.idle) SubmitStatus status,
    Failure? failure,
    OtpDispatch? dispatch,
  }) = _ForgotPasswordState;

  const ForgotPasswordState._();

  bool get isValid => Validators.isEmail(email);
}

/// Requests a password reset code for an email address.
class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this._repository) : super(const ForgotPasswordState());

  final AuthRepository _repository;

  void emailChanged(String value) => emit(
    state.copyWith(
      email: value.trim(),
      status: SubmitStatus.idle,
      failure: null,
    ),
  );

  Future<void> submit() async {
    if (!state.isValid || state.status.isSubmitting) return;
    emit(state.copyWith(status: SubmitStatus.submitting, failure: null));
    final result = await _repository.requestPasswordReset(state.email);
    emit(
      result.fold(
        (failure) =>
            state.copyWith(status: SubmitStatus.failure, failure: failure),
        (dispatch) =>
            state.copyWith(status: SubmitStatus.success, dispatch: dispatch),
      ),
    );
  }
}
