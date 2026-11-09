// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WalletTransaction _$WalletTransactionFromJson(Map<String, dynamic> json) =>
    _WalletTransaction(
      id: json['id'] as String,
      type: $enumDecode(
        _$WalletTransactionTypeEnumMap,
        json['type'],
        unknownValue: WalletTransactionType.payment,
      ),
      amount: const MoneyConverter().fromJson(json['amount'] as num),
      description: json['description'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      orderId: json['order_id'] as String?,
    );

Map<String, dynamic> _$WalletTransactionToJson(_WalletTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$WalletTransactionTypeEnumMap[instance.type]!,
      'amount': const MoneyConverter().toJson(instance.amount),
      'description': instance.description,
      'created_at': instance.createdAt.toIso8601String(),
      'order_id': ?instance.orderId,
    };

const _$WalletTransactionTypeEnumMap = {
  WalletTransactionType.topUp: 'top_up',
  WalletTransactionType.payment: 'payment',
  WalletTransactionType.refund: 'refund',
  WalletTransactionType.reward: 'reward',
};
