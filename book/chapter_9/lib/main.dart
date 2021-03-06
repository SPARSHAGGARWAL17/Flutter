import 'package:chapter_9/bookmark.dart';
import 'package:chapter_9/dismissable.dart';
import 'package:chapter_9/drag.dart';
import 'package:flutter/material.dart';

import 'image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        canvasColor: Colors.purple[200],
      ),
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Text(
                'Travel Agency',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            _buildListTile(context, Icons.flight, 'Flight', () {
              Navigator.of(context).pop();
            }),
            _buildListTile(context, Icons.bookmark, 'BookMark', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => BookMark(),
                ),
              );
            }),
            _buildListTile(context, Icons.drag_handle, 'Gesture', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => DragWidget(),
                ),
              );
            }),
            _buildListTile(context, Icons.image, 'Image', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => ImageWidget(),
                ),
              );
            }),
            _buildListTile(context, Icons.history, 'History', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => DismissWidget(),
                ),
              );
            }),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Travel'),
        leading: IconButton(
          onPressed: () {
            _scaffold.currentState.openDrawer();
          },
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return HeaderWidget(
                index: index,
              );
            } else if (index > 0 && index <= 3) {
              return RowCard(
                index: index,
              );
            } else {
              return RowWidget(
                index: index,
              );
            }
          },
        ),
      ),
    );
  }

  ListTile _buildListTile(
      BuildContext context, IconData icon, String text, Function onpressed) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.purple,
      ),
      title: FlatButton(
        onPressed: onpressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  final int index;
  HeaderWidget({this.index});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        height: 120,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'America',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 40),
            ),
            Text(
              '${index + 1} PM',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class RowCard extends StatelessWidget {
  final int index;
  RowCard({this.index});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.flight,
          color: Colors.purple[600],
        ),
        title: Text(' Flight Number : 5836${index + 1}'),
        subtitle: Text('${(20 - index) ~/ 4} Ratings'),
        trailing: Text(
          '${index * 10}% Full.',
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

class RowWidget extends StatelessWidget {
  final int index;
  RowWidget({this.index});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        print('Index : $index tapped');
      },
      leading: Icon(
        Icons.flight,
        color: Colors.purple[600],
      ),
      title: Text(' Flight Number : 5836${index + 1}'),
      subtitle: Text('${(20 - index) ~/ 4} Ratings'),
      trailing: Text(
        '${index * 10 >= 100 ? 95 : index * 10}% Full.',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
