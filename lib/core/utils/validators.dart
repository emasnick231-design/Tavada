/// Pure validation helpers (no Flutter imports, easy to unit test).
abstract final class Validators {
  static final _email = RegExp(r'^[\w.+-]+@[\w-]+(\.[\w-]+)+$');
  static final _special = RegExp(r'[!@#$%^&*(),.?":{}|<>_\-+=~`\[\]\\/;]');
  static final _letter = RegExp('[A-Za-z]');
  static final _digit = RegExp(r'\d');

  static bool isEmail(String value) => _email.hasMatch(value.trim());

  /// Password rules shown live under the password field.
  static PasswordRules passwordRules(String value) => PasswordRules(
    hasMinLength: value.length >= 8,
    hasSpecialCharacter: _special.hasMatch(value),
    hasLetter: _letter.hasMatch(value),
    hasDigit: _digit.hasMatch(value),
  );

  /// National significant number length check (6–14 digits).
  static bool isPhoneNumber(String digits) {
    final clean = digits.replaceAll(RegExp(r'\D'), '');
    return clean.length >= 6 && clean.length <= 14;
  }

  static bool isOtp(String value, {int length = 4}) =>
      value.length == length && int.tryParse(value) != null;
}

class PasswordRules {
  const PasswordRules({
    required this.hasMinLength,
    required this.hasSpecialCharacter,
    required this.hasLetter,
    required this.hasDigit,
  });

  final bool hasMinLength;
  final bool hasSpecialCharacter;
  final bool hasLetter;
  final bool hasDigit;

  /// The design requires length + letter + (digit or special character).
  bool get isValid =>
      hasMinLength && hasLetter && (hasDigit || hasSpecialCharacter);
}
