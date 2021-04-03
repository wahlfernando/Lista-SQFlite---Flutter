import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'api_testes.dart';

class ScrenTesteGrid extends StatefulWidget {


  static const int numItems = 10;

  @override
  _ScrenTesteGridState createState() => _ScrenTesteGridState();
}

class _ScrenTesteGridState extends State<ScrenTesteGrid> {
  List<bool> selected = List<bool>.generate(ScrenTesteGrid.numItems, (index) => false);

  var posts = new List<Posts>();

  _getPosts(){
    API.getPosts().then((response){
      setState(() {
        Iterable lista = json.decode(response.body);
        posts = lista.map((m) => Posts.fromJson(m)).toList();
      });
    });
  }

  _ScrenTesteGridState() {
    _getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Testes de Grid')),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index){
          return DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Center(
                  child: Text(
                    'Nome',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Center(
                  child: Text(
                    'Usuário',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ],
            rows: List<DataRow>.generate(
              ScrenTesteGrid.numItems,
                  (index) => DataRow( color: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                if (states.contains(MaterialState.selected))
                  return Theme.of(context).colorScheme.primary.withOpacity(0.08);
                if (index % 2 == 0) return Colors.grey.withOpacity(0.3);
                return null;
              }),
                cells: [
                  DataCell(Text(posts[index].name)),
                  DataCell(Text(posts[index].username))
                ],
                selected: selected[index],
                onSelectChanged: (bool value) {
                  setState(() {
                    selected[index] = value;
                  });
                },
              ),
            ),
          );
        }
      ),
    );
  }
}




