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

  void deleteTransaction(String id) {
    _user.removeWhere((element) => element.id == id);
  }
}

ThemeData themeLight = ThemeData.light().copyWith(
  iconTheme: IconThemeData(
    color: Colors.black,
  ),
  colorScheme: ColorScheme.light(primary: Colors.red),
  primaryColor: Colors.red,
  cardColor: Colors.white,
  appBarTheme: AppBarTheme(
    color: ThemeData.light().scaffoldBackgroundColor,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.red,
  ),
);

ThemeData themeDark = ThemeData.dark().copyWith(
  toggleableActiveColor: Colors.red,
  colorScheme: ColorScheme.dark(
    primary: Colors.red,
  ),
  appBarTheme: AppBarTheme(
    color: ThemeData.dark().scaffoldBackgroundColor,
  ),
  primaryColor: Colors.red,
  cardColor: Colors.black,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.red,
  ),
);
