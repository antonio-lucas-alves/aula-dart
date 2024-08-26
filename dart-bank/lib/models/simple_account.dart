import 'package:dart_bank/account_type.dart';
import 'package:dart_bank/models/account.dart';

class SimpleAccount implements Account {
  String name;
  int number;
  double balance;

  SimpleAccount(this.name, this.number, this.balance);

  @override
  int getAccountNumber() {
    return number;
  }

  @override
  double getBalance() {
    return balance;
  }

  @override
  void deposit(double value) {
    balance += value;
  }

  @override
  String getInfo() {
    String info = "Cliente: $name";
    info += "\nAccount Number: $number";
    info += "\nAccount Type: ${getType().name}";
    info += "\nCurrent balance: \$$balance";
    return info;
  }

  @override
  AccountType getType() {
    return AccountType.simple;
  }

  @override
  void withDraw(double value) {
    balance -= value;
  }
}
