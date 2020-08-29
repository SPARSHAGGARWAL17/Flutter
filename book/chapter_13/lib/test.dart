import 'dart:convert';
import 'package:intl/intl.dart';

class Database {
  List<Journal> journal;
  Database({this.journal});
  Map<String, dynamic> toJson() => {
        "journals": List<dynamic>.from(
          journal.map(
            (e) => e.toJson(),
          ),
        )
      };
  factory Database.fromJson(Map<String, dynamic> json) {
    return Database(
      journal: List<Journal>.from(
        json["journals"].map((x) => Journal.fromJson(x)),
      ),
    );
  }
}

class Journal {
  String name;
  int age;
  Journal({this.name, this.age});
  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
      };
  factory Journal.fromJson(Map<String, dynamic> json) => Journal(
        name: json["name"],
        age: json["age"],
      );
}

void main() {
  List<Journal> journal = [
    Journal(age: 12, name: "Alan"),
    Journal(age: 13, name: "Alan2"),
    Journal(age: 14, name: "Alan3"),
    Journal(age: 15, name: "Alan4"),
    Journal(age: 16, name: "Alan5"),
  ];
  List<DateTime> dateList = [
    DateTime(2019, 12, 1),
    DateTime(2009, 1, 13),
    DateTime(2019, 2, 16),
    DateTime(2010, 8, 3)
  ];
  Database db = Database(journal: journal);
  // Database db2 = Database(journal: journal2);
  // var json = db.toJson();
  // var json2 = db2.toJson();
  // Database db3 = Database.fromJson(json2);
  // for (var i = 0; i < 5; i++) {
  //   print(db3.journal[i].age);
  // }
  // print(json);
  String databaseToJson(Database data) {
    var dataToJson = data.toJson();
    return jsonEncode(dataToJson);
  }

  String json = databaseToJson(db);
  // print(json);
  var json2 = jsonDecode(json);
  json2["journals"][0]['name'] = "Sparsh";
  // print(json2);
  var date = DateTime(2012, 12, 01);
  print(date);

  for (var i in dateList) {
    print(i.toIso8601String());
  }
  dateList.sort();
  print("sorted list");
  for (var i in dateList) {
    print(i);
  }
}
