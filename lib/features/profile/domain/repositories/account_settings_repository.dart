import 'package:tavada_eats/core/error/result.dart';
import 'package:tavada_eats/core/models/user_profile.dart';
import 'package:tavada_eats/features/profile/domain/entities/account_settings.dart';

/// Account details & preferences (phone, password, notifications,
/// accessibility).
abstract interface class AccountSettingsRepository {
  /// Sends a verification code to the new [phone] (rejects numbers used by
  /// another account). Returns seconds until a resend is allowed.
  FutureResult<int> requestPhoneCode(String phone);

  /// Saves the verified E.164 [phone]; returns the updated user.
  FutureResult<UserProfile> updatePhone({
    required String phone,
    required String code,
  });

  /// First / last name. Returns the updated user.
  FutureResult<UserProfile> updateProfile({
    required String firstName,
    required String lastName,
  });

  /// Permanently deletes the signed-in account and its data.
  FutureResult<Unit> deleteAccount();

  /// Fails with a `wrong_password` validation failure when
  /// [currentPassword] doesn't match.
  FutureResult<Unit> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  FutureResult<List<ChannelPreferences>> getNotificationPreferences();

  FutureResult<ChannelPreferences> updateNotificationPreferences(
    ChannelPreferences preferences,
  );

  FutureResult<AccessibilitySettings> getAccessibility();

  FutureResult<AccessibilitySettings> updateHearing(HearingPreference hearing);
}
