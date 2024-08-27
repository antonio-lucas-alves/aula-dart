import 'package:dart_bank/account_type.dart';
import 'package:dart_bank/models/simple_account.dart';

class PremiumAccount extends SimpleAccount {
  double cashback;

  PremiumAccount(
    super.name,
    super.number,
    super.balance, {
    this.cashback = 5,
  });

  @override
  String getInfo() {
    String info = super.getInfo();
    info += "\nCashback: ${getCashBack()}%";
    return info;
  }

  @override
  AccountType getType() {
    return AccountType.premium;
  }

  void applyCashback(double withDrawValue) {
    this.balance += withDrawValue * this.getCashBackTax();
  }

  double getCashBack() {
    return cashback;
  }

  double getCashBackTax() {
    return this.cashback / 100;
  }
}
