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
        title: Text('CRUD em Flutter'),
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
          // Adicionando um espaço entre a lista e o botão flutuante
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialog(context);
        },
        child: Icon(Icons.add),
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
              onPressed: () {
                _dao.excluir(treino.id!);
                setState(() {});
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
                  controller: _costasController,
                  decoration: InputDecoration(labelText: 'Nome'),
                ),
                TextField(
                  controller: _pernaController,
                  decoration: InputDecoration(labelText: 'Perna'),
                ),
                TextField(
                  controller: _bicepsController,
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
              onPressed: () {
                Treino novoTreino = Treino(
                  costas: _costasController.text,
                  perna: _pernaController.text,
                  biceps: _bicepsController.text,
                  peito: _peitoController.text,
                  gluteos: _gluteosController.text,
                  ombro: _ombroController.text,
                  triceps: _tricepsController.text,
                );

                if (treino == null) {
                  _dao.inserir(novoTreino);
                } else {
                  novoTreino.id = treino.id;
                  _dao.atualizar(novoTreino);
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