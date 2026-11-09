import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/bloc/event_transformers.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/models/user_profile.dart';
import 'package:tavada_eats/features/profile/domain/repositories/account_settings_repository.dart';

part 'update_phone_bloc.freezed.dart';

sealed class UpdatePhoneEvent {
  const UpdatePhoneEvent();
}

final class UpdatePhoneChanged extends UpdatePhoneEvent {
  const UpdatePhoneChanged({required this.e164, required this.isValid});

  final String e164;
  final bool isValid;
}

/// "Save changes" on the number step: sends a code to the new number.
final class UpdatePhoneSubmitted extends UpdatePhoneEvent {
  const UpdatePhoneSubmitted();
}

final class UpdatePhoneCodeChanged extends UpdatePhoneEvent {
  const UpdatePhoneCodeChanged(this.code);

  final String code;
}

/// Verifies the code and saves the number.
final class UpdatePhoneCodeSubmitted extends UpdatePhoneEvent {
  const UpdatePhoneCodeSubmitted();
}

/// "Change number" on the code step.
final class UpdatePhoneEditNumber extends UpdatePhoneEvent {
  const UpdatePhoneEditNumber();
}

@freezed
abstract class UpdatePhoneState with _$UpdatePhoneState {
  const factory UpdatePhoneState({
    String? initialPhone,
    @Default('') String phone,
    @Default(false) bool isValid,

    /// A code was sent to [phone]; waiting for it.
    @Default(false) bool awaitingCode,
    @Default('') String code,

    /// Increments on every wrong code (re-runs the error shake).
    @Default(0) int codeErrors,
    @Default(SubmitStatus.idle) SubmitStatus status,
    Failure? failure,
    UserProfile? updatedUser,
  }) = _UpdatePhoneState;

  const UpdatePhoneState._();

  static const codeLength = 4;

  bool get hasChanged => phone.isNotEmpty && phone != initialPhone;

  bool get canSubmit => isValid && hasChanged && !status.isSubmitting;

  bool get canVerify => code.length == codeLength && !status.isSubmitting;
}

/// Changes the account's phone number: number → one-time code → saved.
/// The number is only stored once the customer proved they own it, so it
/// can be used to log in straight away.
class UpdatePhoneBloc extends Bloc<UpdatePhoneEvent, UpdatePhoneState> {
  UpdatePhoneBloc(this._repository, {String? initialPhone})
    : super(UpdatePhoneState(initialPhone: initialPhone)) {
    on<UpdatePhoneChanged>(
      (event, emit) => emit(
        state.copyWith(
          phone: event.e164,
          isValid: event.isValid,
          status: SubmitStatus.idle,
          failure: null,
        ),
      ),
    );
    on<UpdatePhoneSubmitted>(_onSubmitted, transformer: droppable());
    on<UpdatePhoneCodeChanged>((event, emit) {
      // Clearing the boxes after a wrong code must not hide the error.
      if (event.code == state.code) return;
      emit(
        state.copyWith(
          code: event.code,
          status: SubmitStatus.idle,
          failure: null,
        ),
      );
    });
    on<UpdatePhoneCodeSubmitted>(_onCodeSubmitted, transformer: droppable());
    on<UpdatePhoneEditNumber>(
      (event, emit) => emit(
        state.copyWith(
          awaitingCode: false,
          code: '',
          status: SubmitStatus.idle,
          failure: null,
        ),
      ),
    );
  }

  final AccountSettingsRepository _repository;

  Future<void> _onSubmitted(
    UpdatePhoneSubmitted event,
    Emitter<UpdatePhoneState> emit,
  ) async {
    if (!state.canSubmit && !state.awaitingCode) return;
    emit(state.copyWith(status: SubmitStatus.submitting, failure: null));
    final result = await _repository.requestPhoneCode(state.phone);
    result.fold(
      (failure) => emit(
        state.copyWith(status: SubmitStatus.failure, failure: failure),
      ),
      (_) => emit(
        state.copyWith(
          status: SubmitStatus.idle,
          awaitingCode: true,
          code: '',
        ),
      ),
    );
  }

  Future<void> _onCodeSubmitted(
    UpdatePhoneCodeSubmitted event,
    Emitter<UpdatePhoneState> emit,
  ) async {
    if (!state.canVerify) return;
    emit(state.copyWith(status: SubmitStatus.submitting, failure: null));
    final result = await _repository.updatePhone(
      phone: state.phone,
      code: state.code,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: SubmitStatus.failure,
          failure: failure,
          code: '',
          codeErrors: state.codeErrors + 1,
        ),
      ),
      (user) => emit(
        state.copyWith(status: SubmitStatus.success, updatedUser: user),
      ),
    );
  }
}
