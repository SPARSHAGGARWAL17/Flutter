import '../export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart({this.recentTransaction});

  List<Map<String, Object>> get grouped {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        if (weekday.day == DateTime.parse(recentTransaction[i].date).day &&
            weekday.month == DateTime.parse(recentTransaction[i].date).month &&
            weekday.year == DateTime.parse(recentTransaction[i].date).year) {
          totalSum += recentTransaction[i].amount;
        }
      }
      return {
        "day": DateFormat.E().format(weekday).substring(0, 1),
        "amount": totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpend {
    return grouped.fold(
        0, (sum, element) => sum + (element["amount"] as double));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: grouped.map((value) {
          return Column(
            children: [
              FittedBox(
                child: Text("₹ ${value["amount"].toString()}"),
              ),
              SizedBox(height: 5),
              Container(
                height: 90,
                width: 15,
                child: FractionallySizedBox(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  heightFactor: (value["amount"] as double) / totalSpend,
                ),
              ),
              SizedBox(height: 5),
              FittedBox(
                child: Text("${value["day"].toString()}"),
              )
            ],
          );
        }).toList(),
      ),
    );
  }
}
