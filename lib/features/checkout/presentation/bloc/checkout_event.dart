part of 'checkout_bloc.dart';

sealed class CheckoutEvent {
  const CheckoutEvent();
}

/// Loads the store, payment options and the first quote.
final class CheckoutStarted extends CheckoutEvent {
  const CheckoutStarted(this.lines);

  final List<OrderLine> lines;
}

/// The store basket changed (quantities, removed packs, edited selections).
final class CheckoutLinesChanged extends CheckoutEvent {
  const CheckoutLinesChanged(this.lines);

  final List<OrderLine> lines;
}

final class CheckoutModeChanged extends CheckoutEvent {
  const CheckoutModeChanged(this.mode);

  final DeliveryMode mode;
}

final class CheckoutPaymentMethodChanged extends CheckoutEvent {
  const CheckoutPaymentMethodChanged(this.method);

  final PaymentMethodType method;
}

final class CheckoutInstructionsChanged extends CheckoutEvent {
  const CheckoutInstructionsChanged(this.instructions);

  final String? instructions;
}

final class CheckoutGiftChanged extends CheckoutEvent {
  const CheckoutGiftChanged(this.gift);

  final GiftDetails? gift;
}

final class CheckoutCutleryToggled extends CheckoutEvent {
  const CheckoutCutleryToggled({required this.requested});

  final bool requested;
}

/// "Make payment".
final class CheckoutSubmitted extends CheckoutEvent {
  const CheckoutSubmitted({required this.address});

  final DeliveryAddress? address;
}

/// Retry after a failed re-price.
final class CheckoutQuoteRetried extends CheckoutEvent {
  const CheckoutQuoteRetried();
}

/// The session changed from guest to a signed-in user. [submit] resumes the
/// payment the guest started.
final class CheckoutAccountChanged extends CheckoutEvent {
  const CheckoutAccountChanged({required this.submit, this.address});

  final bool submit;
  final DeliveryAddress? address;
}

/// Internal: re-price the basket (debounced so stepper taps don't spam).
final class _CheckoutQuoteRequested extends CheckoutEvent {
  const _CheckoutQuoteRequested();
}
