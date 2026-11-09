import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/bloc/event_transformers.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/models/money.dart';
import 'package:tavada_eats/features/profile/domain/entities/account_overview.dart';
import 'package:tavada_eats/features/profile/domain/repositories/wallet_repository.dart';

part 'add_money_bloc.freezed.dart';

sealed class AddMoneyEvent {
  const AddMoneyEvent();
}

/// Cash-register entry: digits shift in from the right (5 → £0.05 → £0.50).
final class AddMoneyDigitPressed extends AddMoneyEvent {
  const AddMoneyDigitPressed(this.digit);

  final int digit;
}

final class AddMoneyBackspacePressed extends AddMoneyEvent {
  const AddMoneyBackspacePressed();
}

final class AddMoneyPresetSelected extends AddMoneyEvent {
  const AddMoneyPresetSelected(this.amount);

  final Money amount;
}

final class AddMoneySubmitted extends AddMoneyEvent {
  const AddMoneySubmitted();
}

@freezed
abstract class AddMoneyState with _$AddMoneyState {
  const factory AddMoneyState({
    @Default(Money.zero) Money amount,
    @Default(SubmitStatus.idle) SubmitStatus status,
    AccountOverview? result,
    Failure? failure,

    /// Bumped whenever input is rejected (over the limit) to trigger a shake.
    @Default(0) int rejectedInputs,
  }) = _AddMoneyState;

  const AddMoneyState._();

  bool get isLocked => status.isSubmitting || status.isSuccess;

  /// Below [AddMoneyBloc.minAmount] the server refuses the top-up.
  bool get belowMinimum => amount < AddMoneyBloc.minAmount;

  bool get canSubmit => !belowMinimum && !isLocked;
}

class AddMoneyBloc extends Bloc<AddMoneyEvent, AddMoneyState> {
  AddMoneyBloc(this._repository) : super(const AddMoneyState()) {
    on<AddMoneyDigitPressed>(_onDigit);
    on<AddMoneyBackspacePressed>(_onBackspace);
    on<AddMoneyPresetSelected>(_onPreset);
    on<AddMoneySubmitted>(_onSubmitted, transformer: droppable());
  }

  /// Largest single top-up (£5,000).
  static const maxAmount = Money(500000);

  /// Smallest single top-up (£1), as enforced by the server.
  static const minAmount = Money(100);

  /// The saved card top-ups are charged to.
  static const cardLabel = 'Visa •••• 4242';

  final WalletRepository _repository;

  void _setAmount(Money amount, Emitter<AddMoneyState> emit) {
    if (state.isLocked) return;
    if (amount > maxAmount) {
      emit(state.copyWith(rejectedInputs: state.rejectedInputs + 1));
      return;
    }
    emit(
      state.copyWith(
        amount: amount,
        status: SubmitStatus.idle,
        failure: null,
      ),
    );
  }

  void _onDigit(AddMoneyDigitPressed event, Emitter<AddMoneyState> emit) =>
      _setAmount(Money(state.amount.minor * 10 + event.digit), emit);

  void _onBackspace(
    AddMoneyBackspacePressed event,
    Emitter<AddMoneyState> emit,
  ) => _setAmount(Money(state.amount.minor ~/ 10), emit);

  void _onPreset(AddMoneyPresetSelected event, Emitter<AddMoneyState> emit) =>
      _setAmount(event.amount, emit);

  Future<void> _onSubmitted(
    AddMoneySubmitted event,
    Emitter<AddMoneyState> emit,
  ) async {
    if (!state.canSubmit) return;
    emit(state.copyWith(status: SubmitStatus.submitting, failure: null));
    final result = await _repository.topUp(state.amount);
    result.fold(
      (failure) => emit(
        state.copyWith(status: SubmitStatus.failure, failure: failure),
      ),
      (overview) => emit(
        state.copyWith(status: SubmitStatus.success, result: overview),
      ),
    );
  }
}
