import 'package:flutter/material.dart';

class DismissWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Flights'),
      ),
      body: DismissList(),
    );
  }
}

class DismissList extends StatefulWidget {
  @override
  _DismissListState createState() => _DismissListState();
}

class _DismissListState extends State<DismissList> {
  List<Trip> trip = [];
  @override
  void initState() {
    super.initState();
    trip
      ..add(Trip(id: 1, name: 'Louis', tripName: 'USA', location: 'USA'))
      ..add(Trip(id: 2, name: 'L', tripName: 'UK', location: 'London'))
      ..add(Trip(id: 3, name: 'L', tripName: 'UK', location: 'London'))
      ..add(Trip(id: 4, name: 'L', tripName: 'UK', location: 'London'))
      ..add(Trip(id: 5, name: 'L', tripName: 'UK', location: 'London'))
      ..add(Trip(id: 6, name: 'L', tripName: 'UK', location: 'London'))
      ..add(Trip(id: 7, name: 'L', tripName: 'UK', location: 'London'))
      ..add(Trip(id: 8, name: 'L', tripName: 'UK', location: 'London'))
      ..add(Trip(id: 9, name: 'L', tripName: 'UK', location: 'London'))
      ..add(Trip(id: 10, name: 'L', tripName: 'UK', location: 'London'))
      ..add(Trip(id: 11, name: 'L', tripName: 'UK', location: 'London'))
      ..add(Trip(id: 12, name: 'L', tripName: 'UK', location: 'London'))
      ..add(Trip(id: 13, name: 'L', tripName: 'UK', location: 'London'))
      ..add(Trip(id: 14, name: 'L', tripName: 'UK', location: 'London'))
      ..add(Trip(id: 15, name: 'L', tripName: 'UK', location: 'London'));
  }

  void _markAsComplete(int index) {
    print('item completed $index');
  }

  void _markAsDelete(int index) {
    print('item Deleted $index');
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: trip.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          background: Container(
            color: Colors.green,
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  Icons.done,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          secondaryBackground: Container(
            color: Colors.red,
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          onDismissed: (DismissDirection direction) {
            direction == DismissDirection.startToEnd
                ? _markAsComplete(index)
                : _markAsDelete(index);
            setState(() {
              trip.removeAt(index);
            });
          },
          key: Key('${trip[index].id}'),
          child: ListTile(
            title: Text('${trip[index].tripName}'),
            leading: Icon(Icons.flight),
            subtitle: Text('${trip[index].location}'),
            trailing: Text('${trip[index].id}'),
          ),
        );
      },
    );
  }
}

class Trip {
  String name;
  int id;
  String tripName;
  String location;
  Trip({this.id, this.location, this.name, this.tripName});
}
