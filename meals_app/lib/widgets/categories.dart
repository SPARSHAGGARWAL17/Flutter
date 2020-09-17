import 'package:flutter/material.dart';
import 'package:meals_app/export.dart';

class CategoriesList extends StatefulWidget {
  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: GridView.builder(
        itemCount: DUMMY_CATEGORIES.length,
        itemBuilder: (_, int index) {
          return OpenContainer(
              transitionDuration: Duration(milliseconds: 400),
              tappable: true,
              closedElevation: 0,
              transitionType: ContainerTransitionType.fade,
              closedBuilder: (context, actions) {
                return InkWell(
                  onTap: actions,
                  child: GridCard(
                    index: index,
                  ),
                );
              },
              openBuilder: (context, actions) {
                return MealPage(
                  imageUrl: DUMMY_PICS[index],
                  title: DUMMY_CATEGORIES[index].title,
                );
              });
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      ),
    );
  }
}
