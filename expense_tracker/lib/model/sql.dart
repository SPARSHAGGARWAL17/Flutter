import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static Future<Database> database() async {
    final path = await sql.getDatabasesPath();
    return sql.openDatabase(
      join(path, 'database'),
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE transactions(id TEXT PRIMARY KEY,date TEXT,title TEXT,amount float)");
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    Database db = await database();
    db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, Object>>> getData(String table) async {
    Database db = await DBHelper.database();
    return db.query(table);
  }

  static Future<void> delete(String id) async {
    Database db = await database();
    db.delete('transactions', where: 'id == ?', whereArgs: [id]);
  }
}
