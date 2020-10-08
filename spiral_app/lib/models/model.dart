import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spiral_app/export.dart';

class Mobile with ChangeNotifier {
  final String id;
  final String imageUrl;
  final Color color;
  final String name;
  final Map<String, Object> specs;
  bool isFav;

  Mobile(
      {this.id, this.imageUrl, this.color, this.name, this.specs, this.isFav});

  void changeFav(String id) {
    mobiles.forEach((element) {
      if (element.id == id) {
        element.isFav = !element.isFav;
      }
    });
    notifyListeners();
  }

  Map<String, List> filterList = {
    'Are You Fine With Chinese Smartphones?': ['Yes', 'No'],
    'Budget': [
      'Below ₹10k',
      '₹10k-₹12k',
      '₹12k-₹15k',
      '₹15k-₹20k',
      '₹20k-₹25k',
      '₹25k-₹30k',
      '₹30k-₹40k',
      '₹40k-₹50k',
      '₹50-₹70k',
      '₹70k-₹100k',
      '₹100k-₹120k',
      'Above ₹120k'
    ],
    'First Priority Feature : ': ['Performance', 'Camera', 'Battery'],
    'Second Priority Feature : ': ['Performance', 'Camera', 'Battery'],
    'Display': ['Amazing', 'Great'],
    'Charging': ['Fast', 'Super Fast'],
  };
  Map<String, List> filterListResult = {
    'Are You Fine With Chinese Smartphones?': [],
    'Budget': [],
    'First Priority Feature : ': [],
    'Second Priority Feature : ': [],
    'Display': [],
    'Charging': [],
  };
  List<Mobile> _compareList = [];
  List<Mobile> get comparePhone {
    mobiles.shuffle();
    return [...mobiles.sublist(0, 2)];
  }

  void randomCompare() {
    int val = Random().nextInt(mobiles.length);
    bool added = false;
    while (added) {
      print("running");
      if (!_compareList.contains(mobiles[val])) _compareList.add(mobiles[val]);
      if (_compareList.length == 2) added = false;
    }
  }
}
