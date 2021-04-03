import 'dart:async';
import 'package:http/http.dart' as http;


const baseUrl = "https://jsonplaceholder.typicode.com";

class API {
  static Future getPosts() async{
    var url = baseUrl + "/users";
    return await http.get(url);
  }
}

class Posts {
  int userId;
  int id;
  String title;
  String body;
  String name;
  String username;
  String email;


  User(int userId, int id, String title, String body, String name, String username, String email) {
    this.id = id;
    this.userId = userId;
    this.title = title;
    this.body = body;

    this.name = name;
    this.username= username;
    this.email = email;
  }

  Posts.fromJson(Map json):
        userId = json['userId'],
        id = json['id'],
        title = json['title'],
        body = json['body'],
        name = json['name'],
        username = json['username'],
        email = json['email'];
}