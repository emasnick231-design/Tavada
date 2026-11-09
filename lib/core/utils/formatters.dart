import 'package:intl/intl.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';

/// Locale-aware display formatting helpers.
abstract final class Formatters {
  /// `0.5`, `1.2`, `12` (miles, one decimal under 10).
  static String distance(double miles) {
    if (miles >= 10) return miles.round().toString();
    final value = (miles * 10).round() / 10;
    return value == value.roundToDouble()
        ? value.toStringAsFixed(0)
        : value.toStringAsFixed(1);
  }

  /// `9:36pm`
  static String time(DateTime value, {String? locale}) =>
      DateFormat('h:mma', locale).format(value).toLowerCase();

  /// `11:00 AM` style (opening hours).
  static String clock(DateTime value, {String? locale}) =>
      DateFormat.jm(locale).format(value);

  /// `15th January, 2025` (English) / `15 Ocak 2025` (other locales).
  static String longDate(DateTime value, {String locale = 'en'}) {
    if (!locale.startsWith('en')) {
      return DateFormat('d MMMM y', locale).format(value);
    }
    return '${value.day}${_ordinal(value.day)} '
        '${DateFormat('MMMM, y', locale).format(value)}';
  }

  /// `27 October 2025`
  static String date(DateTime value, {String? locale}) =>
      DateFormat('d MMMM y', locale).format(value);

  /// `Today`, `Yesterday`, `3 days ago`, `1 month ago`.
  static String relative(
    DateTime value,
    AppLocalizations l10n, {
    DateTime? now,
  }) {
    final current = now ?? DateTime.now();
    final days = DateTime(
      current.year,
      current.month,
      current.day,
    ).difference(DateTime(value.year, value.month, value.day)).inDays;
    if (days <= 0) return l10n.commonToday;
    if (days == 1) return l10n.commonYesterday;
    if (days < 30) return l10n.commonRelativeDays(days);
    final months = (days / 30).floor();
    if (months < 12) return l10n.commonRelativeMonths(months);
    return date(value, locale: l10n.localeName);
  }

  /// Grouped counts: `3,482`.
  static String count(int value) => NumberFormat.decimalPattern().format(value);

  /// Compact counts: `101`, `1.2k`.
  static String compactCount(int value) =>
      NumberFormat.compact().format(value).toLowerCase();

  static String _ordinal(int day) {
    if (day >= 11 && day <= 13) return 'th';
    return switch (day % 10) {
      1 => 'st',
      2 => 'nd',
      3 => 'rd',
      _ => 'th',
    };
  }
}
