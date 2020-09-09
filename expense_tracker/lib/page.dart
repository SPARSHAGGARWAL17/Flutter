import 'package:flutter/material.dart';
import 'export.dart';

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GlobalKey<ScaffoldState> _scaffold = GlobalKey();
  DateTime initialDate;
  @override
  void initState() {
    initialDate = DateTime.now();
    noteController.text = "";
    amountController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _datePicker() async {
      DateTime _pickedDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime.now().subtract(Duration(days: 365)),
        lastDate: DateTime.now().add(
          Duration(days: 365),
        ),
      );
      setState(() {
        if (_pickedDate != null) {
          print(_pickedDate);
          initialDate = _pickedDate;
          _scaffold.currentState
              .showSnackBar(SnackBar(content: Text("Contact Saved")));
        } else if (_pickedDate == null) {
          Navigator.of(context).pop();
        }
      });
    }

    bottomSheet(BuildContext context) {
      return showModalBottomSheet(
        isScrollControlled: true,
        enableDrag: false,
        context: context,
        backgroundColor: Color.fromRGBO(0, 0, 0, 0),
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Enter Details",
                          style: Theme.of(context).textTheme.headline5),
                      Row(
                        children: [
                          Text(DateFormat.yMMMEd()
                              .format(DateTime.parse("$initialDate"))),
                          IconButton(
                            icon: Icon(Icons.calendar_today),
                            onPressed: () {
                              _datePicker();
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  TextFormSheet(
                    "Note",
                  ),
                  TextFormSheet(
                    "Amount",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ButtonSheet("Cancel"),
                      ButtonSheet("Save"),
                    ],
                  )
                ],
              ),
              height: 300,
              width: double.infinity,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10, spreadRadius: 8, color: Colors.grey[700]),
                ],
                color: Theme.of(context).cardColor,
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      key: _scaffold,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(noteController.text);
          bottomSheet(context);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Expense Tracker'),
        actions: [
          IconButton(
            padding: EdgeInsets.all(10),
            icon: Icon(Icons.add),
            onPressed: () {
              bottomSheet(context);
            },
          )
        ],
      ),
      body: TrackerPage(),
    );
  }
}
