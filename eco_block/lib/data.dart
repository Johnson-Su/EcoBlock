import 'package:intl/intl.dart';

/*User Info for Dashboard*/
class User {
  String name;
  String UID;
  double balance;
  User({this.name, this.UID, this.balance});
}

final User user1 =
    User(name: "Johnson Su", UID: "123 456 789", balance: 173453.0);

class Transaction {
  String type; //deposit or withdraw
  DateTime dateAndTime;
  double amount;
  Transaction({this.type, this.dateAndTime, this.amount});
}

/*Transaction Info*/
DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss"); // for transactions

List<Transaction> transactions = [
  Transaction(
      type: "Deposit",
      dateAndTime: DateTime.utc(2021, 3, 20, 9, 33, 27),
      amount: 1523.45),
  Transaction(
      type: "Withdraw",
      dateAndTime: DateTime.utc(2021, 3, 12, 15, 27, 05),
      amount: 142.45),
  Transaction(
      type: "Withdraw",
      dateAndTime: DateTime.utc(2021, 3, 10, 1, 20, 09),
      amount: 572.45),
];
