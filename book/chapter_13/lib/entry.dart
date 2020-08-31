import 'package:flutter/material.dart';
import 'export.dart';

class EntryPage extends StatelessWidget {
  final bool add;
  final JournalEdit journal;
  final int index;
  EntryPage({this.add, this.index, this.journal});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(add ? "Add Journal" : "Editing Page"),
      ),
      body: Entry(
        add: add,
        journalEdit: journal,
        index: index,
      ),
    );
  }
}

class Entry extends StatefulWidget {
  final bool add;
  final JournalEdit journalEdit;
  final int index;
  Entry({this.add, this.index, this.journalEdit});
  @override
  _EntryState createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  JournalEdit _journalEdit;
  TextEditingController _moodController = TextEditingController();
  TextEditingController _noteController = TextEditingController();
  DateTime currentDate;
  @override
  void initState() {
    super.initState();
    _journalEdit = JournalEdit(
      action: 'Cancel',
      journal: widget.journalEdit.journal,
    );
    if (widget.add) {
      currentDate = DateTime.now();
      _moodController.text = '';
      _noteController.text = '';
    } else {
      currentDate = DateTime.parse(_journalEdit.journal.date);
      _moodController.text = _journalEdit.journal.mood;
      _noteController.text = _journalEdit.journal.note;
    }
  }

  @override
  Widget build(BuildContext context) {
    void write() {
      Journal _journal = Journal(
        date: currentDate.toString(),
        note: _noteController.text,
        mood: _moodController.text,
        id: Random().nextInt(99999).toString(),
      );
      if (_noteController.text == "") {
        Navigator.pop(context);
      } else {
        _journalEdit.journal = _journal;
        Navigator.pop(context, _journalEdit);
      }
    }

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
            width: 300,
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
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    icon: Icon(Icons.mood),
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: 'Mood',
                    fillColor: Colors.purple[100],
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
                  textInputAction: TextInputAction.done,
                  onEditingComplete: () {
                    print(_noteController.text);
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.note),
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: 'Note',
                    fillColor: Colors.purple[100],
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
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context, _journalEdit);
                        },
                        child: Text('Cancel')),
                    RaisedButton(
                      onPressed: () {
                        _journalEdit.action = "Save";
                        write();
                      },
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
