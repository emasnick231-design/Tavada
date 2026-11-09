import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/models/money.dart';

part 'wallet_transaction.freezed.dart';
part 'wallet_transaction.g.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum WalletTransactionType { topUp, payment, refund, reward }

/// A wallet movement. Checkout records `payment`s, the wallet records
/// `top_up`s and `reward`s, support records `refund`s.
@freezed
abstract class WalletTransaction with _$WalletTransaction {
  const factory WalletTransaction({
    required String id,
    @JsonKey(unknownEnumValue: WalletTransactionType.payment)
    required WalletTransactionType type,

    /// Always positive — [isCredit] tells the direction.
    @MoneyConverter() required Money amount,
    required String description,
    required DateTime createdAt,
    String? orderId,
  }) = _WalletTransaction;

  const WalletTransaction._();

  factory WalletTransaction.fromJson(Map<String, dynamic> json) =>
      _$WalletTransactionFromJson(json);

  bool get isCredit => type != WalletTransactionType.payment;

  Money get signedAmount => isCredit ? amount : -amount;
}
