import 'package:flutter/material.dart';
import 'export.dart';

class EntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Entry(),
    );
  }
}

class Entry extends StatefulWidget {
  @override
  _EntryState createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  DateTime currentDate;
  @override
  void initState() {
    currentDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<DateTime> _selectDate(DateTime selectedDate) async {
      DateTime _initialDate = selectedDate;
      final DateTime _pickedDate = await showDatePicker(
        context: context,
        initialDate: _initialDate,
        firstDate: DateTime.now().subtract(
          Duration(days: 365),
        ),
        lastDate: DateTime.now().add(
          Duration(days: 365),
        ),
      );
      return _pickedDate;
    }

    DateTime _pickedDate;

    return Container(
      child: Column(
        children: [
          FlatButton(
            onPressed: () async {
              _pickedDate = await _selectDate(currentDate);
              setState(() {
                currentDate = _pickedDate ?? currentDate;
              });
            },
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today,
                ),
                SizedBox(width: 20),
                Text(
                  DateFormat.yMMMEd().format(currentDate),
                ),
                Icon(
                  Icons.arrow_drop_down,
                )
              ],
            ),
          ),
          Form(
            child: TextFormField(),
          ),
          Text(DateFormat.yMMMEd().format(currentDate)),
        ],
      ),
    );
  }
}
