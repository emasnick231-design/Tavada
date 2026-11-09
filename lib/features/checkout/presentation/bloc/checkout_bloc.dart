import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/bloc/event_transformers.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/error/result.dart';
import 'package:tavada_eats/core/models/models.dart';
import 'package:tavada_eats/features/catalog/catalog.dart';
import 'package:tavada_eats/features/checkout/domain/entities/checkout_quote.dart';
import 'package:tavada_eats/features/checkout/domain/repositories/checkout_repository.dart';
import 'package:tavada_eats/features/orders/domain/entities/order.dart';
import 'package:tavada_eats/features/orders/domain/entities/place_order_request.dart';
import 'package:tavada_eats/features/orders/domain/repositories/orders_repository.dart';

part 'checkout_bloc.freezed.dart';
part 'checkout_event.dart';
part 'checkout_state.dart';

/// Drives the checkout screen for one store basket: pricing (quote),
/// delivery/payment preferences, gift details and placing the order.
///
/// Basket contents come from the app-wide `CartBloc` via [CheckoutLinesChanged]
/// so this bloc stays independent of cart persistence.
class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc({
    required String restaurantId,
    required CheckoutRepository checkoutRepository,
    required OrdersRepository ordersRepository,
    required CatalogRepository catalogRepository,
  }) : _checkout = checkoutRepository,
       _orders = ordersRepository,
       _catalog = catalogRepository,
       super(CheckoutState(restaurantId: restaurantId)) {
    on<CheckoutStarted>(_onStarted, transformer: restartable());
    on<CheckoutLinesChanged>(_onLinesChanged);
    on<CheckoutModeChanged>(_onModeChanged);
    on<CheckoutPaymentMethodChanged>(
      (e, emit) => emit(state.copyWith(paymentMethod: e.method)),
    );
    on<CheckoutInstructionsChanged>(
      (e, emit) => emit(state.copyWith(instructions: e.instructions)),
    );
    on<CheckoutGiftChanged>((e, emit) => emit(state.copyWith(gift: e.gift)));
    on<CheckoutCutleryToggled>(
      (e, emit) => emit(state.copyWith(cutlery: e.requested)),
    );
    on<_CheckoutQuoteRequested>(_onQuote, transformer: debounceRestartable());
    on<CheckoutQuoteRetried>(
      (e, emit) {
        emit(state.copyWith(isQuoting: true, quoteFailure: null));
        add(const _CheckoutQuoteRequested());
      },
    );
    on<CheckoutSubmitted>(_onSubmitted, transformer: droppable());
    on<CheckoutAccountChanged>(_onAccountChanged, transformer: droppable());
  }

  final CheckoutRepository _checkout;
  final OrdersRepository _orders;
  final CatalogRepository _catalog;

  Future<void> _onStarted(
    CheckoutStarted event,
    Emitter<CheckoutState> emit,
  ) async {
    emit(
      state.copyWith(
        lines: event.lines,
        status: ViewStatus.loading,
        failure: null,
      ),
    );
    if (event.lines.isEmpty) {
      emit(state.copyWith(status: ViewStatus.success));
      return;
    }
    final results = await (
      _catalog.getRestaurant(state.restaurantId),
      _checkout.getPaymentOptions(),
      _quote(event.lines, state.mode),
    ).wait;
    // Payment options are user-scoped: guests have none until they sign in.
    // A quote the server refuses (e.g. address outside the delivery area)
    // is shown on the page, where pickup / another address can fix it.
    final quoteFailure = results.$3.fold<Failure?>(
      (f) => f is ValidationFailure ? f : null,
      (_) => null,
    );
    final failure = [results.$1, if (quoteFailure == null) results.$3]
        .map((r) => r.fold<Failure?>((f) => f, (_) => null))
        .whereType<Failure>()
        .firstOrNull;
    if (failure != null) {
      emit(state.copyWith(status: ViewStatus.failure, failure: failure));
      return;
    }
    emit(
      state.copyWith(
        status: ViewStatus.success,
        restaurant: results.$1.toNullable(),
        paymentOptions: results.$2.toNullable(),
        quote: results.$3.toNullable(),
        quoteFailure: quoteFailure,
      ),
    );
  }

  void _onLinesChanged(
    CheckoutLinesChanged event,
    Emitter<CheckoutState> emit,
  ) {
    emit(state.copyWith(lines: event.lines, isQuoting: event.lines.isNotEmpty));
    if (event.lines.isNotEmpty) add(const _CheckoutQuoteRequested());
  }

  void _onModeChanged(CheckoutModeChanged event, Emitter<CheckoutState> emit) {
    if (event.mode == state.mode) return;
    emit(state.copyWith(mode: event.mode, isQuoting: true));
    add(const _CheckoutQuoteRequested());
  }

  Future<void> _onQuote(
    _CheckoutQuoteRequested event,
    Emitter<CheckoutState> emit,
  ) async {
    if (state.isEmpty) return;
    final result = await _quote(state.lines, state.mode);
    result.fold(
      // Keep the old quote visible but block payment until a fresh one.
      (failure) =>
          emit(state.copyWith(isQuoting: false, quoteFailure: failure)),
      (quote) => emit(
        state.copyWith(isQuoting: false, quote: quote, quoteFailure: null),
      ),
    );
  }

  FutureResult<CheckoutQuote> _quote(
    List<OrderLine> lines,
    DeliveryMode mode,
  ) => _checkout.getQuote(
    restaurantId: state.restaurantId,
    items: lines,
    mode: mode,
  );

  /// The user signed in (e.g. from "Make payment" as a guest): load their
  /// wallet, re-price (first-order discounts are per account) and, when
  /// [CheckoutAccountChanged.submit] is set and nothing blocks it, pay.
  Future<void> _onAccountChanged(
    CheckoutAccountChanged event,
    Emitter<CheckoutState> emit,
  ) async {
    final options = await _checkout.getPaymentOptions();
    final quote = state.isEmpty ? null : await _quote(state.lines, state.mode);
    emit(
      state.copyWith(
        paymentOptions: options.toNullable() ?? state.paymentOptions,
        quote: quote?.toNullable() ?? state.quote,
      ),
    );
    if (event.submit) {
      await _onSubmitted(CheckoutSubmitted(address: event.address), emit);
    }
  }

  Future<void> _onSubmitted(
    CheckoutSubmitted event,
    Emitter<CheckoutState> emit,
  ) async {
    if (!state.canSubmit) return;
    emit(
      state.copyWith(
        submitStatus: SubmitStatus.submitting,
        submitFailure: null,
      ),
    );
    final result = await _orders.placeOrder(
      PlaceOrderRequest(
        restaurantId: state.restaurantId,
        items: state.lines,
        deliveryMode: state.mode,
        paymentMethod: state.paymentMethod,
        address: state.mode == DeliveryMode.delivery ? event.address : null,
        instructions: state.instructions,
        gift: state.gift,
        cutlery: state.cutlery,
      ),
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          submitStatus: SubmitStatus.failure,
          submitFailure: failure,
        ),
      ),
      (order) => emit(
        state.copyWith(submitStatus: SubmitStatus.success, placedOrder: order),
      ),
    );
  }
}
