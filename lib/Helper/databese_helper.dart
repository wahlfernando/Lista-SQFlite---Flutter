import 'dart:async';
import 'package:academia/manager/manager.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import '../todo.dart';


class DatabaseHelper {

  static DatabaseHelper _databaseHelper;    // Singleton DatabaseHelper
  static Database _database;                // Singleton Database

  String todoTable = 'todo_table';
  String id = 'id';
  String nome = 'nome';
  String series = 'series';
  String repeticoes = 'repeticoes';
  String carga = 'carga';
  String realizado = 'realizado';
  String treino = 'treino';

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {

    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {

    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }


  Future<Database> initializeDatabase() async {
    final directory = await getExternalStorageDirectory();
    String path = directory.path + '/dados_academia.db';
    var todosDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return todosDatabase;
  }

  void _createDb(Database db, int newVersion) async {

    await db.execute('CREATE TABLE $todoTable($id INTEGER PRIMARY KEY AUTOINCREMENT, $nome TEXT, '
        '$treino TEXT, $carga TEXT, $repeticoes TEXT, $series TEXT, $realizado TEXT)');
  }

  Future<List<Map<String, dynamic>>> getTodoMapList(String acatreino) async {
    Database db = await this.database;
     //var result = await db.query(todoTable, where: "'$treino = $acatreino'", orderBy: '$nome ASC');
     var result = await db.query(todoTable, orderBy: '$nome ASC');
    return result;
  }



  Future<int> insereDsAcademia(String sql) async {
    Database db = await this.database;
    var resultado = await db.rawInsert(sql);
    return resultado;
  }

  Future<int> updateDsAcademia(String sql) async{
    Database db = await this.database;
    var resultado = await db.rawUpdate(sql);
    return resultado;
  }

  Future<int> updateTodo(DadosExercicios dadosExercicios) async {
    var db = await this.database;
    var result = await db.update(todoTable, dadosExercicios.toMap(), where: '$id = ?', whereArgs: [dadosExercicios.id]);
    return result;
  }


  Future<int> deleteExercicio(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $todoTable WHERE $id = $id');
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $todoTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  Future<List<DadosExercicios>> getExerciciosList(String treino) async {
    var todoMapList = await getTodoMapList(treino);
    int count = todoMapList.length;

    List<DadosExercicios> todoList = List<DadosExercicios>();
    for (int i = 0; i < count; i++) {
      todoList.add(DadosExercicios.fromMapObject(todoMapList[i]));
    }

    return todoList;
  }

}