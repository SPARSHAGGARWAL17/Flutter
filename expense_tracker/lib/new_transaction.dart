import 'export.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
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
        TField(controller: titleController),
        SizedBox(height: 20),
        TField(controller: amountController),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RButton(
              title: 'Cancel',
              onPressed: () => Navigator.of(context).pop(),
            ),
            RButton(
              onPressed: () {
                Provider.of<Transaction>(context, listen: false).addTxn(
                    amountController.text, titleController.text, _selectedDate);
                Navigator.of(context).pop();
              },
              title: "Save",
            ),
          ],
        )
      ],
    );
  }
}

class TField extends StatelessWidget {
  TField({
    @required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: true,
      decoration: InputDecoration(
          labelText: "Title",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Theme.of(context).primaryColor))),
      onSubmitted: (value) {
        controller.text = value;
      },
    );
  }
}

class RButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  RButton({
    this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: Theme.of(context).textTheme.button,
      ),
      shape: StadiumBorder(),
      color: title == 'Cancel' ? Colors.red : Colors.green,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    );
  }
}

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
                          Provider.of<Transaction>(context)
                              .deleteTransaction(data[index].id);
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
