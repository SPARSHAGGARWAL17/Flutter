import 'package:flutter/material.dart';
import 'package:spiral_app/export.dart';

class SectionItem extends StatelessWidget {
  final String title;
  final List<Mobile> list;
  final bool displayText;
  SectionItem({this.title, this.list, this.displayText});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontSize: 20, fontFamily: 'Segoe UI'),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var i = 0; i < list.length; i++)
                  SingleSectionItem(item: list[i], displayText: displayText),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SingleSectionItem extends StatelessWidget {
  const SingleSectionItem({
    @required this.item,
    @required this.displayText,
    this.height = 150,
    this.width = 120,
  });

  final Mobile item;
  final bool displayText;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          height: height,
          width: width,
          margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: Image.asset(
            item.imageUrl,
            fit: BoxFit.cover,
          ),
          decoration: BoxDecoration(
            color: item.color,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          height: height,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black12, Colors.black87],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          alignment: Alignment.bottomLeft,
          margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: LimitedBox(
              child: Text(
            displayText ? item.name : '',
            style: TextStyle(fontSize: 18),
          )),
        )
      ],
    );
  }
}
