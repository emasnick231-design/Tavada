import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/session/session_cubit.dart';
import 'package:tavada_eats/features/auth/domain/entities/auth_session.dart';

/// Data carried between the sign-up steps (email → phone → password → code).
@immutable
class SignUpDraft {
  const SignUpDraft({
    this.email = '',
    this.phone = '',
    this.password = '',
    this.firstName = '',
    this.lastName = '',
  });

  final String email;
  final String firstName;
  final String lastName;

  /// E.164 phone number.
  final String phone;
  final String password;

  SignUpDraft copyWith({
    String? email,
    String? phone,
    String? password,
    String? firstName,
    String? lastName,
  }) => SignUpDraft(
    email: email ?? this.email,
    phone: phone ?? this.phone,
    password: password ?? this.password,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
  );
}

/// Arguments of every auth route, passed through `GoRouterState.extra`.
///
/// [from] is the location to return to once signed in (e.g. checkout).
@immutable
class AuthFlowArgs {
  const AuthFlowArgs({this.from, this.draft = const SignUpDraft()});

  /// Rebuilds args from a route, falling back to the `from` query param.
  factory AuthFlowArgs.fromState(Object? extra, Map<String, String> query) {
    if (extra is AuthFlowArgs) return extra;
    return AuthFlowArgs(from: query['from']);
  }

  final String? from;
  final SignUpDraft draft;

  AuthFlowArgs copyWith({SignUpDraft? draft}) =>
      AuthFlowArgs(from: from, draft: draft ?? this.draft);
}

/// What the verification screen is verifying.
@immutable
class OtpArgs {
  const OtpArgs({
    required this.purpose,
    required this.destination,
    this.flow = const AuthFlowArgs(),
    this.resendInSeconds = 30,
  });

  final OtpPurpose purpose;

  /// Email (sign up, password reset) or E.164 phone (phone login).
  final String destination;
  final AuthFlowArgs flow;
  final int resendInSeconds;
}

/// Reset-password screen arguments.
@immutable
class ResetPasswordArgs {
  const ResetPasswordArgs({
    required this.email,
    required this.resetToken,
    this.flow = const AuthFlowArgs(),
  });

  final String email;
  final String resetToken;
  final AuthFlowArgs flow;
}

/// Last arguments of the code / new-password steps, so those screens
/// survive being rebuilt without `extra` (restored route, deep link, …).
abstract final class AuthFlowMemory {
  static OtpArgs? otp;
  static ResetPasswordArgs? reset;
}

extension OtpArgsLocationX on OtpArgs {
  /// `/auth/verify?purpose=…&to=…&from=…` — enough to rebuild a phone login
  /// or password reset step when `extra` is lost. (Sign up also needs the
  /// password, which never goes into a URL.)
  String get location => Uri(
    path: AppRoutes.verifyOtp,
    queryParameters: {
      'purpose': purpose.name,
      'to': destination,
      'from': ?flow.from,
    },
  ).toString();

  /// Rebuilds args from [query] for flows that only need the destination.
  static OtpArgs? fromQuery(Map<String, String> query) {
    final purpose = OtpPurpose.values.asNameMap()[query['purpose']];
    final to = query['to'];
    if (to == null || to.isEmpty) return null;
    if (purpose != OtpPurpose.phoneLogin &&
        purpose != OtpPurpose.resetPassword) {
      return null;
    }
    return OtpArgs(
      purpose: purpose!,
      destination: to,
      flow: AuthFlowArgs(from: query['from']),
      resendInSeconds: 0,
    );
  }
}

/// Opens the code step with its args in `extra` AND the URL.
Future<void> pushVerifyOtp(BuildContext context, OtpArgs args) =>
    context.push(args.location, extra: args);

/// Location helpers that keep the `from` param when chaining auth routes.
extension AuthFlowRoutesX on AuthFlowArgs {
  String withFrom(String path) => from == null
      ? path
      : Uri(path: path, queryParameters: {'from': from}).toString();
}

/// Persists [session] and leaves the auth flow (contract shared with every
/// feature that gates guests behind `/auth/login?from=…`).
Future<void> completeAuthentication(
  BuildContext context,
  AuthSession session, {
  String? from,
}) async {
  final cubit = context.read<SessionCubit>();
  await cubit.signIn(
    user: session.user,
    accessToken: session.accessToken,
    refreshToken: session.refreshToken,
  );
  if (!context.mounted) return;
  if (from != null && from.isNotEmpty) {
    // Return to the live screen (e.g. checkout with all its choices) by
    // popping the auth pages; only rebuild the stack when it isn't there.
    if (!_popBackTo(GoRouter.of(context), from)) context.go(from);
  } else if (cubit.state.needsAddress) {
    context.go(AppRoutes.locationIntro);
  } else {
    context.go(AppRoutes.home);
  }
}

/// Pops every auth page above [from] when [from] is the screen right below
/// the auth flow. Returns false (nothing popped) otherwise.
bool _popBackTo(GoRouter router, String from) {
  final matches = router.routerDelegate.currentConfiguration.matches;
  final target = Uri.parse(from).path;
  var authPages = 0;
  for (var i = matches.length - 1; i >= 0; i--) {
    final match = matches[i];
    final location = match is ImperativeRouteMatch
        ? match.matches.uri.path
        : match.matchedLocation;
    if (location.startsWith('/auth')) {
      authPages++;
      continue;
    }
    if (location != target || authPages == 0) return false;
    for (var p = 0; p < authPages; p++) {
      router.pop();
    }
    return true;
  }
  return false;
}

/// Maps auth-specific failures to friendly, localized copy.
String authErrorMessage(
  Failure failure,
  AppLocalizations l10n, {
  bool phoneLogin = false,
}) => switch (failure) {
  UnauthorizedFailure() => l10n.authErrorInvalidCredentials,
  NotFoundFailure() when phoneLogin => l10n.authErrorPhoneNotFound,
  ValidationFailure(code: 'invalid_otp') => l10n.authErrorInvalidCode,
  ValidationFailure(code: 'email_taken') => l10n.authErrorEmailTaken,
  _ => failure.localizedMessage(l10n),
};
