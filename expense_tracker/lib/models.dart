import 'package:flutter/cupertino.dart';

class Transaction {
  final String note;
  final double amount;
  final String date;
  Transaction({this.amount, this.date, this.note});
}

TextEditingController noteController = TextEditingController();
TextEditingController amountController = TextEditingController();
List<Transaction> transaction = [
  Transaction(
    note: "Test 1",
    amount: 23.0,
    date: DateTime.now().toString(),
  ),
  Transaction(
    note: "Test 2",
    amount: 33.0,
    date: DateTime.now().add(Duration(days: 1)).toString(),
  ),
  Transaction(
    note: "Test 2",
    amount: 53.0,
    date: DateTime.now().add(Duration(days: 1)).toString(),
  ),
  Transaction(
    note: "Test 2",
    amount: 83.0,
    date: DateTime.now().add(Duration(days: 1)).toString(),
  ),
  Transaction(
    note: "Test 2",
    amount: 73.0,
    date: DateTime.now().add(Duration(days: 1)).toString(),
  ),
  Transaction(
    note: "Test 3",
    amount: 43.0,
    date: DateTime.now().add(Duration(days: 2)).toString(),
  )
];
