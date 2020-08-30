import 'package:flutter/material.dart';
import 'export.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String _journal;
  DatabaseFileRoutines dbFileRoutine = DatabaseFileRoutines();
  Database _database;
  Future<List<Journal>> _loadJournal() async {
    await dbFileRoutine.readJournals().then((journalJson) {
      _database = dbFileRoutine.databaseFromJson(journalJson);
      _database.journal
          .sort((comp1, comp2) => comp2.date.compareTo(comp1.date));
      return _database.journal;
    });
  }

  Widget buildListSeparated(AsyncSnapshot snapshot) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          String _title = DateFormat.yMMMEd()
              .format(DateTime.parse(snapshot.data[index].date));
          String _subtitle =
              snapshot.data[index].mood + "\n" + snapshot.data[index].note;
          return Dismissible(
            key: snapshot.data[index].id,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(left: 16),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(left: 16),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: ListTile(
              title: Column(
                children: [
                  Text(DateFormat.d()
                      .format(DateTime.parse(snapshot.data[index].date))),
                  Text(DateFormat.E()
                      .format(DateTime.parse(snapshot.data[index].date))),
                ],
              ),
              subtitle: Text(_subtitle),
            ),
            onDismissed: (direction) {
              setState(() {
                _database.journal.removeAt(index);
              });
              DatabaseFileRoutines()
                  .writeJournals(dbFileRoutine.databaseToJson(_database));
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
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(padding: EdgeInsets.all(30)),
        color: Colors.grey[500],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => EntryPage(),
            ),
          );
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
