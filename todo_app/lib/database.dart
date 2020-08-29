import 'package:sqflite/sqflite.dart';

final columnTitle = 'title';
final columnDone = 'done';
final columnId = '';

class TodoData {
  int id;
  String taskName;
  String description;
  String time;
  bool completed;
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnTitle: taskName,
      columnDone: completed == true ? 1 : 0
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  TodoData();
  TodoData.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    taskName = map[columnTitle];
    completed = map[columnDone] == 1;
  }
}

class TodoProvider {
  Database db;
  Future open(String path) async {
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE todo (
            Task text not null,
            Description text not null,
            Time text not null,
            Done integer not null
          );
          ''');
      },
    );
  }
}
