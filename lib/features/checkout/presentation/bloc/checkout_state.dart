part of 'checkout_bloc.dart';

@freezed
abstract class CheckoutState with _$CheckoutState {
  const factory CheckoutState({
    required String restaurantId,
    @Default([]) List<OrderLine> lines,
    @Default(ViewStatus.initial) ViewStatus status,
    @Default(false) bool isQuoting,
    Restaurant? restaurant,
    CheckoutQuote? quote,
    PaymentOptions? paymentOptions,
    @Default(DeliveryMode.delivery) DeliveryMode mode,
    @Default(PaymentMethodType.wallet) PaymentMethodType paymentMethod,
    String? instructions,
    GiftDetails? gift,
    @Default(false) bool cutlery,
    @Default(SubmitStatus.idle) SubmitStatus submitStatus,
    Failure? failure,
    Failure? submitFailure,
    Order? placedOrder,

    /// The last re-price failed: [quote] may be stale.
    Failure? quoteFailure,
  }) = _CheckoutState;

  const CheckoutState._();

  int get itemCount => lines.fold(0, (sum, l) => sum + l.quantity);

  bool get isEmpty => lines.isEmpty;

  /// Wallet can't cover the quoted total.
  bool get walletTooLow =>
      quote != null &&
      paymentOptions != null &&
      paymentOptions!.walletBalance < quote!.total;

  /// The store isn't taking orders right now.
  bool get isClosed => restaurant != null && !restaurant!.isOpen;

  /// Paying from a wallet that can't cover the total.
  bool get blockedByWallet =>
      paymentMethod == PaymentMethodType.wallet && walletTooLow;

  bool get canSubmit =>
      status.isSuccess &&
      !isEmpty &&
      quote != null &&
      quoteFailure == null &&
      !isQuoting &&
      !isClosed &&
      !blockedByWallet &&
      !submitStatus.isSubmitting;
}
