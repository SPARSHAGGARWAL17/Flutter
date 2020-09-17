import 'package:flutter/material.dart';
import 'package:meals_app/export.dart';

class MealPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  MealPage({this.title, this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true,
              automaticallyImplyLeading: true,
              backgroundColor: Colors.brown,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('$title'),
                background: Image.asset(
                  'assets/images/$imageUrl.jpg',
                  fit: BoxFit.cover,
                  colorBlendMode: BlendMode.multiply,
                  color: Colors.black54,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(DUMMY_MEALS
                  .map((meal) => ListBuilderWidget(
                        meal: meal,
                      ))
                  .toList()),
            )
          ],
        ),
      ),
    );
  }
}
