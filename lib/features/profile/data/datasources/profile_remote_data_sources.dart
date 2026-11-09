import 'package:tavada_eats/core/models/money.dart';
import 'package:tavada_eats/core/models/user_profile.dart';
import 'package:tavada_eats/core/network/api_client.dart';
import 'package:tavada_eats/features/profile/domain/entities/account_overview.dart';
import 'package:tavada_eats/features/profile/domain/entities/account_settings.dart';
import 'package:tavada_eats/features/profile/domain/entities/wallet_transaction.dart';

/// Endpoints owned by the profile feature.
abstract final class ProfileEndpoints {
  static const account = '/account';
  static const transactions = '/wallet/transactions';
  static const topUp = '/wallet/top-up';
  static const redeem = '/rewards/redeem';
  static const phone = '/me/phone';
  static const phoneCode = '/me/phone/code';
  static const profile = '/me/profile';
  static const me = '/me';
  static const password = '/me/password';
  static const notifications = '/me/notifications';
  static String notificationChannel(String channel) =>
      '/me/notifications/$channel';
  static const accessibility = '/me/accessibility';
}

class WalletRemoteDataSource {
  WalletRemoteDataSource(this._client);

  final ApiClient _client;

  Future<AccountOverview> fetchOverview() async => AccountOverview.fromJson(
    await _client.get<Map<String, dynamic>>(ProfileEndpoints.account),
  );

  Future<List<WalletTransaction>> fetchTransactions() async =>
      (await _client.get<List<dynamic>>(ProfileEndpoints.transactions))
          .map((e) => WalletTransaction.fromJson(e as Map<String, dynamic>))
          .toList();

  Future<AccountOverview> topUp(Money amount) async => AccountOverview.fromJson(
    await _client.post<Map<String, dynamic>>(
      ProfileEndpoints.topUp,
      body: {'amount': amount.major, 'currency': amount.currency},
    ),
  );

  Future<AccountOverview> redeem() async => AccountOverview.fromJson(
    await _client.post<Map<String, dynamic>>(ProfileEndpoints.redeem),
  );
}

class AccountSettingsRemoteDataSource {
  AccountSettingsRemoteDataSource(this._client);

  final ApiClient _client;

  /// Sends a one-time code to [phone]; returns seconds until a resend.
  Future<int> requestPhoneCode(String phone) async {
    final data = await _client.post<Map<String, dynamic>>(
      ProfileEndpoints.phoneCode,
      body: {'phone': phone},
    );
    return (data['resend_in_seconds'] as num?)?.toInt() ?? 30;
  }

  Future<UserProfile> updatePhone(String phone, String code) async =>
      UserProfile.fromJson(
        await _client.put<Map<String, dynamic>>(
          ProfileEndpoints.phone,
          body: {'phone': phone, 'code': code},
        ),
      );

  Future<UserProfile> updateProfile({
    required String firstName,
    required String lastName,
  }) async => UserProfile.fromJson(
    await _client.put<Map<String, dynamic>>(
      ProfileEndpoints.profile,
      body: {'first_name': firstName, 'last_name': lastName},
    ),
  );

  Future<void> deleteAccount() => _client.delete<Object?>(ProfileEndpoints.me);

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) => _client.post<Object?>(
    ProfileEndpoints.password,
    body: {'current_password': currentPassword, 'new_password': newPassword},
  );

  Future<List<ChannelPreferences>> fetchNotifications() async =>
      (await _client.get<List<dynamic>>(ProfileEndpoints.notifications))
          .map((e) => ChannelPreferences.fromJson(e as Map<String, dynamic>))
          .toList();

  Future<ChannelPreferences> updateNotifications(
    ChannelPreferences preferences,
  ) async => ChannelPreferences.fromJson(
    await _client.put<Map<String, dynamic>>(
      ProfileEndpoints.notificationChannel(preferences.channel.name),
      body: preferences.toJson(),
    ),
  );

  Future<AccessibilitySettings> fetchAccessibility() async =>
      AccessibilitySettings.fromJson(
        await _client.get<Map<String, dynamic>>(ProfileEndpoints.accessibility),
      );

  Future<AccessibilitySettings> updateAccessibility(
    AccessibilitySettings settings,
  ) async => AccessibilitySettings.fromJson(
    await _client.put<Map<String, dynamic>>(
      ProfileEndpoints.accessibility,
      body: settings.toJson(),
    ),
  );
}
