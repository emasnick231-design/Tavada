import 'package:tavada_eats/core/error/result.dart';
import 'package:tavada_eats/features/auth/domain/entities/auth_session.dart';

/// Account creation, log in and password recovery.
abstract interface class AuthRepository {
  /// Succeeds when no account uses [email] yet.
  FutureResult<Unit> checkEmailAvailable(String email);

  FutureResult<OtpDispatch> sendOtp({
    required String destination,
    required OtpPurpose purpose,
  });

  FutureResult<AuthSession> signUp({
    required String email,
    required String phone,
    required String password,
    required String code,
    String firstName = '',
    String lastName = '',
  });

  FutureResult<AuthSession> loginWithEmail({
    required String email,
    required String password,
  });

  /// Sends a login code to [phone] (E.164).
  FutureResult<OtpDispatch> requestPhoneLogin(String phone);

  FutureResult<AuthSession> verifyPhoneLogin({
    required String phone,
    required String code,
  });

  FutureResult<OtpDispatch> requestPasswordReset(String email);

  /// Exchanges an emailed code for a short-lived reset token.
  FutureResult<String> verifyResetCode({
    required String email,
    required String code,
  });

  FutureResult<Unit> resetPassword({
    required String email,
    required String resetToken,
    required String password,
  });
}
