import 'package:flutter/material.dart';
import 'package:spiral_app/export.dart';

class LandingPage extends StatefulWidget {
  static const LandingRoute = '/';
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<String> routes = [
    LandingPage.LandingRoute,
    FilterPage.Route,
    LandingPage.LandingRoute,
  ];
  int current = 0;
  var mobileCard = mobiles.sublist(0, 3);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: current,
        onTap: (value) async {
          setState(() {
            current = value;
          });
          var data = await Navigator.of(context).pushNamed(routes[value]);
          print(data);
          setState(() {
            current = 0;
          });
        },
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kAccentColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'User',
          ),
        ],
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text(
          'Recsy',
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontWeight: FontWeight.w900,
            fontSize: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            BannerList(),
            SectionItem(
              title: 'You May Also Like',
              list: mobileCard,
            ),
            CompareWidget(),
            SectionItem(
              title: 'Top Performing',
              list: mobileCard,
            ),
            SectionItem(
              title: 'Top Camera',
              list: mobiles.sublist(4, 7),
            ),
            SectionItem(
              title: 'Top Rated',
              list: mobiles.sublist(5, 8),
            ),
          ],
        ),
      ),
    );
  }
}
