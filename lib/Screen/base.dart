import 'package:academia/Screen/todo_list.dart';
import 'package:academia/commom/button_dias.dart';
import 'package:academia/testes/api_testes.dart';
import 'package:academia/testes/screen_testes.dart';
import 'package:academia/testes/scren_teste_grid.dart';

import 'package:flutter/material.dart';

class Base extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Divider(),
        ButtonDias('Treino A', color: Colors.blueAccent, onTap:(){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ListaExercicios(treino: 'A')));
        },),
        ButtonDias('Treino B', color: Colors.amber,onTap:(){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ListaExercicios(treino: 'B')));
        },),
        ButtonDias('Treino C', color: Colors.green,onTap:(){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ListaExercicios(treino: 'C')));
        },),
        Divider(
          height: 30,
        ),
        ButtonDias('Testes API', color: Colors.deepPurple,onTap:(){
          Navigator.push(context, MaterialPageRoute(builder: (context) => TestesApi()));
        },),
        Divider(
          height: 30,
        ),
        ButtonDias('Teste Grid', color: Colors.deepPurple,onTap:(){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ScrenTesteGrid()));
        },),
      ],
    );
  }
}
