import 'package:flutter/material.dart';
import 'package:meals_app/export.dart';

class GridCard extends StatelessWidget {
  const GridCard({
    this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/${DUMMY_PICS[index]}.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.black54, borderRadius: BorderRadius.circular(20)),
            child: Text(
              DUMMY_CATEGORIES[index].title,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
