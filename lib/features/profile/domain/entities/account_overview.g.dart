// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_overview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RewardsSummary _$RewardsSummaryFromJson(Map<String, dynamic> json) =>
    _RewardsSummary(
      points: (json['points'] as num).toInt(),
      nextRewardPoints: (json['next_reward_points'] as num).toInt(),
      rewardValue: const MoneyConverter().fromJson(json['reward_value'] as num),
      referralPoints: (json['referral_points'] as num?)?.toInt() ?? 0,
      referralCode: json['referral_code'] as String? ?? '',
    );

Map<String, dynamic> _$RewardsSummaryToJson(_RewardsSummary instance) =>
    <String, dynamic>{
      'points': instance.points,
      'next_reward_points': instance.nextRewardPoints,
      'reward_value': const MoneyConverter().toJson(instance.rewardValue),
      'referral_points': instance.referralPoints,
      'referral_code': instance.referralCode,
    };

_AccountOverview _$AccountOverviewFromJson(Map<String, dynamic> json) =>
    _AccountOverview(
      walletBalance: const MoneyConverter().fromJson(
        json['wallet_balance'] as num,
      ),
      rewards: RewardsSummary.fromJson(json['rewards'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountOverviewToJson(_AccountOverview instance) =>
    <String, dynamic>{
      'wallet_balance': const MoneyConverter().toJson(instance.walletBalance),
      'rewards': instance.rewards.toJson(),
    };
