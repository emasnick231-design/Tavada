import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/models/money.dart';

part 'checkout_quote.freezed.dart';
part 'checkout_quote.g.dart';

/// Server-side price breakdown for a store basket ("Payment summary").
@freezed
abstract class CheckoutQuote with _$CheckoutQuote {
  const factory CheckoutQuote({
    @MoneyConverter() required Money subtotal,
    @MoneyConverter() required Money deliveryFee,
    @MoneyConverter() required Money serviceFee,
    @MoneyConverter() required Money total,
    @MoneyConverter() @Default(Money.zero) Money discount,

    /// Struck-through fee when delivery is discounted/free.
    @NullableMoneyConverter() Money? originalDeliveryFee,

    /// Struck-through total when savings apply.
    @NullableMoneyConverter() Money? originalTotal,
    @Default(20) int etaMinutes,
    @Default(0.5) double distanceMiles,
    @Default(false) bool firstOrderApplied,
  }) = _CheckoutQuote;

  factory CheckoutQuote.fromJson(Map<String, dynamic> json) =>
      _$CheckoutQuoteFromJson(json);
}

/// Wallet balance + saved card shown under "Choose your payment option".
@freezed
abstract class PaymentOptions with _$PaymentOptions {
  const factory PaymentOptions({
    @MoneyConverter() required Money walletBalance,
    String? cardLabel,
  }) = _PaymentOptions;

  factory PaymentOptions.fromJson(Map<String, dynamic> json) =>
      _$PaymentOptionsFromJson(json);
}
