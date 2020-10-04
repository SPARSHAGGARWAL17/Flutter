import 'package:flutter/material.dart';
import 'package:spiral_app/export.dart';

class CompareWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _card = mobiles;
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Compare',
            style: bodyText(context),
          ),
          SizedBox(
            height: 10,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 70,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (var i = 0; i < 2; i++)
                      LimitedBox(
                        maxWidth: 95,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            _card[i].name,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                  ],
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kAccentColor,
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(SearchPage.Route);
                },
                child: CircleAvatar(
                  child: Text(
                    'V/S',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  radius: 45,
                  backgroundColor: kPrimaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}