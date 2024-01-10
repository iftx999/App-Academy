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
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE seu_tabela(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            perna TEXT, biceps TEXT, triceps TEXT, gluteos TEXT, costas TEXT, ombro TEXT, peito TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE tabela_refeicoes(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT,
            ingredientes TEXT,
            horario TEXT
          )
        ''');
      },
    );

    return _database!;
  }
}

