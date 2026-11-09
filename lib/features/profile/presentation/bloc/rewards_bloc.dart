import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/bloc/event_transformers.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/features/profile/domain/entities/account_overview.dart';
import 'package:tavada_eats/features/profile/domain/repositories/wallet_repository.dart';

part 'rewards_bloc.freezed.dart';

sealed class RewardsEvent {
  const RewardsEvent();
}

final class RewardsStarted extends RewardsEvent {
  const RewardsStarted();
}

final class RewardsRedeemRequested extends RewardsEvent {
  const RewardsRedeemRequested();
}

@freezed
abstract class RewardsState with _$RewardsState {
  const factory RewardsState({
    @Default(ViewStatus.initial) ViewStatus status,
    AccountOverview? overview,
    @Default(SubmitStatus.idle) SubmitStatus redeemStatus,
    Failure? failure,
    Failure? redeemFailure,

    /// Incremented on every successful redemption (drives the confetti).
    @Default(0) int redemptions,
  }) = _RewardsState;

  const RewardsState._();

  bool get canRedeem =>
      (overview?.rewards.canRedeem ?? false) && !redeemStatus.isSubmitting;
}

class RewardsBloc extends Bloc<RewardsEvent, RewardsState> {
  /// [initial] (e.g. from the profile's account bloc) paints instantly while
  /// the fresh figures load.
  RewardsBloc(this._repository, {AccountOverview? initial})
    : super(
        RewardsState(
          overview: initial,
          status: initial == null ? ViewStatus.initial : ViewStatus.success,
        ),
      ) {
    on<RewardsStarted>(_onStarted, transformer: restartable());
    on<RewardsRedeemRequested>(_onRedeem, transformer: droppable());
  }

  final WalletRepository _repository;

  Future<void> _onStarted(
    RewardsStarted event,
    Emitter<RewardsState> emit,
  ) async {
    if (state.overview == null) {
      emit(state.copyWith(status: ViewStatus.loading, failure: null));
    }
    final result = await _repository.getOverview();
    result.fold(
      (failure) => emit(
        state.copyWith(
          failure: failure,
          status: state.overview == null ? ViewStatus.failure : state.status,
        ),
      ),
      (overview) => emit(
        state.copyWith(status: ViewStatus.success, overview: overview),
      ),
    );
  }

  Future<void> _onRedeem(
    RewardsRedeemRequested event,
    Emitter<RewardsState> emit,
  ) async {
    if (!state.canRedeem) return;
    emit(
      state.copyWith(
        redeemStatus: SubmitStatus.submitting,
        redeemFailure: null,
      ),
    );
    final result = await _repository.redeemReward();
    result.fold(
      (failure) => emit(
        state.copyWith(
          redeemStatus: SubmitStatus.failure,
          redeemFailure: failure,
        ),
      ),
      (overview) => emit(
        state.copyWith(
          redeemStatus: SubmitStatus.success,
          overview: overview,
          redemptions: state.redemptions + 1,
        ),
      ),
    );
  }
}
