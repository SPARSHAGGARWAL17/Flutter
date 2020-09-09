import 'export.dart';
import 'package:flutter/material.dart';

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
                      onPressed: () {
                        transaction.remove(tx);
                      },
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

class TextFormSheet extends StatelessWidget {
  final String text;
  const TextFormSheet(
    this.text,
  );

  @override
  Widget build(BuildContext context) {
    TextEditingController controller =
        text == "Note" ? noteController : amountController;
    return TextField(
      controller: controller,
      onEditingComplete: () {
        print(controller.text);
      },
      keyboardType:
          text == "Amount" ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        fillColor: Colors.grey[700],
        filled: true,
        labelText: text,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}

class ButtonSheet extends StatelessWidget {
  final String value;
  ButtonSheet(this.value);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        print(noteController.text);
        Navigator.of(context).pop();
      },
      shape: StadiumBorder(),
      color: value == "Cancel" ? Colors.red : Colors.green,
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      elevation: 0.0,
      child: Text(value),
    );
  }
}
