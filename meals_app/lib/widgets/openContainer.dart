import 'package:flutter/material.dart';
import 'package:meals_app/export.dart';

class MealPage extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String categories;
  final filter;
  MealPage({this.title, this.imageUrl, this.categories, this.filter});

  @override
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  List<Meal> _currentMeal;
  List<Meal> _filterMeal;
  @override
  void didChangeDependencies() {
    _filterMeal = DUMMY_MEALS.where((meal) {
      if (widget.filter['Gluten'] && !meal.isGlutenFree) {
        return false;
      }
      if (widget.filter['Lactose'] && !meal.isLactoseFree) {
        return false;
      }
      if (widget.filter['Vegan'] && !meal.isVegan) {
        return false;
      }
      if (widget.filter['Vegetarian'] && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();

    _currentMeal = _filterMeal.where((meals) {
      return meals.categories.contains(widget.categories);
    }).toList();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            automaticallyImplyLeading: true,
            backgroundColor: Colors.brown,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('${widget.title}'),
              background: Image.asset(
                'assets/images/${widget.imageUrl}.jpg',
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.multiply,
                color: Colors.black54,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(_currentMeal
                .map((meal) => ListBuilderWidget(
                      onPressed: () {},
                      meal: meal,
                    ))
                .toList()),
          )
        ],
      ),
    );
  }
}
