import 'export.dart';

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction({this.addTx});
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  DateTime _selectedDate;
  String initialDate = "No date Selected";
  _datePicker() async {
    _selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(
        Duration(days: 365),
      ),
    );
    setState(() {
      if (_selectedDate != null)
        initialDate = DateFormat.yMMMEd().format(_selectedDate);
    });
    return _selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    void addTxn() {
      if (amountController.text == null) {
        return;
      }
      if (_selectedDate != null &&
          amountController.text != null &&
          titleController.text != null) {
        setState(() {
          Transaction newTx = Transaction(
              amount: double.parse(amountController.text),
              title: titleController.text,
              date: _selectedDate.toString(),
              id: DateTime.now().toString());
          widget.addTx(newTx);
        });
        Navigator.of(context).pop();
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Enter Details',
              style: Theme.of(context).textTheme.headline5,
            ),
            Row(
              children: [
                Text(initialDate),
                IconButton(
                    icon: Icon(Icons.today),
                    onPressed: () {
                      _datePicker();
                    })
              ],
            )
          ],
        ),
        SizedBox(height: 20),
        TextField(
          controller: titleController,
          autofocus: true,
          decoration: InputDecoration(
              labelText: "Title",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
          onSubmitted: (value) {},
        ),
        SizedBox(height: 20),
        TextField(
          controller: amountController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: "Amount",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
          onSubmitted: (value) {},
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Cancel",
                style: Theme.of(context).textTheme.button,
              ),
              shape: StadiumBorder(),
              color: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            RaisedButton(
              onPressed: () {
                addTxn();
              },
              child: Text(
                "Save",
                style: Theme.of(context).textTheme.button,
              ),
              shape: StadiumBorder(),
              color: Colors.green,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
          ],
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class TransactionList extends StatelessWidget {
  List<Transaction> transaction;
  Function delete;
  TransactionList({this.transaction, this.delete});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: transaction.length,
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
                      "₹ " + transaction[index].amount.toInt().toString(),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: Text(transaction[index].title,
                                style: Theme.of(context).textTheme.headline5),
                          ),
                          Text(
                            DateFormat.yMMMEd().format(
                              DateTime.parse(transaction[index].date),
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
                          delete(transaction[index].id);
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
