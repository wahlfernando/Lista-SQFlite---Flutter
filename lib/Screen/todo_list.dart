import 'dart:async';
import 'package:academia/Screen/exercicio_list_tile.dart';
import 'package:academia/Screen/cadastro_exercicios.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../Helper/databese_helper.dart';
import '../todo.dart';

class ListaExercicios extends StatefulWidget {

  const ListaExercicios({Key key, this.treino}) : super(key: key);
  final String treino;

  @override
  State<StatefulWidget> createState() {
    return ListaExerciciosState();
  }
}

class ListaExerciciosState extends State<ListaExercicios> {

  @override
  void initState() {
    super.initState();
    updateListView();
  }
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<DadosExercicios> dadosExerciciosList;
  DadosExercicios exercicios;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Exercícios por Treino'),
      ),
      body: ExercicioListTile(exercicios, widget.treino),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToDetail(DadosExercicios('', '', '', '', ''), 'Adicinar Exercício');
        },
        tooltip: 'Adicinar Exercício',
        child: Icon(Icons.add),
      ),
    );
  }




  void navigateToDetail(DadosExercicios dadosExercicios, String title) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CadastroExercicios(dadosExercicios, title);
    }));

  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<DadosExercicios>> todoListFuture = databaseHelper.getExerciciosList(widget.treino);
      todoListFuture.then((todoList) {
        setState(() {
          this.dadosExerciciosList = todoList;
        });
      });
    });
  }


}
