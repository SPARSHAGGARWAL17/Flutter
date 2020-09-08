import 'package:flutter/material.dart';
import 'export.dart';

class Transaction {
  final String note;
  final double amount;
  final String date;
  Transaction({this.amount, this.date, this.note});
}

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

class TransactionList extends StatelessWidget {
  final Size size;
  TransactionList({this.size});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.45,
      child: SingleChildScrollView(
        child: Column(
          children: transaction.map((Transaction tx) {
            return Card(
              child: Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '₹ ${tx.amount.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.note,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          DateFormat.yMMMEd().format(DateTime.parse(tx.date)),
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
