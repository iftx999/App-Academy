// database/dao.dart
import 'package:myapp/DataBase/DataBse.dart';
import 'package:myapp/model/treino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:myapp/model/refeicao.dart';


class SeuModeloDao {
  late Future<Database> database; // Alteração: Declare como Future<Database>

  SeuModeloDao() {
    _initDatabase(); // Alteração: Chame _initDatabase no construtor
  }

  Future<void> _initDatabase() async {
    DatabaseHelper helper = DatabaseHelper(); // Alteração: Crie uma instância da classe que contém initDatabase
    database = helper
        .initDatabase(); // Alteração: Chame initDatabase na instância criada
  }


  Future<Treino> inserir(Treino treino) async {
    final Database db = await database;
    Map<String, dynamic> data = {
      'perna': treino.perna,
      'costas': treino.costas,
      'biceps': treino.biceps,
      'triceps': treino.triceps,
      'ombro': treino.ombro,
      'gluteos': treino.gluteos,
      'peito': treino.peito,
    };
    int idInserido = await db.insert('seu_tabela', data);

    // Atualizar o objeto Treino com o ID gerado
    treino.id = idInserido;

    return treino;
  }




  Future<List<Treino>> obterTodos() async {
    final Database db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> maps = await db.query('seu_tabela');
    return List.generate(maps.length, (i) {
      return Treino(
        id: maps[i]['id'],
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
    int result = await db.delete('seu_tabela', where: 'id = ?', whereArgs: [id]);
    return result;
  }
  Future<Refeicao> inserirRef(Refeicao refeicao) async {
    final Database db = await database;
    Map<String, dynamic> data = {
      'cafeManha': refeicao.CafeManha,
      'intraAlmoco': refeicao.IntraAlmoco,
      'almoco': refeicao.Almoco,
      'cafeTarde': refeicao.CafeTarde,
      'jantar': refeicao.Jantar,
      'ceia': refeicao.Ceia,
    };
    int idInserido = await db.insert('tabela_refeicoes', data);

    // Atualizar o objeto Treino com o ID gerado
    refeicao.id = idInserido;

    return refeicao;
  }




  Future<List<Refeicao>> obterTodosRef() async {
    final Database db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> maps = await db.query('tabela_refeicoes');
    return List.generate(maps.length, (i) {
      return Refeicao(
          id: maps[i]['id'],
          CafeManha: maps[i]['cafeManha'],
          IntraAlmoco: maps[i]['intraAlmoco'],
          Almoco: maps[i]['almoco'],
          CafeTarde: maps[i]['cafeTarde'],
          Jantar: maps[i]['jantar'],
          Ceia: maps[i]['ceia'],

      );
    });
  }

  Future<int> atualizarRef(Refeicao modelo) async {
    final Database db = await DatabaseHelper().database;
    return await db.update('tabela_refeicoes', modelo.toMap(),
        where: 'id = ?', whereArgs: [modelo.id]);
  }

  Future<int> excluirRef(int id) async {
    final Database db = await DatabaseHelper().database;
    int result = await db.delete('tabela_refeicoes', where: 'id = ?', whereArgs: [id]);
    return result;
  }

}
