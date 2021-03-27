import 'package:flutter/material.dart';

class User {
  String name;
  String UID;
  double balance;
  User({this.name, this.UID, this.balance});
}

final User user1 =
    User(name: "Johnson Su", UID: "123 456 789", balance: 173453.0);
