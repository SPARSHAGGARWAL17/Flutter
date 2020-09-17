import 'package:flutter/material.dart';
import 'package:meals_app/export.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<Meal> favMeal;
  @override
  void initState() {
    favMeal = DUMMY_MEALS.where((meal) => meal.isFav != true).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemExtent: 350,
        itemCount: favMeal.length,
        itemBuilder: (_, int index) {
          return ListBuilderWidget(
            meal: favMeal[index],
          );
        });
  }
}
