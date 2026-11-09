import 'package:tavada_eats/core/error/result.dart';
import 'package:tavada_eats/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:tavada_eats/features/auth/domain/entities/auth_session.dart';
import 'package:tavada_eats/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._remote);

  final AuthRemoteDataSource _remote;

  static String _normalizeEmail(String email) => email.trim().toLowerCase();

  @override
  FutureResult<Unit> checkEmailAvailable(String email) => guard(() async {
    await _remote.checkEmail(_normalizeEmail(email));
    return unit;
  });

  @override
  FutureResult<OtpDispatch> sendOtp({
    required String destination,
    required OtpPurpose purpose,
  }) => guard(() => _remote.sendOtp(destination, purpose));

  @override
  FutureResult<AuthSession> signUp({
    required String email,
    required String phone,
    required String password,
    required String code,
    String firstName = '',
    String lastName = '',
  }) => guard(
    () => _remote.signUp(
      email: _normalizeEmail(email),
      phone: phone,
      password: password,
      code: code,
      firstName: firstName.trim(),
      lastName: lastName.trim(),
    ),
  );

  @override
  FutureResult<AuthSession> loginWithEmail({
    required String email,
    required String password,
  }) => guard(() => _remote.login(_normalizeEmail(email), password));

  @override
  FutureResult<OtpDispatch> requestPhoneLogin(String phone) =>
      guard(() => _remote.requestPhoneLogin(phone));

  @override
  FutureResult<AuthSession> verifyPhoneLogin({
    required String phone,
    required String code,
  }) => guard(() => _remote.verifyPhoneLogin(phone, code));

  @override
  FutureResult<OtpDispatch> requestPasswordReset(String email) =>
      guard(() => _remote.forgotPassword(_normalizeEmail(email)));

  @override
  FutureResult<String> verifyResetCode({
    required String email,
    required String code,
  }) => guard(() => _remote.verifyResetCode(_normalizeEmail(email), code));

  @override
  FutureResult<Unit> resetPassword({
    required String email,
    required String resetToken,
    required String password,
  }) => guard(() async {
    await _remote.resetPassword(
      email: _normalizeEmail(email),
      resetToken: resetToken,
      password: password,
    );
    return unit;
  });
}
