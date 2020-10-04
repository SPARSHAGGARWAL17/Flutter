import 'package:flutter/material.dart';
import 'package:spiral_app/export.dart';

class SectionItem extends StatelessWidget {
  final String title;
  final List<Mobile> list;
  SectionItem({this.title, this.list});
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
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 150,
                        width: 120,
                        margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: Image.asset(
                          list[i].imageUrl,
                          fit: BoxFit.cover,
                        ),
                        decoration: BoxDecoration(
                          color: list[i].color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: 150,
                        width: 120,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.black12, Colors.black87],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        alignment: Alignment.bottomLeft,
                        margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: LimitedBox(child: Text(list[i].name)),
                      )
                    ],
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
