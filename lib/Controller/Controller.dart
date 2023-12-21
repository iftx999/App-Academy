// database/dao.dart
import 'package:myapp/DataBase/DataBse.dart';
import 'package:myapp/model/treino.dart';
import 'package:sqflite/sqflite.dart';

class SeuModeloDao {
  Future<int> inserir(Treino modelo) async {
    final Database db = await DatabaseHelper().database;
    String query = '''
    INSERT INTO seu_tabela (perna, biceps, triceps, gluteos, costas, ombro, peito)
    VALUES (?, ?, ?, ?, ?, ?, ?)
  ''';

    List<dynamic> values = [
      modelo.perna,
      modelo.biceps,
      modelo.triceps,
      modelo.gluteos,
      modelo.costas,
      modelo.ombro,
      modelo.peito,
    ];

    int idInserido = await db.rawInsert(query, values);
    return idInserido;
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
    try {
      final Database db = await DatabaseHelper().database;
      int result = await db.delete(
          'seu_tabela', where: 'id = ?', whereArgs: [id]);
      return result; // Retorna o número de registros excluídos (0 ou 1)
    } catch (e) {
      print("Erro ao excluir treino: $e");
      return -1; // Ou algum valor que indique um erro
    }
  }

}
