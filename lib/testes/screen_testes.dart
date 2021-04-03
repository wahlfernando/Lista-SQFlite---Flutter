import 'package:academia/testes/api_testes.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TestesApi extends StatefulWidget {

  @override
  _TestesApiState createState() => _TestesApiState();
}

class _TestesApiState extends State<TestesApi> {

  var posts = new List<Posts>();

  _getPosts(){
    API.getPosts().then((response){
      setState(() {
        Iterable lista = json.decode(response.body);
        posts = lista.map((m) => Posts.fromJson(m)).toList();
      });
    });
  }

  _TestesApiState() {
    _getPosts();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Testes de Api')),
      ),
      body: ListView.builder(
        itemCount : posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(posts[index].name, style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black)),
                Text(posts[index].username, style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black)),
                Text(posts[index].email, style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black)),
                Divider()
              ],
            ),
          );
        },
      ),
    );
  }
}



