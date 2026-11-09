// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckoutQuote _$CheckoutQuoteFromJson(Map<String, dynamic> json) =>
    _CheckoutQuote(
      subtotal: const MoneyConverter().fromJson(json['subtotal'] as num),
      deliveryFee: const MoneyConverter().fromJson(json['delivery_fee'] as num),
      serviceFee: const MoneyConverter().fromJson(json['service_fee'] as num),
      total: const MoneyConverter().fromJson(json['total'] as num),
      discount: json['discount'] == null
          ? Money.zero
          : const MoneyConverter().fromJson(json['discount'] as num),
      originalDeliveryFee: const NullableMoneyConverter().fromJson(
        json['original_delivery_fee'] as num?,
      ),
      originalTotal: const NullableMoneyConverter().fromJson(
        json['original_total'] as num?,
      ),
      etaMinutes: (json['eta_minutes'] as num?)?.toInt() ?? 20,
      distanceMiles: (json['distance_miles'] as num?)?.toDouble() ?? 0.5,
      firstOrderApplied: json['first_order_applied'] as bool? ?? false,
    );

Map<String, dynamic> _$CheckoutQuoteToJson(_CheckoutQuote instance) =>
    <String, dynamic>{
      'subtotal': const MoneyConverter().toJson(instance.subtotal),
      'delivery_fee': const MoneyConverter().toJson(instance.deliveryFee),
      'service_fee': const MoneyConverter().toJson(instance.serviceFee),
      'total': const MoneyConverter().toJson(instance.total),
      'discount': const MoneyConverter().toJson(instance.discount),
      'original_delivery_fee': ?const NullableMoneyConverter().toJson(
        instance.originalDeliveryFee,
      ),
      'original_total': ?const NullableMoneyConverter().toJson(
        instance.originalTotal,
      ),
      'eta_minutes': instance.etaMinutes,
      'distance_miles': instance.distanceMiles,
      'first_order_applied': instance.firstOrderApplied,
    };

_PaymentOptions _$PaymentOptionsFromJson(Map<String, dynamic> json) =>
    _PaymentOptions(
      walletBalance: const MoneyConverter().fromJson(
        json['wallet_balance'] as num,
      ),
      cardLabel: json['card_label'] as String?,
    );

Map<String, dynamic> _$PaymentOptionsToJson(_PaymentOptions instance) =>
    <String, dynamic>{
      'wallet_balance': const MoneyConverter().toJson(instance.walletBalance),
      'card_label': ?instance.cardLabel,
    };
