import 'package:flutter/cupertino.dart';

import 'package:flutter/foundation.dart';

enum Affordability { Affordable, Pricey, Luxurious }
enum Complexity { Simple, Medium, Challenging, Hard }

class Meal {
  final String id;
  final List categories;
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  final String imageUrl;
  final int duration;
  final List ingredients;
  final List steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
  final bool isFav;
  const Meal({
    this.id,
    this.categories,
    this.title,
    this.affordability,
    this.complexity,
    this.imageUrl,
    this.duration,
    this.ingredients,
    this.steps,
    this.isGlutenFree,
    this.isVegan,
    this.isLactoseFree,
    this.isVegetarian,
    this.isFav,
  });
}

class Category {
  final String id;
  final String title;
  final Color color;
  const Category(
      {@required this.id, @required this.title, @required this.color});
}
