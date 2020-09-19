import 'package:flutter/material.dart';
import 'package:meals_app/export.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  void _addOrRemove() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return favoriteMeal.isNotEmpty
        ? ListView.builder(
            itemExtent: 350,
            itemCount: favoriteMeal.length,
            itemBuilder: (_, int index) {
              return ListBuilderWidget(
                onPressed: _addOrRemove,
                meal: favoriteMeal[index],
              );
            })
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                size: 80,
                color: Colors.black12,
              ),
              Text(
                'No Favorites Yet.',
                style: TextStyle(fontSize: 30, color: Colors.black12),
              )
            ],
          );
  }
}
