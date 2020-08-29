import 'dart:convert';

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
  List<Journal> journal2 = [
    Journal(age: 17, name: "Alan"),
    Journal(age: 18, name: "Alan2"),
    Journal(age: 19, name: "Alan3"),
    Journal(age: 20, name: "Alan4"),
    Journal(age: 21, name: "Alan5"),
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
  print(jsonDecode(json)["journals"]);
}
