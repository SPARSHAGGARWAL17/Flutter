import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DatabaseFileRoutines {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/local_file.json');
  }

  Future<String> readJournals() async {
    try {
      final file = await _localFile;
      if (!file.existsSync()) {
        print('File does not exists : ${file.absolute}');
        await writeJournals('{"journals" : []}');
      }
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      print("error journals : $e");
      return "";
    }
  }

  Future<File> writeJournals(String json) async {
    final File file = await _localFile;
    return file.writeAsString('$json');
  }

  Database databaseFromJson(String str) {
    final dataFromJson = jsonDecode(str);
    return Database.fromJson(dataFromJson);
  }

  String databaseToJson(Database data) {
    final dataToJson = data.toJson();
    return jsonEncode(dataToJson);
  }
}

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
  DatabaseFileRoutines dbFile;
  Database _db;
  Future<List<Journal>> _journalList() async {
    await dbFile.readJournals().then((journalJson) {
      _db = dbFile.databaseFromJson(journalJson);
      _db.journal.sort((comp1, comp2) => comp2.age.compareTo(comp1.age));
    });
    return _db.journal;
  }

  String databaseToJson(Database data) {
    var dataToJson = data.toJson();
    return jsonEncode(dataToJson);
  }

  String json = databaseToJson(db);
  // print(json);
  var json2 = jsonDecode(json);
  json2["journals"][0]['name'] = "S";
  print(json2);
}
