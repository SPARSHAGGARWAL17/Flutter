import 'package:flutter/material.dart';

class BookMark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.blueGrey,
          forceElevated: true,
          expandedHeight: 250,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Parallax Effect'),
            background: Container(
              color: Colors.purple,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            List.generate(3, (index) {
              return ListTile(
                title: Text('Flight No ${index + 1}'),
                leading: Icon(
                  Icons.flight,
                  color: Colors.purple,
                ),
                subtitle: Text('This flight is bookmarked.'),
              );
            }),
          ),
        ),
        SliverSafeArea(
          sliver: SliverGrid(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.child_friendly,
                      size: 48,
                      color: Colors.amber,
                    ),
                    Divider(),
                    Text('Grid : ${index + 1}'),
                  ],
                ),
              );
            }, childCount: 12),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          ),
        ),
      ],
    );
  }
}
