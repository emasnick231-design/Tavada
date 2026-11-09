import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/models/user_profile.dart';
import 'package:tavada_eats/features/profile/domain/repositories/account_settings_repository.dart';

part 'edit_profile_cubit.freezed.dart';

@freezed
abstract class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    @Default('') String initialFirstName,
    @Default('') String initialLastName,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default(SubmitStatus.idle) SubmitStatus status,
    Failure? failure,
    UserProfile? updatedUser,
  }) = _EditProfileState;

  const EditProfileState._();

  bool get hasChanged =>
      firstName.trim() != initialFirstName ||
      lastName.trim() != initialLastName;

  bool get canSubmit =>
      firstName.trim().isNotEmpty && hasChanged && !status.isSubmitting;
}

/// Edits the customer's first / last name.
class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this._repository, {UserProfile? user})
    : super(
        EditProfileState(
          initialFirstName: user?.firstName ?? '',
          initialLastName: user?.lastName ?? '',
          firstName: user?.firstName ?? '',
          lastName: user?.lastName ?? '',
        ),
      );

  final AccountSettingsRepository _repository;

  void firstNameChanged(String value) => emit(
    state.copyWith(firstName: value, status: SubmitStatus.idle, failure: null),
  );

  void lastNameChanged(String value) => emit(
    state.copyWith(lastName: value, status: SubmitStatus.idle, failure: null),
  );

  Future<void> submit() async {
    if (!state.canSubmit) return;
    emit(state.copyWith(status: SubmitStatus.submitting, failure: null));
    final result = await _repository.updateProfile(
      firstName: state.firstName.trim(),
      lastName: state.lastName.trim(),
    );
    if (isClosed) return;
    emit(
      result.fold(
        (f) => state.copyWith(status: SubmitStatus.failure, failure: f),
        (user) =>
            state.copyWith(status: SubmitStatus.success, updatedUser: user),
      ),
    );
  }
}
