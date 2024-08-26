import 'package:dart_bank/account_type.dart';

abstract class Account {
  void deposit(double value);
  void withDraw(double value);
  String getInfo();
  int getAccountNumber();
  double getBalance();
  AccountType getType();
}
