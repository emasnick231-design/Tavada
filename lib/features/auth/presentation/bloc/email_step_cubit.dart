import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/utils/validators.dart';
import 'package:tavada_eats/features/auth/domain/repositories/auth_repository.dart';

part 'email_step_cubit.freezed.dart';

@freezed
abstract class EmailStepState with _$EmailStepState {
  const factory EmailStepState({
    @Default('') String email,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default(SubmitStatus.idle) SubmitStatus status,
    Failure? failure,
  }) = _EmailStepState;

  const EmailStepState._();

  bool get isValid => firstName.trim().isNotEmpty && Validators.isEmail(email);
}

/// Sign up step 1: validates the email and checks it's not taken.
class EmailStepCubit extends Cubit<EmailStepState> {
  EmailStepCubit(this._repository) : super(const EmailStepState());

  final AuthRepository _repository;

  void firstNameChanged(String value) => emit(state.copyWith(firstName: value));

  void lastNameChanged(String value) => emit(state.copyWith(lastName: value));

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
    final result = await _repository.checkEmailAvailable(state.email);
    emit(
      result.fold(
        (failure) =>
            state.copyWith(status: SubmitStatus.failure, failure: failure),
        (_) => state.copyWith(status: SubmitStatus.success),
      ),
    );
  }
}
