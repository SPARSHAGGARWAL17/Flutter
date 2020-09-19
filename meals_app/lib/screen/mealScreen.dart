import 'package:meals_app/export.dart';
import 'package:flutter/material.dart';

class MealScreen extends StatefulWidget {
  final Meal meal;
  final String affordability;
  final String complexity;
  final Function onPressed;

  MealScreen({this.meal, this.affordability, this.complexity, this.onPressed});
  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  List<Meal> _currentMeal;
  bool isFav;
  @override
  void didChangeDependencies() {
    isFav = favoriteMeal.contains(widget.meal);
    _currentMeal = [widget.meal];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kAccentColor,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            automaticallyImplyLeading: true,
            backgroundColor: Colors.brown,
            expandedHeight: 300,
            actions: [
              IconButton(
                icon: Icon(
                  isFav ? Icons.star : Icons.star_border,
                  size: 40,
                ),
                onPressed: () {
                  setState(() {
                    isFav = !isFav;
                    if (isFav)
                      favoriteMeal.add(widget.meal);
                    else if (!isFav) {
                      favoriteMeal.remove(widget.meal);
                    }
                    widget.onPressed();
                  });
                },
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text('${widget.meal.title}'),
              background: Image.network(
                '${widget.meal.imageUrl}',
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.multiply,
                color: Colors.black54,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              _currentMeal.map((meal) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.timelapse,
                            color: kTextColor,
                            size: 50,
                          ),
                          Text(
                            '${meal.duration} min',
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.monetization_on,
                            color: kTextColor,
                            size: 50,
                          ),
                          Text(
                            '${widget.affordability}',
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.shopping_bag,
                            color: kTextColor,
                            size: 50,
                          ),
                          Text(
                            '${widget.complexity}',
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Steps:",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: meal.steps.map((text) {
                            return LimitedBox(
                              child: Text(
                                '* $text',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
