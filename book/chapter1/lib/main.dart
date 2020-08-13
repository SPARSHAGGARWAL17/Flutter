import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Colors.deepOrangeAccent[100],
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool showFirst = true;
  double height = 100;
  double width = 100;
  _increase() {
    setState(() {
      width = width >= 200 ? 100 : width += 50;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _crossFade() {
    setState(() {
      showFirst = showFirst ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(widget.title),
        bottom: PreferredSize(child: Container(), preferredSize: null),
        actions: [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.more_vert,
            color: Colors.white,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
              onPressed: _increase,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                height: height,
                width: width,
                color: Colors.purple,
              ),
            ),
            AnimatedCrossFade(
              firstChild: Container(
                height: 100,
                width: 200,
                color: Colors.purple[900],
              ),
              secondChild: Container(
                height: 100,
                width: 400,
                color: Colors.purple[900],
              ),
              crossFadeState: showFirst
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: Duration(milliseconds: 200),
            ),
            Positioned.fill(
                child: FlatButton(onPressed: _crossFade, child: Text('Press'))),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
