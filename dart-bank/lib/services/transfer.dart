import 'package:dart_bank/models/account.dart';
import 'package:dart_bank/models/premium_account.dart';
import 'package:dart_bank/transferException.dart';

void transferService(Account from, Account to, double transferValue) {
  if (from.getAccountNumber() == to.getAccountNumber()) {
    throw TransferException("Cannot transfer to the same account");
  }

  if (transferValue <= 0 || from.getBalance() < transferValue) {
    throw TransferException("Insufficient balance or invalid transfer amount");
  }

  if (from is PremiumAccount) {
    from.applyCashback(transferValue);
  }

  from.withDraw(transferValue);
  to.deposit(transferValue);

  print('''
------------------------------------------
Transfer balance performed with the value: \$$transferValue

From: 
  - ${from.getInfo()}

To:
  - ${to.getInfo()}

------------------------------------------
''');
}
