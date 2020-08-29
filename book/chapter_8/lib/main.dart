import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        canvasColor: Colors.purple[100],
      ),
    );
  }
}

// ignore: must_be_immutable
class LandingPage extends StatefulWidget {
  String text;
  LandingPage({this.text});
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      drawer: DrawerApp(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.purple[600],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: null, icon: Icon(Icons.airplanemode_active)),
            IconButton(onPressed: null, icon: Icon(Icons.airplanemode_active)),
            // IconButton(onPressed: null, icon: Icon(Icons.airplanemode_active)),
          ],
        ),
        shape: CircularNotchedRectangle(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('First Page'),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            _scaffold.currentState.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
            onPressed: () async {
              var val = await Navigator.push(
                context,
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (BuildContext context) => GratitudePage(),
                ),
              );
              setState(() {
                if (val != null) {
                  widget.text = val;
                }
              });
            },
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Hero(
                tag: 'format_paint',
                child: Icon(
                  Icons.format_paint,
                  size: 50,
                ),
              ),
              Text(
                'Gratitude For :  ${widget.text == null ? "..." : widget.text}',
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GratitudePage extends StatefulWidget {
  @override
  _GratitudePageState createState() => _GratitudePageState();
}

class _GratitudePageState extends State<GratitudePage>
    with TickerProviderStateMixin {
  int radio = 1;
  int value;
  int indexValue = 0;
  bool bottomBar = false;
  TabController _controller;
  void _tabChanger() {
    if (_controller.indexIsChanging) {
      print("Index : ${_controller.index}");
    }
  }

  List<Value> gratitude = [
    Value(text: "Coffee", val: 1),
    Value(text: "Food", val: 2),
    Value(text: "Meeting", val: 3),
  ];
  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(_tabChanger);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBar
          ? BottomNavigationBar(
              currentIndex: indexValue,
              onTap: (value) {
                setState(() {
                  indexValue = value;
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), title: Text('Home')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), title: Text('Home')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), title: Text('Home')),
              ],
            )
          : SafeArea(
              child: TabBar(
                  labelColor: Colors.purple[600],
                  unselectedLabelColor: Colors.purple[300],
                  controller: _controller,
                  tabs: [
                  Tab(
                    icon: Icon(Icons.cake),
                    text: 'Birthday',
                  ),
                  Tab(
                    icon: Icon(Icons.cake),
                    text: 'Birthday',
                  ),
                  Tab(
                    icon: Icon(Icons.cake),
                    text: 'Birthday',
                  )
                ])),
      appBar: AppBar(
        title: Text('Gratitude Page'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context, gratitude[radio - 1].text);
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Hero(
              transitionOnUserGestures: true,
              tag: 'format_paint',
              child: Icon(
                Icons.format_paint,
                size: 220,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: gratitude.map((Value val) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${val.text}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Radio(
                        value: val.val,
                        groupValue: radio,
                        onChanged: (index) {
                          setState(() {
                            radio = index;
                            // print(val.text);
                            print(gratitude[radio - 1].text);
                          });
                        })
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class Value {
  final String text;
  final int val;
  Value({this.text, this.val});
}

class DrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Sparsh'),
            accountEmail: Text('sparsh@gmail.com'),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.black,
            ),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
