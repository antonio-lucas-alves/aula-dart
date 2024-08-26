// ignore_for_file: unused_local_variable

import 'package:dart_bank/models/account.dart';
import 'package:dart_bank/models/premium_account.dart';
import 'package:dart_bank/models/simple_account.dart';
import 'package:dart_bank/services/transfer.dart';
import 'package:test/test.dart';

void main() {
  group('transferService', () {
    late Account account1;
    late Account account2;

    setUp(() {
      account1 = SimpleAccount('Diego', 1001, 1000.0);
      account2 = PremiumAccount('Paulo', 3557, 1000.0);
    });

    test('should transfer money from one simple account to premium account',
        () {
      transferService(account1, account2, 200.0);

      expect(account1.getBalance(), 800.0);
      expect(account2.getBalance(), 1200.0);
    });
  });
}
