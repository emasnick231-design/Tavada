import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/models/user_profile.dart';

part 'auth_session.freezed.dart';
part 'auth_session.g.dart';

/// Credentials returned by every successful sign up / log in.
@freezed
abstract class AuthSession with _$AuthSession {
  const factory AuthSession({
    required UserProfile user,
    required String accessToken,
    String? refreshToken,
  }) = _AuthSession;

  factory AuthSession.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionFromJson(json);
}

/// Why a one-time code was sent.
@JsonEnum(fieldRename: FieldRename.snake)
enum OtpPurpose { signUp, phoneLogin, resetPassword }

/// Acknowledgement that a code is on its way.
@freezed
abstract class OtpDispatch with _$OtpDispatch {
  const factory OtpDispatch({
    required String destination,

    /// Seconds before "Resend code" becomes available.
    @Default(30) int resendInSeconds,
  }) = _OtpDispatch;

  factory OtpDispatch.fromJson(Map<String, dynamic> json) =>
      _$OtpDispatchFromJson(json);
}
