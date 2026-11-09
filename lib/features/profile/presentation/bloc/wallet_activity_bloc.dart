import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/bloc/event_transformers.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/features/profile/domain/entities/wallet_transaction.dart';
import 'package:tavada_eats/features/profile/domain/repositories/wallet_repository.dart';

part 'wallet_activity_bloc.freezed.dart';

sealed class WalletActivityEvent {
  const WalletActivityEvent();
}

final class WalletActivityStarted extends WalletActivityEvent {
  const WalletActivityStarted();
}

final class WalletActivityRefreshed extends WalletActivityEvent {
  const WalletActivityRefreshed();
}

@freezed
abstract class WalletActivityState with _$WalletActivityState {
  const factory WalletActivityState({
    @Default(ViewStatus.initial) ViewStatus status,
    @Default([]) List<WalletTransaction> transactions,
    Failure? failure,
    @Default(false) bool isRefreshing,
  }) = _WalletActivityState;
}

class WalletActivityBloc
    extends Bloc<WalletActivityEvent, WalletActivityState> {
  WalletActivityBloc(this._repository) : super(const WalletActivityState()) {
    on<WalletActivityStarted>(_onStarted, transformer: restartable());
    on<WalletActivityRefreshed>(_onRefreshed, transformer: droppable());
  }

  final WalletRepository _repository;

  Future<void> _onStarted(
    WalletActivityStarted event,
    Emitter<WalletActivityState> emit,
  ) async {
    emit(state.copyWith(status: ViewStatus.loading, failure: null));
    final result = await _repository.getTransactions();
    result.fold(
      (failure) => emit(
        state.copyWith(status: ViewStatus.failure, failure: failure),
      ),
      (items) => emit(
        state.copyWith(status: ViewStatus.success, transactions: items),
      ),
    );
  }

  Future<void> _onRefreshed(
    WalletActivityRefreshed event,
    Emitter<WalletActivityState> emit,
  ) async {
    emit(state.copyWith(isRefreshing: true));
    final result = await _repository.getTransactions();
    result.fold(
      (failure) => emit(
        state.copyWith(
          isRefreshing: false,
          failure: failure,
          status: state.transactions.isEmpty
              ? ViewStatus.failure
              : state.status,
        ),
      ),
      (items) => emit(
        state.copyWith(
          isRefreshing: false,
          status: ViewStatus.success,
          transactions: items,
          failure: null,
        ),
      ),
    );
  }
}
