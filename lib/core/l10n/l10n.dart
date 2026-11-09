import 'package:flutter/widgets.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/l10n/gen/app_localizations.dart';

export 'package:tavada_eats/core/l10n/gen/app_localizations.dart';

/// Supported locales, in display order.
const supportedAppLocales = [Locale('en'), Locale('tr')];

extension AppLocalizationsX on BuildContext {
  /// `context.l10n.commonContinue`
  AppLocalizations get l10n => AppLocalizations.of(this);
}

extension FailureL10nX on Failure {
  /// User-facing, localized description of a failure.
  String localizedMessage(AppLocalizations l10n) => switch (this) {
    NetworkFailure(message: 'timeout') => l10n.errorTimeout,
    NetworkFailure() => l10n.errorNetwork,
    UnauthorizedFailure() => l10n.errorUnauthorized,
    NotFoundFailure() => l10n.errorNotFound,
    // Validation messages come from the API already phrased for users.
    ValidationFailure(:final message) => message,
    ServerFailure(:final message, :final code) =>
      code == 'service_unavailable' ? message : l10n.errorServer,
    CancelledFailure() ||
    CacheFailure() ||
    UnexpectedFailure() => l10n.errorUnexpected,
  };
}
