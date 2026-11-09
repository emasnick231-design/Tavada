import 'package:tavada_eats/core/error/result.dart';
import 'package:tavada_eats/core/models/money.dart';
import 'package:tavada_eats/features/profile/domain/entities/account_overview.dart';
import 'package:tavada_eats/features/profile/domain/entities/wallet_transaction.dart';

/// Wallet balance, transactions and rewards.
abstract interface class WalletRepository {
  FutureResult<AccountOverview> getOverview();

  /// Newest first.
  FutureResult<List<WalletTransaction>> getTransactions();

  /// Adds [amount] to the wallet. Returns the refreshed overview (top-ups
  /// also earn reward points).
  FutureResult<AccountOverview> topUp(Money amount);

  /// Converts points into wallet credit.
  FutureResult<AccountOverview> redeemReward();
}
