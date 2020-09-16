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
    return Container(
      padding: EdgeInsets.all(30),
      child: ListView.builder(
          itemExtent: 350,
          itemCount: favMeal.length,
          itemBuilder: (_, int index) {
            return InkWell(
              child: Card(
                color: kAccentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 250,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            child: Image.network(
                              favMeal[index].imageUrl,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        FittedBox()
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
