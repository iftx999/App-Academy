import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  Database? _database;

  Future<Database> get database async {
    if (!(_database is Database)) {
      _database = await initDatabase();
    }
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'seu_banco.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE seu_tabela(
            id INTEGER PRIMARY KEY DEFAULT,
            perna TEXT,  biceps TEXT, triceps TEXT, gluteos TEXT, costas TEXT, ombro TEXT, peito TEXT
          )
        ''');
      },
    );

    return _database!;
  }
}
