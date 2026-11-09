import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/models/money.dart';

part 'account_overview.freezed.dart';
part 'account_overview.g.dart';

/// Loyalty programme state ("90 pts more to next reward").
@freezed
abstract class RewardsSummary with _$RewardsSummary {
  const factory RewardsSummary({
    required int points,

    /// Points needed to unlock the next reward (e.g. 200).
    required int nextRewardPoints,

    /// Wallet credit granted per reward (e.g. £5).
    @MoneyConverter() required Money rewardValue,

    /// Points granted for each successful referral.
    @Default(0) int referralPoints,
    @Default('') String referralCode,
  }) = _RewardsSummary;

  const RewardsSummary._();

  factory RewardsSummary.fromJson(Map<String, dynamic> json) =>
      _$RewardsSummaryFromJson(json);

  int get pointsToNextReward =>
      (nextRewardPoints - points).clamp(0, nextRewardPoints);

  /// 0..1 progress towards the next reward.
  double get progress =>
      nextRewardPoints == 0 ? 0 : (points / nextRewardPoints).clamp(0, 1);

  bool get canRedeem => nextRewardPoints > 0 && points >= nextRewardPoints;
}

/// Wallet balance + rewards shown on the profile tab.
@freezed
abstract class AccountOverview with _$AccountOverview {
  const factory AccountOverview({
    @MoneyConverter() required Money walletBalance,
    required RewardsSummary rewards,
  }) = _AccountOverview;

  factory AccountOverview.fromJson(Map<String, dynamic> json) =>
      _$AccountOverviewFromJson(json);

  /// Realistic fake data for skeleton loading.
  static final placeholder = AccountOverview(
    walletBalance: Money.fromMajor(1250),
    rewards: RewardsSummary(
      points: 110,
      nextRewardPoints: 200,
      rewardValue: Money.fromMajor(5),
      referralPoints: 80,
    ),
  );
}
