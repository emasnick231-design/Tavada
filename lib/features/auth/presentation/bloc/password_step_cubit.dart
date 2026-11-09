import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/utils/validators.dart';
import 'package:tavada_eats/features/auth/domain/entities/auth_session.dart';
import 'package:tavada_eats/features/auth/domain/repositories/auth_repository.dart';

part 'password_step_cubit.freezed.dart';

@freezed
abstract class PasswordStepState with _$PasswordStepState {
  const factory PasswordStepState({
    @Default('') String password,
    @Default(SubmitStatus.idle) SubmitStatus status,
    Failure? failure,
    OtpDispatch? dispatch,
  }) = _PasswordStepState;

  const PasswordStepState._();

  PasswordRules get rules => Validators.passwordRules(password);
  bool get isValid => rules.isValid;
}

/// Sign up step 3: password rules, then sends the email verification code.
class PasswordStepCubit extends Cubit<PasswordStepState> {
  PasswordStepCubit(this._repository) : super(const PasswordStepState());

  final AuthRepository _repository;

  void passwordChanged(String value) => emit(
    state.copyWith(
      password: value,
      status: SubmitStatus.idle,
      failure: null,
    ),
  );

  Future<void> submit({required String email}) async {
    if (!state.isValid || state.status.isSubmitting) return;
    emit(state.copyWith(status: SubmitStatus.submitting, failure: null));
    final result = await _repository.sendOtp(
      destination: email,
      purpose: OtpPurpose.signUp,
    );
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
