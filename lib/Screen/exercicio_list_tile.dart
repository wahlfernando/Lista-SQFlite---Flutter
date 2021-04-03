
import 'package:academia/Helper/databese_helper.dart';
import 'package:academia/todo.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class ExercicioListTile extends StatefulWidget {

  const ExercicioListTile(this.exercicio, this.treino);
  final DadosExercicios exercicio;
  final String treino;

  @override
  _ExercicioListTileState createState() => _ExercicioListTileState();
}

class _ExercicioListTileState extends State<ExercicioListTile> {

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<DadosExercicios> dadosExerciciosList;
  TextEditingController realizadoController = TextEditingController();
  int count = 0;
  bool xyz = false;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    setState(() {
      updateListView();
    });

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {

        return Card(
          color: !xyz ? Colors.white : Colors.greenAccent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)),
          child: ListTile(
            onTap: (){
              onUpdateDados(this.dadosExerciciosList[position].id, position);
            },
            dense: true,
            title: Row(
              children: [
                Container(
                  child: Image.asset("assets/images/esteira.png", width: 100, height: 100,),
                ),
                Column(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${this.dadosExerciciosList[position].nome}',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        'Séries: ${this.dadosExerciciosList[position].series}',
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.indigo),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        'Repetições: ${this.dadosExerciciosList[position].repeticoes}',
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.indigo),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        'Carga: ${this.dadosExerciciosList[position].carga}',
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.indigo),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        'REALIZADO: ${this.dadosExerciciosList[position].realizado}',
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<DadosExercicios>> todoListFuture = databaseHelper.getExerciciosList(widget.treino);
      todoListFuture.then((todoList) {
        setState(() {
          this.dadosExerciciosList = todoList;
          this.count = todoList.length;
        });
      });
    });
  }

  void onUpdateDados(int id, int position) async {
    if(this.dadosExerciciosList[position].realizado == 'N'){
      try {
        await databaseHelper.updateDsAcademia(
            "UPDATE todo_table SET realizado = 'S' WHERE id = $id");
      } catch (e) {
        _showAlertDialog('Status', 'Ocorreu um erro: $e');
      }
    } else{
      try {
        await databaseHelper.updateDsAcademia(
            "UPDATE todo_table SET realizado = 'N' WHERE id = $id");
      } catch (e) {
        _showAlertDialog('Status', 'Ocorreu um erro: $e');
      }
    }

  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

}
