import 'package:tavada_eats/core/error/result.dart';
import 'package:tavada_eats/core/models/money.dart';
import 'package:tavada_eats/core/models/user_profile.dart';
import 'package:tavada_eats/features/profile/data/datasources/profile_remote_data_sources.dart';
import 'package:tavada_eats/features/profile/domain/entities/account_overview.dart';
import 'package:tavada_eats/features/profile/domain/entities/account_settings.dart';
import 'package:tavada_eats/features/profile/domain/entities/wallet_transaction.dart';
import 'package:tavada_eats/features/profile/domain/repositories/account_settings_repository.dart';
import 'package:tavada_eats/features/profile/domain/repositories/wallet_repository.dart';

class WalletRepositoryImpl implements WalletRepository {
  WalletRepositoryImpl(this._remote);

  final WalletRemoteDataSource _remote;

  @override
  FutureResult<AccountOverview> getOverview() => guard(_remote.fetchOverview);

  @override
  FutureResult<List<WalletTransaction>> getTransactions() =>
      guard(_remote.fetchTransactions);

  @override
  FutureResult<AccountOverview> topUp(Money amount) =>
      guard(() => _remote.topUp(amount));

  @override
  FutureResult<AccountOverview> redeemReward() => guard(_remote.redeem);
}

class AccountSettingsRepositoryImpl implements AccountSettingsRepository {
  AccountSettingsRepositoryImpl(this._remote);

  final AccountSettingsRemoteDataSource _remote;

  @override
  FutureResult<int> requestPhoneCode(String phone) =>
      guard(() => _remote.requestPhoneCode(phone));

  @override
  FutureResult<UserProfile> updatePhone({
    required String phone,
    required String code,
  }) => guard(() => _remote.updatePhone(phone, code));

  @override
  FutureResult<UserProfile> updateProfile({
    required String firstName,
    required String lastName,
  }) => guard(
    () => _remote.updateProfile(firstName: firstName, lastName: lastName),
  );

  @override
  FutureResult<Unit> deleteAccount() => guard(() async {
    await _remote.deleteAccount();
    return unit;
  });

  @override
  FutureResult<Unit> changePassword({
    required String currentPassword,
    required String newPassword,
  }) => guard(() async {
    await _remote.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
    return unit;
  });

  @override
  FutureResult<List<ChannelPreferences>> getNotificationPreferences() =>
      guard(_remote.fetchNotifications);

  @override
  FutureResult<ChannelPreferences> updateNotificationPreferences(
    ChannelPreferences preferences,
  ) => guard(() => _remote.updateNotifications(preferences));

  @override
  FutureResult<AccessibilitySettings> getAccessibility() =>
      guard(_remote.fetchAccessibility);

  @override
  FutureResult<AccessibilitySettings> updateHearing(
    HearingPreference hearing,
  ) => guard(
    () => _remote.updateAccessibility(AccessibilitySettings(hearing: hearing)),
  );
}
