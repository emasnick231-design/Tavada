import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/utils/validators.dart';
import 'package:tavada_eats/features/auth/domain/repositories/auth_repository.dart';

part 'reset_password_cubit.freezed.dart';

@freezed
abstract class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState({
    @Default('') String password,
    @Default('') String confirmation,
    @Default(SubmitStatus.idle) SubmitStatus status,
    Failure? failure,
  }) = _ResetPasswordState;

  const ResetPasswordState._();

  PasswordRules get rules => Validators.passwordRules(password);

  /// Only flag a mismatch once the user started typing the confirmation.
  bool get mismatch => confirmation.isNotEmpty && confirmation != password;

  bool get isValid => rules.isValid && password == confirmation;
}

/// Sets a new password with the token obtained from the emailed code.
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this._repository) : super(const ResetPasswordState());

  final AuthRepository _repository;

  void passwordChanged(String value) => emit(
    state.copyWith(password: value, status: SubmitStatus.idle, failure: null),
  );

  void confirmationChanged(String value) => emit(
    state.copyWith(
      confirmation: value,
      status: SubmitStatus.idle,
      failure: null,
    ),
  );

  Future<void> submit({
    required String email,
    required String resetToken,
  }) async {
    if (!state.isValid || state.status.isSubmitting) return;
    emit(state.copyWith(status: SubmitStatus.submitting, failure: null));
    final result = await _repository.resetPassword(
      email: email,
      resetToken: resetToken,
      password: state.password,
    );
    emit(
      result.fold(
        (failure) =>
            state.copyWith(status: SubmitStatus.failure, failure: failure),
        (_) => state.copyWith(status: SubmitStatus.success),
      ),
    );
  }
}
