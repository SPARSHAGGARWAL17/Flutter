import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Screens(),
    );
  }
}

class Screens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Event Planner'),
          backgroundColor: Colors.black,
          bottom: TabBar(
            indicatorColor: Colors.grey,
            tabs: [
              Tab(
                text: 'Event',
              ),
              Tab(
                text: 'Band',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BuildScreen(
              title: 'Event',
            ),
            BuildScreen(
              title: 'Band',
            ),
          ],
        ),
      ),
    );
  }
}

class BuildScreen extends StatelessWidget {
  const BuildScreen({
    this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/${title.toLowerCase()}-1.jpg',
          fit: BoxFit.fitHeight,
          color: Colors.black87,
          colorBlendMode: BlendMode.multiply,
        ),
        Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: LimitedBox(
                  child: Text('Register\nYour $title..',
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .copyWith(color: Colors.white, fontSize: 80)),
                ),
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                onPressed: () {},
                child: Text('Register Here'),
                shape: StadiumBorder(),
              ),
            ])
      ],
    );
  }
}
