import 'package:flutter/material.dart';
import 'package:myapp/Controller/Controller.dart';
import 'package:myapp/model/refeicao.dart';  // Supondo que o modelo seja definido em 'refeicao.dart'
import 'iphone-8-plus-1.dart';

class TelaMenu3 extends StatefulWidget {
  @override
  _TelaMenuRefeicaoState createState() => _TelaMenuRefeicaoState();
}

class _TelaMenuRefeicaoState extends State<TelaMenu3> {
  final _dao = SeuModeloDao();  // Certifique-se de ter um DAO adequado para a nova classe Refeicao
  TextEditingController _cafeManhaController = TextEditingController();
  TextEditingController _intraAlmocoController = TextEditingController();
  TextEditingController _almocoController = TextEditingController();
  TextEditingController _cafeTardeController = TextEditingController();
  TextEditingController _jantarController = TextEditingController();
  TextEditingController _ceiaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Refeição'),
        backgroundColor: Colors.grey,
        actions: [
          IconButton(
            icon: Icon(Icons.assignment_return_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Scene()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          FutureBuilder<List<Refeicao>>(
            future: _dao.obterTodosRef(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Erro: ${snapshot.error}'));
              } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                return Center(child: Text('A lista é nula ou vazia'));
              } else {
                List<Refeicao> listaDeRefeicoes = snapshot.data!;
                return Column(
                  children: listaDeRefeicoes.map((refeicao) {
                    return _buildRefeicaoCard(refeicao);
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

  Widget _buildRefeicaoCard(Refeicao refeicao) {
    return Card(
      child: ListTile(
        title: Text(refeicao.CafeManha ?? 'Default Text'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Intra Almoço: ${refeicao.IntraAlmoco}'),
            // Adicione mais campos aqui, se necessário
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                _showFormDialog(context, refeicao);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                if (refeicao.id != null) {
                  print("ID da refeição antes da exclusão: ${refeicao.id}");

                  int result = await _dao.excluir(refeicao.id!);

                  print("Resultado da exclusão: $result");

                  if (result > 0) {
                    // Exclusão bem-sucedida
                    setState(() {});
                  } else {
                    print("Erro ao excluir refeição. Nenhum registro foi removido.");
                  }
                } else {
                  print("ID da refeição é nulo!");
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showFormDialog(BuildContext context, [Refeicao? refeicao]) {
    _cafeManhaController.text = refeicao?.CafeManha ?? '';
    _intraAlmocoController.text = refeicao?.IntraAlmoco ?? '';
    _almocoController.text = refeicao?.Almoco ?? '';
    _cafeTardeController.text = refeicao?.CafeTarde ?? '';
    _jantarController.text = refeicao?.Jantar ?? '';
    _ceiaController.text = refeicao?.Ceia ?? '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(refeicao == null ? 'Adicionar Refeição' : 'Editar Refeição'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _cafeManhaController,
                  decoration: InputDecoration(labelText: 'Café da Manhã'),
                ),
                TextField(
                  controller: _intraAlmocoController,
                  decoration: InputDecoration(labelText: 'Intra Almoço'),
                ),
                TextField(
                  controller: _almocoController,
                  decoration: InputDecoration(labelText: 'Almoço'),
                ),
                TextField(
                  controller: _cafeTardeController,
                  decoration: InputDecoration(labelText: 'Café da Tarde'),
                ),
                TextField(
                  controller: _jantarController,
                  decoration: InputDecoration(labelText: 'Jantar'),
                ),
                TextField(
                  controller: _ceiaController,
                  decoration: InputDecoration(labelText: 'Ceia'),
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
                Refeicao novaRefeicao = Refeicao(
                  id: refeicao?.id,
                  CafeManha: _cafeManhaController.text,
                  IntraAlmoco: _intraAlmocoController.text,
                  Almoco: _almocoController.text,
                  CafeTarde: _cafeTardeController.text,
                  Jantar: _jantarController.text,
                  Ceia: _ceiaController.text,
                );

                print("ID da refeição antes de salvar/atualizar: ${novaRefeicao.id}");

                if (novaRefeicao.id == null) {
                  Refeicao refeicaoInserida = await _dao.inserirRef(novaRefeicao);
                  print("ID da refeição inserida: ${refeicaoInserida.id}");
                } else {
                  await _dao.atualizarRef(novaRefeicao);
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
