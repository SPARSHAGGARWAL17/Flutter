import 'package:flutter/material.dart';
import 'package:meals_app/export.dart';
import 'package:meals_app/widgets/categories.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Map<String, bool> filters = {
    "Vegan": false,
    "Gluten": false,
    "Vegetarian": false,
    "Lactose": false,
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(
                  Icons.settings,
                  size: 30,
                ),
                onPressed: () async {
                  var f = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => FilterPage(
                        filters: filters,
                      ),
                    ),
                  );
                  print(f);
                })
          ],
          toolbarHeight: MediaQuery.of(context).size.height * 0.2,
          title: Text(
            'Recipe',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          bottom: TabBar(
            indicatorColor: kTextColor,
            indicatorWeight: 3,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(
                text: 'Categories',
              ),
              Tab(
                text: 'Favorites',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoriesList(filter: filters),
            FavoritePage(),
          ],
        ),
      ),
    );
  }
}
