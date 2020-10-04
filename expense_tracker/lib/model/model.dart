import 'package:flutter/material.dart';
import 'sql.dart';

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

  void addTxn(String amount, String title, DateTime date) async {
    Map<String, Object> newTx;
    if (date != null && amount != '' && title != '') {
      newTx = {
        'amount': double.parse(amount),
        'title': title,
        'date': date.toString(),
        'id': DateTime.now().toString(),
      };
      DBHelper.insert('transactions', newTx);

      notifyListeners();
    } else {
      return;
    }
  }

  void loadData() async {
    final List<Map<String, Object>> data =
        await DBHelper.getData('transactions');
    _user = data
        .map((single) => Transaction(
            amount: single['amount'],
            title: single['title'],
            date: single['date'],
            id: single['id']))
        .toList();
    _user.sort((comp1, comp2) =>
        DateTime.parse(comp1.date).compareTo(DateTime.parse(comp2.date)));
    notifyListeners();
  }

  List<Transaction> _user = [];
  List<Transaction> get user {
    loadData();
    return [..._user];
  }

  List<Transaction> get recentTransaction {
    return _user.where((tx) {
      return DateTime.parse(tx.date)
          .isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void deleteTransaction(Transaction transaction) {
    DBHelper.delete(transaction.id);
    notifyListeners();
  }
}
