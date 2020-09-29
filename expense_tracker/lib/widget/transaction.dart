import 'package:flutter/material.dart';
import 'package:expense_tracker/export.dart';

// ignore: must_be_immutable
class TransactionList extends StatelessWidget {
  List<Transaction> transaction;
  TransactionList({this.transaction});
  @override
  Widget build(BuildContext context) {
    List<Transaction> data = Provider.of<Transaction>(context).user;
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, int index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FittedBox(
                    child: Text(
                      "₹ " + data[index].amount.toInt().toString(),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: Text(data[index].title,
                                style: Theme.of(context).textTheme.headline5),
                          ),
                          Text(
                            DateFormat.yMMMEd().format(
                              DateTime.parse(data[index].date),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          Provider.of<Transaction>(context, listen: false)
                              .deleteTransaction(data[index]);
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
