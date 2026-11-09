import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/features/orders/domain/entities/order.dart';
import 'package:tavada_eats/features/orders/domain/repositories/orders_repository.dart';

part 'order_cubit.freezed.dart';

@freezed
abstract class OrderState with _$OrderState {
  const factory OrderState({
    @Default(ViewStatus.initial) ViewStatus status,
    Order? order,
    Failure? failure,
    @Default(false) bool isRating,
  }) = _OrderState;
}

/// One order, refreshed every few seconds while it is on its way.
class OrderCubit extends Cubit<OrderState> {
  OrderCubit(
    this._repository,
    this.orderId, {
    this.pollInterval = const Duration(seconds: 5),
  }) : super(const OrderState());

  final OrdersRepository _repository;
  final String orderId;
  final Duration pollInterval;
  Timer? _poll;

  Future<void> load() async {
    if (state.order == null) {
      emit(state.copyWith(status: ViewStatus.loading, failure: null));
    }
    final result = await _repository.getOrder(orderId);
    if (isClosed) return;
    result.fold(
      (f) {
        // Keep showing the last known order if a background refresh fails.
        if (state.order == null) {
          emit(state.copyWith(status: ViewStatus.failure, failure: f));
        }
      },
      (order) => emit(
        state.copyWith(status: ViewStatus.success, order: order, failure: null),
      ),
    );
    _schedule();
  }

  void _schedule() {
    _poll?.cancel();
    if (state.order?.isActive ?? true) {
      _poll = Timer(pollInterval, () => unawaited(load()));
    }
  }

  /// Shows the stars immediately (optimistic) and rolls back if the server
  /// refuses. Returns the failure, or `null` when the rating was saved.
  Future<Failure?> rate(int rating) async {
    final previous = state.order;
    if (previous == null) return null;
    emit(
      state.copyWith(isRating: true, order: previous.copyWith(rating: rating)),
    );
    final result = await _repository.rateOrder(orderId, rating);
    if (isClosed) return null;
    return result.fold(
      (failure) {
        emit(
          state.copyWith(
            isRating: false,
            order: state.order?.copyWith(rating: previous.rating),
          ),
        );
        return failure;
      },
      (order) {
        emit(state.copyWith(isRating: false, order: order));
        return null;
      },
    );
  }

  @override
  Future<void> close() {
    _poll?.cancel();
    return super.close();
  }
}
