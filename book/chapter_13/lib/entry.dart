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
  TextEditingController _moodController = TextEditingController();
  TextEditingController _noteController = TextEditingController();
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
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: 500,
            child: FlatButton(
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
          ),
          SizedBox(
            height: 20,
          ),
          Form(
            child: Column(
              children: [
                TextField(
                  controller: _moodController,
                  autofocus: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.mood),
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: 'Mood',
                    fillColor: Colors.grey[400],
                    filled: true,
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _noteController,
                  autofocus: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.note),
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: 'Note',
                    fillColor: Colors.grey[400],
                    filled: true,
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(onPressed: () {}, child: Text('Cancel')),
                    RaisedButton(
                      onPressed: () {},
                      child: Text('Save'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
