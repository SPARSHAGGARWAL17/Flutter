import '../export.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/model/sql.dart';

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
        TField(
          controller: titleController,
          title: true,
        ),
        SizedBox(height: 20),
        TField(
          controller: amountController,
          title: false,
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RButton(
              title: 'Cancel',
              onPressed: () async {
                final db = await DBHelper.getData('transactions');
                print(db);
                Navigator.of(context).pop();
              },
            ),
            RButton(
              onPressed: () async {
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
