import 'package:expense_tracker/export.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  final Function change;
  final bool theme;
  LandingPage({this.change, this.theme});
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool theme = false;
  List<Transaction> _userTransaction = [];

  List<Transaction> get recentTransaction {
    return _userTransaction.where((tx) {
      return DateTime.parse(tx.date)
          .isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void addTransaction(Transaction tx) {
    setState(() {
      _userTransaction.add(tx);
      _userTransaction.sort((comp1, comp2) => comp1.date.compareTo(comp2.date));
      print(recentTransaction);
    });
  }

  void deleteTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((element) => element.id == id);
    });
  }

  void _addTransaction(BuildContext ctx) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: ctx,
        backgroundColor: Color.fromRGBO(0, 0, 0, 0),
        builder: (BuildContext context) {
          return Container(
            height: 500,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: NewTransaction(
                addTx: addTransaction,
              ),
            ),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(30)),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTransaction(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6,
        child: Padding(padding: EdgeInsets.all(20)),
      ),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Expense Tracker',
          style: Theme.of(context).textTheme.headline5,
        ),
        backgroundColor: Theme.of(context).canvasColor,
        automaticallyImplyLeading: false,
        actions: [
          Row(
            children: [
              Icon(
                widget.theme ? Icons.wb_sunny : Icons.tonality,
                color: Theme.of(context).colorScheme.primaryVariant,
              ),
              Switch(
                  value: widget.theme,
                  onChanged: (value) {
                    setState(() {
                      widget.change(value);
                    });
                  }),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: _userTransaction.isEmpty
              ? SingleChildScrollView(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Text(
                          "No Transaction Yet.",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Container(
                        height: 300,
                        child: Image.asset(
                          "assets/images/waiting.png",
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Chart(recentTransaction: recentTransaction)),
                    Text(
                      "Transactions",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Expanded(
                      flex: 2,
                      child: TransactionList(
                        transaction: _userTransaction,
                        delete: deleteTransaction,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
