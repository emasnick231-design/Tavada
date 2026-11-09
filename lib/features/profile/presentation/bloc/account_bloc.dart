import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/bloc/event_transformers.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/features/profile/domain/entities/account_overview.dart';
import 'package:tavada_eats/features/profile/domain/repositories/wallet_repository.dart';

part 'account_bloc.freezed.dart';

sealed class AccountEvent {
  const AccountEvent();
}

/// Loads the overview; refreshes silently when data is already on screen.
final class AccountStarted extends AccountEvent {
  const AccountStarted();
}

/// Pull-to-refresh / screen re-entry.
final class AccountRefreshed extends AccountEvent {
  const AccountRefreshed();
}

/// Another screen mutated the account (top-up, redeem) and has fresh data.
final class AccountOverviewChanged extends AccountEvent {
  const AccountOverviewChanged(this.overview);

  final AccountOverview overview;
}

/// The signed-in user changed (sign out, another account): forget the
/// previous customer's wallet and rewards.
final class AccountReset extends AccountEvent {
  const AccountReset();
}

@freezed
abstract class AccountState with _$AccountState {
  const factory AccountState({
    @Default(ViewStatus.initial) ViewStatus status,
    AccountOverview? overview,
    Failure? failure,
    @Default(false) bool isRefreshing,
  }) = _AccountState;
}

/// Wallet balance + rewards for the profile tab.
///
/// Registered as an app-lifetime singleton so every screen that changes the
/// wallet (add money, rewards) keeps the profile in sync.
class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc(this._repository) : super(const AccountState()) {
    on<AccountStarted>(_onStarted, transformer: droppable());
    on<AccountRefreshed>((_, emit) => _refresh(emit), transformer: droppable());
    on<AccountReset>((_, emit) => emit(const AccountState()));
    on<AccountOverviewChanged>(
      (event, emit) => emit(
        state.copyWith(
          status: ViewStatus.success,
          overview: event.overview,
          failure: null,
        ),
      ),
    );
  }

  final WalletRepository _repository;

  Future<void> _onStarted(
    AccountStarted event,
    Emitter<AccountState> emit,
  ) async {
    if (state.overview != null) return _refresh(emit);
    emit(state.copyWith(status: ViewStatus.loading, failure: null));
    final result = await _repository.getOverview();
    result.fold(
      (failure) => emit(
        state.copyWith(status: ViewStatus.failure, failure: failure),
      ),
      (overview) => emit(
        state.copyWith(status: ViewStatus.success, overview: overview),
      ),
    );
  }

  Future<void> _refresh(Emitter<AccountState> emit) async {
    emit(state.copyWith(isRefreshing: true));
    final result = await _repository.getOverview();
    result.fold(
      (failure) => emit(
        state.copyWith(
          isRefreshing: false,
          failure: failure,
          status: state.overview == null ? ViewStatus.failure : state.status,
        ),
      ),
      (overview) => emit(
        state.copyWith(
          isRefreshing: false,
          overview: overview,
          status: ViewStatus.success,
          failure: null,
        ),
      ),
    );
  }
}
