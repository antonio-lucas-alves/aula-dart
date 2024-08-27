import 'package:dart_bank/models/premium_account.dart';
import 'package:dart_bank/models/simple_account.dart';
import 'package:dart_bank/services/transfer.dart';
import 'package:dart_bank/transferException.dart';
import 'package:test/test.dart';

void main() {
  group('transferService', () {
    late SimpleAccount account1;
    late PremiumAccount account2;

    setUp(() {
      account1 = SimpleAccount('Diego', 1001, 1000.0);
      account2 = PremiumAccount('Paulo', 3557, 1000.0);
    });

    test('should transfer money from one simple account to premium account',
        () {
      final amount = 200.0;

      transferService(account1, account2, amount);

      expect(account1.getBalance(), equals(800.0));
      expect(account2.getBalance(), equals(1200.0));
    });

    test(
        'should transfer money from premium to simple account and apply cashback',
        () {
      final amount = 200.0;

      transferService(account2, account1, amount);

      expect(account1.getBalance(), equals(1200.0));
      expect(account2.getBalance(),
          equals(800.0 + (account2.getCashBackTax() * amount)));
    });

    test('should throw an error when transfer zero values', () {
      expect(
        () => transferService(account1, account2, 0),
        throwsA(
          predicate((e) =>
              e is TransferException &&
              e
                  .toString()
                  .contains('Insufficient balance or invalid transfer amount')),
        ),
      );
    });

    test('should throw an error when transfer negative values', () {
      expect(
        () => transferService(account1, account2, -100.000),
        throwsA(
          predicate((e) =>
              e is TransferException &&
              e
                  .toString()
                  .contains('Insufficient balance or invalid transfer amount')),
        ),
      );
    });

    test('should throw an error when trying to transfer to the same account',
        () {
      final amount = 25.0;

      expect(
        () => transferService(account2, account2, amount),
        throwsA(
          predicate((e) =>
              e is TransferException &&
              e.toString().contains('Cannot transfer to the same account')),
        ),
      );
    });
  });
}
