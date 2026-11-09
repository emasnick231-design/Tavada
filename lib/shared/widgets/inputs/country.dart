import 'package:flutter/foundation.dart';

/// A selectable country for phone inputs.
@immutable
class Country {
  const Country({
    required this.code,
    required this.name,
    required this.dialCode,
  });

  /// ISO 3166-1 alpha-2, lower case (e.g. `gb`).
  final String code;
  final String name;

  /// Digits only, e.g. `44`.
  final String dialCode;

  String get flagAsset => 'assets/flags/flag_$code.svg';
  String get dialPrefix => '+$dialCode';

  static const gb = Country(code: 'gb', name: 'United Kingdom', dialCode: '44');
  static const ng = Country(code: 'ng', name: 'Nigeria', dialCode: '234');

  /// Countries with bundled flags, UK & Nigeria first.
  static const all = <Country>[
    gb,
    ng,
    Country(code: 'gh', name: 'Ghana', dialCode: '233'),
    Country(code: 'za', name: 'South Africa', dialCode: '27'),
    Country(code: 'ke', name: 'Kenya', dialCode: '254'),
    Country(code: 'tr', name: 'Türkiye', dialCode: '90'),
    Country(code: 'us', name: 'United States', dialCode: '1'),
    Country(code: 'ca', name: 'Canada', dialCode: '1'),
    Country(code: 'au', name: 'Australia', dialCode: '61'),
    Country(code: 'ie', name: 'Ireland', dialCode: '353'),
    Country(code: 'fr', name: 'France', dialCode: '33'),
    Country(code: 'de', name: 'Germany', dialCode: '49'),
    Country(code: 'es', name: 'Spain', dialCode: '34'),
    Country(code: 'it', name: 'Italy', dialCode: '39'),
    Country(code: 'nl', name: 'Netherlands', dialCode: '31'),
    Country(code: 'ae', name: 'United Arab Emirates', dialCode: '971'),
    Country(code: 'in', name: 'India', dialCode: '91'),
    Country(code: 'eg', name: 'Egypt', dialCode: '20'),
    Country(code: 'ma', name: 'Morocco', dialCode: '212'),
    Country(code: 'sn', name: 'Senegal', dialCode: '221'),
    Country(code: 'et', name: 'Ethiopia', dialCode: '251'),
    Country(code: 'cm', name: 'Cameroon', dialCode: '237'),
  ];

  static Country byCode(String code) =>
      all.firstWhere((c) => c.code == code.toLowerCase(), orElse: () => gb);

  /// Best match for an E.164 number (longest dial code wins).
  static Country? fromE164(String e164) {
    final digits = e164.replaceAll(RegExp(r'\D'), '');
    final matches = all.where((c) => digits.startsWith(c.dialCode)).toList()
      ..sort((a, b) => b.dialCode.length.compareTo(a.dialCode.length));
    return matches.isEmpty ? null : matches.first;
  }

  @override
  bool operator ==(Object other) => other is Country && other.code == code;

  @override
  int get hashCode => code.hashCode;
}

/// Value emitted by `PhoneNumberField`.
@immutable
class PhoneNumber {
  const PhoneNumber({required this.country, required this.nationalNumber});

  final Country country;

  /// Digits typed by the user (no dial code).
  final String nationalNumber;

  String get digits => nationalNumber.replaceAll(RegExp(r'\D'), '');

  /// `+447700900123`
  String get e164 =>
      '+${country.dialCode}${digits.replaceFirst(RegExp('^0'), '')}';

  bool get isValid => digits.length >= 6 && digits.length <= 14;
}
