// database/dao.dart
import 'package:myapp/DataBase/DataBse.dart';
import 'package:myapp/model/treino.dart';
import 'package:sqflite/sqflite.dart';

class SeuModeloDao {
  Future<int> inserir(Treino modelo) async {
    final Database db = await DatabaseHelper().database;
    return await db.insert('seu_tabela', modelo.toMap());
  }

  Future<List<Treino>> obterTodos() async {
    final Database db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> maps = await db.query('seu_tabela');
    return List.generate(maps.length, (i) {
      return Treino(
      perna: maps[i]['perna'],
      costas: maps[i]['costas'],
      biceps: maps[i]['biceps'],
      triceps: maps[i] ['triceps'],
      ombro: maps[i]['ombro'],
      gluteos: maps[i] ['gluteos'],
      peito: maps[i]['peito'],
      );
    });
  }

  Future<int> atualizar(Treino modelo) async {
    final Database db = await DatabaseHelper().database;
    return await db.update('seu_tabela', modelo.toMap(),
        where: 'id = ?', whereArgs: [modelo.id]);
  }

  Future<int> excluir(int id) async {
    final Database db = await DatabaseHelper().database;
    return await db.delete('seu_tabela', where: 'id = ?', whereArgs: [id]);
  }
}
