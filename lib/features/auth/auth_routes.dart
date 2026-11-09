import 'package:go_router/go_router.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/app/router/app_transitions.dart';
import 'package:tavada_eats/features/auth/presentation/flow/auth_flow.dart';
import 'package:tavada_eats/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:tavada_eats/features/auth/presentation/pages/login_page.dart';
import 'package:tavada_eats/features/auth/presentation/pages/reset_password_page.dart';
import 'package:tavada_eats/features/auth/presentation/pages/sign_up_email_page.dart';
import 'package:tavada_eats/features/auth/presentation/pages/sign_up_password_page.dart';
import 'package:tavada_eats/features/auth/presentation/pages/sign_up_phone_page.dart';
import 'package:tavada_eats/features/auth/presentation/pages/verify_otp_page.dart';

/// Sign up / log in / password recovery routes.
final authRoutes = <RouteBase>[
  GoRoute(
    path: AppRoutes.signUpEmail,
    pageBuilder: (context, state) => AppTransitions.adaptive(
      state,
      SignUpEmailPage(args: _flowArgs(state)),
    ),
  ),
  GoRoute(
    path: AppRoutes.signUpPhone,
    pageBuilder: (context, state) => AppTransitions.adaptive(
      state,
      SignUpPhonePage(args: _flowArgs(state)),
    ),
  ),
  GoRoute(
    path: AppRoutes.signUpPassword,
    pageBuilder: (context, state) => AppTransitions.adaptive(
      state,
      SignUpPasswordPage(args: _flowArgs(state)),
    ),
  ),
  GoRoute(
    path: AppRoutes.verifyOtp,
    // Without its flow the code step can't work: restart it sensibly.
    redirect: (context, state) =>
        _otpArgs(state) == null ? _restartFor(state) : null,
    pageBuilder: (context, state) => AppTransitions.adaptive(
      state,
      VerifyOtpPage(args: _otpArgs(state)),
    ),
  ),
  GoRoute(
    path: AppRoutes.login,
    pageBuilder: (context, state) => AppTransitions.adaptive(
      state,
      LoginPage(args: _flowArgs(state)),
    ),
  ),
  GoRoute(
    path: AppRoutes.forgotPassword,
    pageBuilder: (context, state) => AppTransitions.adaptive(
      state,
      ForgotPasswordPage(args: _flowArgs(state)),
    ),
  ),
  GoRoute(
    path: AppRoutes.resetPassword,
    // Without a verified code there's nothing to reset: ask for a new code.
    redirect: (context, state) => _resetArgs(state) == null
        ? AuthFlowArgs.fromState(
            null,
            state.uri.queryParameters,
          ).withFrom(AppRoutes.forgotPassword)
        : null,
    pageBuilder: (context, state) => AppTransitions.adaptive(
      state,
      ResetPasswordPage(args: _resetArgs(state)),
    ),
  ),
];

AuthFlowArgs _flowArgs(GoRouterState state) =>
    AuthFlowArgs.fromState(state.extra, state.uri.queryParameters);

/// `extra`, else the last args of this session, else the URL.
OtpArgs? _otpArgs(GoRouterState state) {
  final extra = state.extra;
  if (extra is OtpArgs) return AuthFlowMemory.otp = extra;
  final query = state.uri.queryParameters;
  final remembered = AuthFlowMemory.otp;
  if (remembered != null &&
      (query['to'] == null || query['to'] == remembered.destination)) {
    return remembered;
  }
  return OtpArgsLocationX.fromQuery(query);
}

ResetPasswordArgs? _resetArgs(GoRouterState state) {
  final extra = state.extra;
  if (extra is ResetPasswordArgs) return AuthFlowMemory.reset = extra;
  return AuthFlowMemory.reset;
}

/// Where a code step without its flow goes: the start of that flow.
String _restartFor(GoRouterState state) {
  final query = state.uri.queryParameters;
  final flow = AuthFlowArgs.fromState(null, query);
  return switch (query['purpose']) {
    'resetPassword' => flow.withFrom(AppRoutes.forgotPassword),
    'signUp' => flow.withFrom(AppRoutes.signUpEmail),
    _ => flow.withFrom(AppRoutes.login),
  };
}
