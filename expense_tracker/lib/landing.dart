import 'package:expense_tracker/export.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final bool theme;
  LandingPage({this.theme});

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
              child: NewTransaction(),
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
    List<Transaction> recentTransaction =
        Provider.of<Transaction>(context).recentTransaction;
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
        automaticallyImplyLeading: false,
        actions: [
          Row(
            children: [
              Icon(
                !theme ? Icons.wb_sunny : Icons.tonality,
                color: Theme.of(context).iconTheme.color,
              ),
              Switch(
                  value: theme,
                  onChanged: (value) {
                    Provider.of<ThemeChange>(context, listen: false)
                        .changeTheme();
                  }),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Provider.of<Transaction>(context).user.isEmpty
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
                        transaction: Provider.of<Transaction>(context).user,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
