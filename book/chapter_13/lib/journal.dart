import 'package:flutter/material.dart';
import 'export.dart';
import 'dart:async';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  DatabaseFileRoutines dbFileRoutine = DatabaseFileRoutines();
  Database _database = Database(journal: []);
  Future<List<Journal>> _loadJournal() async {
    dbFileRoutine.readJournals().then((journalJson) {
      _database = dbFileRoutine.databaseFromJson(journalJson);
      _database.journal.sort();
    });
    return _database.journal;
  }

  Widget buildListSeparated(AsyncSnapshot snapshot) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          String _subtitle =
              snapshot.data[index].mood + "\n" + snapshot.data[index].note;
          return Dismissible(
            key: Key(snapshot.data[index].id),
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 16),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 16),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: ListTile(
                leading: Column(
                  children: [
                    Text(
                      DateFormat.d()
                          .format(DateTime.parse(snapshot.data[index].date)),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(DateFormat.E()
                        .format(DateTime.parse(snapshot.data[index].date))),
                  ],
                ),
                title: Text(
                  DateFormat.yMMMEd()
                      .format(DateTime.parse(snapshot.data[index].date)),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(_subtitle),
              ),
            ),
            onDismissed: (direction) {
              setState(() {
                _database.journal.removeAt(index);
                DatabaseFileRoutines()
                    .writeJournals(dbFileRoutine.databaseToJson(_database));
              });
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.black,
          );
        },
        itemCount: snapshot.data.length);
  }

  @override
  Widget build(BuildContext context) {
    void _addOrEditJournal(bool add, int index, Journal journal) async {
      JournalEdit _journalEdit = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => EntryPage(
            add: true,
            index: index,
            journal: JournalEdit(),
          ),
        ),
      );
      if (_journalEdit != null) {
        switch (_journalEdit.action) {
          case "Save":
            {
              if (add) {
                setState(() {
                  _database.journal.add(_journalEdit.journal);
                });
              } else {
                setState(() {
                  _database.journal[index] = _journalEdit.journal;
                });
              }
              DatabaseFileRoutines().writeJournals(
                dbFileRoutine.databaseToJson(_database),
              );
              break;
            }
          case "Cancel":
            break;
          default:
            break;
        }
      }
    }

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(padding: EdgeInsets.all(30)),
        color: Colors.purple[500],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // dbFileRoutine.readJournals();
          _addOrEditJournal(true, -1, Journal());
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Journal App'),
      ),
      body: SafeArea(
        child: FutureBuilder(
          initialData: [],
          future: _loadJournal(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return !snapshot.hasData
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : buildListSeparated(snapshot);
          },
        ),
      ),
    );
  }
}
