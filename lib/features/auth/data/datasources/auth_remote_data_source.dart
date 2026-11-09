import 'package:tavada_eats/core/network/api_client.dart';
import 'package:tavada_eats/features/auth/domain/entities/auth_session.dart';

/// Endpoints owned by the auth domain.
abstract final class AuthEndpoints {
  static const checkEmail = '/auth/sign-up/check-email';
  static const signUp = '/auth/sign-up';
  static const otpSend = '/auth/otp/send';
  static const otpVerify = '/auth/otp/verify';
  static const login = '/auth/login';
  static const phoneLogin = '/auth/login/phone';
  static const phoneLoginVerify = '/auth/login/phone/verify';
  static const forgotPassword = '/auth/password/forgot';
  static const resetPassword = '/auth/password/reset';
}

class AuthRemoteDataSource {
  AuthRemoteDataSource(this._client);

  final ApiClient _client;

  Future<void> checkEmail(String email) => _client.post<Object?>(
    AuthEndpoints.checkEmail,
    body: {'email': email},
  );

  Future<OtpDispatch> sendOtp(String destination, OtpPurpose purpose) async =>
      OtpDispatch.fromJson(
        await _client.post<Map<String, dynamic>>(
          AuthEndpoints.otpSend,
          body: {
            'destination': destination,
            'purpose': _purpose(purpose),
          },
        ),
      );

  Future<AuthSession> signUp({
    required String email,
    required String phone,
    required String password,
    required String code,
    String firstName = '',
    String lastName = '',
  }) async => AuthSession.fromJson(
    await _client.post<Map<String, dynamic>>(
      AuthEndpoints.signUp,
      body: {
        'email': email,
        'phone': phone,
        'password': password,
        'code': code,
        'first_name': firstName,
        'last_name': lastName,
      },
    ),
  );

  Future<AuthSession> login(String email, String password) async =>
      AuthSession.fromJson(
        await _client.post<Map<String, dynamic>>(
          AuthEndpoints.login,
          body: {'email': email, 'password': password},
        ),
      );

  Future<OtpDispatch> requestPhoneLogin(String phone) async =>
      OtpDispatch.fromJson(
        await _client.post<Map<String, dynamic>>(
          AuthEndpoints.phoneLogin,
          body: {'phone': phone},
        ),
      );

  Future<AuthSession> verifyPhoneLogin(String phone, String code) async =>
      AuthSession.fromJson(
        await _client.post<Map<String, dynamic>>(
          AuthEndpoints.phoneLoginVerify,
          body: {'phone': phone, 'code': code},
        ),
      );

  Future<OtpDispatch> forgotPassword(String email) async =>
      OtpDispatch.fromJson(
        await _client.post<Map<String, dynamic>>(
          AuthEndpoints.forgotPassword,
          body: {'email': email},
        ),
      );

  Future<String> verifyResetCode(String email, String code) async {
    final json = await _client.post<Map<String, dynamic>>(
      AuthEndpoints.otpVerify,
      body: {
        'destination': email,
        'code': code,
        'purpose': _purpose(OtpPurpose.resetPassword),
      },
    );
    return json['verification_token']! as String;
  }

  Future<void> resetPassword({
    required String email,
    required String resetToken,
    required String password,
  }) => _client.post<Object?>(
    AuthEndpoints.resetPassword,
    body: {
      'email': email,
      'verification_token': resetToken,
      'password': password,
    },
  );

  static String _purpose(OtpPurpose purpose) => switch (purpose) {
    OtpPurpose.signUp => 'sign_up',
    OtpPurpose.phoneLogin => 'phone_login',
    OtpPurpose.resetPassword => 'reset_password',
  };
}
