import 'package:flutter/material.dart';
import 'package:myapp/Controller/Controller.dart';
import 'package:myapp/model/treino.dart';

class TelaMenu4 extends StatefulWidget {
  @override
  _TelaMenu4State createState() => _TelaMenu4State();
}

class _TelaMenu4State extends State<TelaMenu4> {
  final _dao = SeuModeloDao();
  TextEditingController _costasController = TextEditingController();
  TextEditingController _pernaController = TextEditingController();
  TextEditingController _bicepsController = TextEditingController();
  TextEditingController _tricepsController = TextEditingController();
  TextEditingController _gluteosController = TextEditingController();
  TextEditingController _ombroController = TextEditingController();
  TextEditingController _peitoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de treino'),
        backgroundColor: Colors.grey,
       ),
      body: ListView(
        children: [
          FutureBuilder<List<Treino>>(
            future: _dao.obterTodos(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Erro: ${snapshot.error}'));
              } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                return Center(child: Text('A lista é nula ou vazia'));
              } else {
                List<Treino> listaDeModelos = snapshot.data!;
                return Column(
                  children: listaDeModelos.map((treino) {
                    return _buildTreinoCard(treino);
                  }).toList(),
                );
              }
            },
          ),
          SizedBox(height: 16.0),
          // Outros widgets podem ser adicionados abaixo do FutureBuilder
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialog(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey,

      ),
    );
  }

  Widget _buildTreinoCard(Treino treino) {
    return Card(
      child: ListTile(
        title: Text(treino.costas ?? 'Default Text'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Perna: ${treino.perna}'),
            // Adicione mais campos aqui, se necessário
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                _showFormDialog(context, treino);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                if (treino.id != null) {
                  print("ID do treino antes da exclusão: ${treino.id}");

                  int result = await _dao.excluir(treino.id!);

                  print("Resultado da exclusão: $result");

                  if (result > 0) {
                    // Exclusão bem-sucedida
                    setState(() {});
                  } else {
                    print("Erro ao excluir treino. Nenhum registro foi removido.");
                  }
                } else {
                  print("ID do treino é nulo!");
                }
              },

            ),
          ],
        ),
      ),
    );
  }

  void _showFormDialog(BuildContext context, [Treino? treino]) {
    _costasController.text = treino?.costas ?? '';
    _pernaController.text = treino?.perna ?? '';
    _bicepsController.text = treino?.biceps ?? '';
    _tricepsController.text = treino?.triceps ?? '';
    _gluteosController.text = treino?.gluteos ?? '';
    _ombroController.text = treino?.ombro ?? '';
    _peitoController.text = treino?.peito ?? '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(treino == null ? 'Adicionar Treino' : 'Editar Treino'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                TextField(
                  controller: _pernaController,
                  decoration: InputDecoration(labelText: 'Perna'),
                ),
                TextField(
                  controller: _tricepsController,
                  decoration: InputDecoration(labelText: 'Triceps'),
                ),
                TextField(
                  controller: _costasController,
                  decoration: InputDecoration(labelText: 'Costas'),
                ),
                TextField(
                  controller: _bicepsController,
                  decoration: InputDecoration(labelText: 'Biceps'),
                ),
                TextField(
                  controller: _ombroController,
                  decoration: InputDecoration(labelText: 'Ombro'),
                ),
                TextField(
                  controller: _gluteosController,
                  decoration: InputDecoration(labelText: 'Gluteos'),
                ),
                TextField(
                  controller: _peitoController,
                  decoration: InputDecoration(labelText: 'Peito'),
                ),
                // Adicione mais campos aqui, se necessário
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                Treino novoTreino = Treino(
                  costas: _costasController.text,
                  perna: _pernaController.text,
                  biceps: _bicepsController.text,
                  peito: _peitoController.text,
                  gluteos: _gluteosController.text,
                  ombro: _ombroController.text,
                  triceps: _tricepsController.text,
                );

                print("ID do treino antes de salvar/atualizar: ${novoTreino.id}");

                if (novoTreino.id == null) {
                  // Se o ID for nulo, significa que é um novo treino
                  Treino treinoInserido = await _dao.inserir(novoTreino);
                  print("ID do treino inserido: ${treinoInserido.id}");
                  // Atualiza o ID no objeto novoTreino
                } else {
                  await _dao.atualizar(novoTreino);
                }

                setState(() {});
                Navigator.pop(context);
              },
              child: Text('Salvar'),
            ),

          ],
        );
      },
    );
  }
}