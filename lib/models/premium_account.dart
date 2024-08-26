import 'package:dart_bank/account_type.dart';
import 'package:dart_bank/models/account.dart';
import 'package:dart_bank/models/simple_account.dart';

class PremiumAccount extends SimpleAccount implements Account {
  double cashback;

  PremiumAccount(
    super.name,
    super.number,
    super.balance, {
    this.cashback = 0.5,
  });

  @override
  double getBalance() {
    return 0.0;
  }

  @override
  void addBalance(double value) {
    balance += value;
  }

  @override
  String getInfo() {
    // TODO: implement getInfo
    throw UnimplementedError();
  }

  @override
  AccountType getType() {
    return AccountType.premium;
  }

  @override
  void removeBalance(double value) {
    double cashbackValue = value * cashback;
    balance -= value;
    balance += cashbackValue;
  }

  @override
  double getCashBack() {
    return cashback;
  }
}
