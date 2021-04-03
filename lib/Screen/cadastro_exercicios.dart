import 'package:academia/commom/textformfield_cadastro.dart';
import 'package:flutter/material.dart';
import '../Helper/databese_helper.dart';
import '../todo.dart';

class CadastroExercicios extends StatefulWidget {
  final String appBarTitle;
  DadosExercicios dadosExercicios;

  CadastroExercicios(this.dadosExercicios, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return CadastroExerciciosState(this.dadosExercicios, this.appBarTitle);
  }
}

class CadastroExerciciosState extends State<CadastroExercicios> {
  DatabaseHelper helper = DatabaseHelper();

  String appBarTitle;
  DadosExercicios dadosExercicios;
  String dropdownValue = 'A';

  TextEditingController nomeController = TextEditingController();
  TextEditingController seriesController = TextEditingController();
  TextEditingController repeticoesController = TextEditingController();
  TextEditingController cargaController = TextEditingController();
  TextEditingController treinoController = TextEditingController();

  CadastroExerciciosState(this.dadosExercicios, this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    // TextStyle textStyle = Theme.of(context).textTheme.title;

    nomeController.text = dadosExercicios.nome;
    seriesController.text = dadosExercicios.series;
    repeticoesController.text = dadosExercicios.repeticoes;
    cargaController.text = dadosExercicios.carga;
    treinoController.text = dadosExercicios.treino;

    return WillPopScope(
      onWillPop: () {
        moveToLastScreen();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                moveToLastScreen();
              }),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextFormFieldsCadastro(
                  texto: 'Nome',
                  controller: nomeController,
                  onChanged: (value) {
                    updateNome();
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: TextFormFieldsCadastro(
                        texto: 'Séries',
                        tipo: TextInputType.number,
                        controller: seriesController,
                        onChanged: (value) {
                          updateSeries();
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: TextFormFieldsCadastro(
                        texto: 'Repetições',
                        tipo: TextInputType.number,
                        controller: repeticoesController,
                        onChanged: (value) {
                          updateRepeticoes();
                        },
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: TextFormFieldsCadastro(
                        texto: 'Carga',
                        tipo: TextInputType.number,
                        controller: cargaController,
                        onChanged: (value) {
                          updateCarga();
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black45,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'Treino:',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                    child: Container(
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 30,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                        //underline: Container(),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                            updateTreino();
                          });
                        },
                        items: <String>['A', 'B', 'C'].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),



              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(

                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text('Salvar',textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          setState(() {
                            onGravarDados();
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text('Excluir',textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          setState(() {
                            _delete();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void updateNome() {
    dadosExercicios.nome = nomeController.text;
  }

  void updateSeries() {
    dadosExercicios.series = seriesController.text;
  }

  void updateRepeticoes() {
    dadosExercicios.repeticoes = repeticoesController.text;
  }

  void updateCarga() {
    dadosExercicios.carga = cargaController.text;
  }

  void updateTreino() {
    dadosExercicios.treino = treinoController.text;
  }

  void onGravarDados() async {
    moveToLastScreen();
    int result;

    try {
      if (dadosExercicios.id != null) {
        // result = await helper.updateTodo(dadosExercicios);
        result = await helper.insereDsAcademia(
            "UPDATE todo_table SET nome = ${nomeController.text}, series = ${seriesController.text}, "
              "repeticoes = ${repeticoesController.text}, carga = ${cargaController.text}  treino = ${dropdownValue} "
              "WHERE _id = ${dadosExercicios.id} ");

      } else {
        result = await helper.insereDsAcademia(
            "insert into todo_table(nome, series, repeticoes, carga, realizado, treino) "
            "values('${nomeController.text}', '${seriesController.text}',"
            " '${repeticoesController.text}', '${cargaController.text}', 'N', '${dropdownValue}' );");
      }

      if (result != 0) {
        _showAlertDialog('Status', 'Salvo com Sucesso!');
      } else {
        _showAlertDialog('Status', 'Ocorreu um erro ao Excluir!!');
      }
    } catch (e) {
      _showAlertDialog('Status', 'Ocorreu um erro: $e');
    }
  }

  void _delete() async {
    moveToLastScreen();

    if (dadosExercicios.id == null) {
      _showAlertDialog('Status', 'Nenhuma informação foi Excluida');
      return;
    }

    int result = await helper.deleteExercicio(dadosExercicios.id);
    if (result != 0) {
      _showAlertDialog('Status', 'Excluído com Sucesso!!');
    } else {
      _showAlertDialog('Status', 'Ocorreu um erro ao Excluir!!');
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
