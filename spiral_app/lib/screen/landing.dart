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
  List<Mobile> mobileCard = mobiles.sublist(0, 3);
  @override
  Widget build(BuildContext context) {
    final _mob = Provider.of<Mobile>(context).comparePhone;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: current,
        onTap: (value) async {
          setState(() {
            current = value;
          });
          if (current != 0) {
            var data = await Navigator.of(context).pushNamed(routes[value]);
            print(data);
          }
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
      drawer: Drawer(
        elevation: 10,
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                ),
                padding: EdgeInsets.zero,
                child: Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.bottomLeft,
                  width: double.infinity,
                  child: Text(
                    'Recsy',
                    style: TextStyle(fontSize: 40),
                  ),
                  color: kPrimaryColor,
                ),
              ),
              Container(
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: kPrimaryColor,
                        foregroundColor: Colors.white,
                        child: Text('V/S'),
                      ),
                      title: Text('Compare'),
                      onTap: () {
                        Navigator.of(context).pushNamed(SearchPage.Route,
                            arguments: {
                              'mobiles': _mob,
                              'selected': 0,
                              'compare': true
                            });
                      },
                    ),
                    Divider(
                      color: Colors.grey,
                      endIndent: 30,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.supervisor_account_rounded,
                        size: 40,
                        color: kPrimaryColor,
                      ),
                      title: Text('About Us'),
                    ),
                    Divider(
                      color: Colors.grey,
                      endIndent: 30,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.mail,
                        size: 40,
                        color: kPrimaryColor,
                      ),
                      title: Text('Contact Us'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
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
              displayText: true,
            ),
            CompareWidget(),
            SectionItem(
              title: 'Top Performing',
              list: mobileCard,
              displayText: true,
            ),
            SectionItem(
              title: 'Top Camera',
              list: mobiles.sublist(4, 7),
              displayText: true,
            ),
            SectionItem(
              title: 'Top Rated',
              list: mobiles.sublist(5, 8),
              displayText: true,
            ),
          ],
        ),
      ),
    );
  }
}
