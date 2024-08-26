import 'package:dart_bank/account_type.dart';
import 'package:dart_bank/models/simple_account.dart';

class PremiumAccount extends SimpleAccount {
  double cashback;

  PremiumAccount(
    super.name,
    super.number,
    super.balance, {
    this.cashback = 0.5,
  });

  @override
  String getInfo() {
    String info = super.getInfo();
    info += "\nCashback: ${getCashBackTax()}%";
    return info;
  }

  @override
  AccountType getType() {
    return AccountType.premium;
  }

  void applyCashback(double withDrawValue) {
    this.balance += withDrawValue * this.getCashBackTax();
  }

  double getCashBackTax() {
    return this.cashback;
  }
}
