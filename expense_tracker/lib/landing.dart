import 'package:expense_tracker/export.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
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
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(30)),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text('Expense Tracker'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _addTransaction(context);
              })
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: FractionallySizedBox(
                        alignment: Alignment.bottomCenter,
                        heightFactor: 0.6,
                        child: Container(
                          height: 60,
                          width: 10,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 0.1),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                    Container(
                      child: FractionallySizedBox(
                        alignment: Alignment.bottomCenter,
                        heightFactor: 0.8,
                        child: Container(
                          height: 60,
                          width: 10,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 0.1),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                    Container(
                      child: FractionallySizedBox(
                        alignment: Alignment.bottomCenter,
                        heightFactor: 0.4,
                        child: Container(
                          height: 60,
                          width: 10,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 0.1),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "Transactions",
                style: Theme.of(context).textTheme.headline3,
              ),
              TransactionList(
                transaction: _userTransaction,
                delete: deleteTransaction,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
