import 'package:flutter/material.dart';

class ThemeChange with ChangeNotifier {
  bool _darkTheme = false;
  bool get dark {
    return _darkTheme;
  }

  void changeTheme() {
    _darkTheme = !_darkTheme;
    notifyListeners();
  }
}

class Transaction with ChangeNotifier {
  String title;
  String id;
  String date;
  double amount;
  Transaction({this.amount, this.date, this.id, this.title});

  void addTxn(String amount, String title, DateTime date) {
    Transaction newTx;
    if (date != null && amount != null && title != null) {
      newTx = Transaction(
        amount: double.parse(amount),
        title: title,
        date: date.toString(),
        id: DateTime.now().toString(),
      );
      _user.add(newTx);
      notifyListeners();
    } else {
      return;
    }
  }

  List<Transaction> _user = [];
  List<Transaction> get user {
    return [..._user];
  }

  List<Transaction> get recentTransaction {
    return _user.where((tx) {
      return DateTime.parse(tx.date)
          .isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void deleteTransaction(Transaction transaction) {
    _user.remove(transaction);
    notifyListeners();
  }
}
