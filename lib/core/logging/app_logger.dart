import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// Thin facade over `package:logger` so the rest of the app never depends on
/// a specific logging library (swap for Crashlytics/Sentry in one place).
class AppLogger {
  AppLogger._(this._logger);

  static AppLogger instance = AppLogger._(_build(enabled: kDebugMode));

  /// Reconfigures the global logger (called from `bootstrap`).
  static void configure({required bool enabled}) {
    instance = AppLogger._(_build(enabled: enabled));
  }

  static Logger _build({required bool enabled}) => Logger(
    filter: enabled ? DevelopmentFilter() : ProductionFilter(),
    level: enabled ? Level.debug : Level.warning,
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 6,
      lineLength: 90,
      dateTimeFormat: DateTimeFormat.onlyTime,
    ),
  );

  final Logger _logger;

  void debug(String message) => _logger.d(message);
  void info(String message) => _logger.i(message);
  void warning(String message, [Object? error]) =>
      _logger.w(message, error: error);
  void error(String message, [Object? error, StackTrace? stackTrace]) =>
      _logger.e(message, error: error, stackTrace: stackTrace);
}
