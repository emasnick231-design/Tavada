import 'package:flutter_test/flutter_test.dart';
import 'package:tavada_eats/core/models/money.dart';

void main() {
  group('Money', () {
    test('sums without floating point drift', () {
      final total = Money.sum(List.filled(3, Money.fromMajor(0.1)));
      expect(total, Money.fromMajor(0.3));
    });

    test('formats GBP', () {
      expect(Money.fromMajor(1250).format(), '£1,250.00');
      expect(Money.fromMajor(6).formatCompact(), '£6');
      expect(Money.fromMajor(-20.99).format(), '-£20.99');
    });

    test('applies percentages', () {
      expect(Money.fromMajor(6.01).percent(10), const Money(60));
    });
  });
}
