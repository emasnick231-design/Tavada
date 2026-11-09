import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

/// Monetary amount stored in minor units (pence) to avoid floating point
/// rounding errors when summing baskets.
///
/// JSON uses major units (e.g. `12.5`) — see [MoneyConverter].
@immutable
class Money implements Comparable<Money> {
  const Money(this.minor, {this.currency = 'GBP'});

  factory Money.fromMajor(num major, {String currency = 'GBP'}) =>
      Money((major * 100).round(), currency: currency);

  static const zero = Money(0);

  final int minor;
  final String currency;

  double get major => minor / 100;
  bool get isZero => minor == 0;
  bool get isNegative => minor < 0;
  bool get isPositive => minor > 0;

  Money operator +(Money other) =>
      Money(minor + other.minor, currency: currency);
  Money operator -(Money other) =>
      Money(minor - other.minor, currency: currency);
  Money operator *(num factor) =>
      Money((minor * factor).round(), currency: currency);
  Money operator -() => Money(-minor, currency: currency);
  bool operator >(Money other) => minor > other.minor;
  bool operator <(Money other) => minor < other.minor;
  bool operator >=(Money other) => minor >= other.minor;
  bool operator <=(Money other) => minor <= other.minor;

  /// Percentage of this amount, e.g. `price.percent(10)` for a 10% discount.
  Money percent(num value) => this * (value / 100);

  static Money sum(Iterable<Money> values) =>
      values.fold(Money.zero, (a, b) => a + b);

  /// `£12.50`, `£1,250.00`, `-£20.99`.
  String format({String locale = 'en_GB', int decimalDigits = 2}) =>
      NumberFormat.simpleCurrency(
        locale: locale,
        name: currency,
        decimalDigits: decimalDigits,
      ).format(major);

  /// Drops `.00` for whole amounts: `£6`, `£250`, `£6.50`.
  String formatCompact({String locale = 'en_GB'}) =>
      format(locale: locale, decimalDigits: minor % 100 == 0 ? 0 : 2);

  @override
  int compareTo(Money other) => minor.compareTo(other.minor);

  @override
  bool operator ==(Object other) =>
      other is Money && other.minor == minor && other.currency == currency;

  @override
  int get hashCode => Object.hash(minor, currency);

  @override
  String toString() => format();
}

/// `@MoneyConverter()` for json_serializable fields of type [Money].
class MoneyConverter implements JsonConverter<Money, num> {
  const MoneyConverter();

  @override
  Money fromJson(num json) => Money.fromMajor(json);

  @override
  num toJson(Money object) => object.major;
}

/// Nullable variant of [MoneyConverter].
class NullableMoneyConverter implements JsonConverter<Money?, num?> {
  const NullableMoneyConverter();

  @override
  Money? fromJson(num? json) => json == null ? null : Money.fromMajor(json);

  @override
  num? toJson(Money? object) => object?.major;
}
