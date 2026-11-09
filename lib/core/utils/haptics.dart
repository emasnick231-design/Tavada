import 'dart:async';

import 'package:flutter/services.dart';

/// Centralised haptics so they can be globally disabled from settings.
/// Fire-and-forget: callers never need to await feedback.
abstract final class Haptics {
  static bool enabled = true;

  static void selection() => _fire(HapticFeedback.selectionClick);
  static void light() => _fire(HapticFeedback.lightImpact);
  static void medium() => _fire(HapticFeedback.mediumImpact);
  static void success() => _fire(HapticFeedback.mediumImpact);
  static void error() => _fire(HapticFeedback.heavyImpact);

  static void _fire(Future<void> Function() feedback) {
    if (enabled) unawaited(feedback());
  }
}
