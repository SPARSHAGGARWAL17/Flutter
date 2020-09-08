import 'package:expense_tracker/models.dart';
import 'package:flutter/material.dart';

class TrackerPage extends StatefulWidget {
  @override
  _TrackerPageState createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: size.height * 0.3,
              child: Card(
                child: Text('Chart'),
              ),
            ),
            Text(
              "Transactions",
              style: Theme.of(context).textTheme.headline4,
            ),
            TransactionList(
              size: size,
            ),
          ],
        ),
      ),
    );
  }
}
