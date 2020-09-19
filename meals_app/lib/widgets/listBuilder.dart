import 'package:flutter/material.dart';
import 'package:meals_app/export.dart';

class ListBuilderWidget extends StatelessWidget {
  const ListBuilderWidget({@required this.meal, @required this.onPressed});
  final Meal meal;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    String _affordability;
    String _complexity;
    if (meal.affordability == Affordability.Affordable) {
      _affordability = "Affordable";
    } else if (meal.affordability == Affordability.Luxurious) {
      _affordability = "Luxurious";
    } else {
      _affordability = "Pricey";
    }
    if (meal.complexity == Complexity.Hard) {
      _complexity = "Hard";
    } else if (meal.complexity == Complexity.Challenging) {
      _complexity = "Challenging";
    } else if (meal.complexity == Complexity.Medium) {
      _complexity = "Medium";
    } else {
      _complexity = "Simple";
    }

    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      height: 350,
      child: OpenContainer(
        transitionDuration: Duration(milliseconds: 400),
        closedElevation: 0,
        transitionType: ContainerTransitionType.fade,
        closedBuilder: (context, actions) {
          return Card(
            color: kAccentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: actions,
              child: buildMeal(_affordability, _complexity),
            ),
          );
        },
        openBuilder: (context, action) {
          return MealScreen(
            meal: meal,
            affordability: _affordability,
            complexity: _complexity,
            onPressed: onPressed,
          );
        },
      ),
    );
  }

  Column buildMeal(String _affordability, String _complexity) {
    return Column(
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
                  meal.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                height: 70,
                width: 200,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.all(10),
                child: Text(
                  meal.title,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Icon(
                  Icons.timelapse,
                  color: kTextColor,
                ),
                Text('${meal.duration} min')
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.monetization_on,
                  color: kTextColor,
                ),
                Text('$_affordability ')
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.shopping_bag,
                  color: kTextColor,
                ),
                Text('$_complexity')
              ],
            ),
          ],
        ),
      ],
    );
  }
}
