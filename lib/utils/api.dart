import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/userInfo.dart';
import 'package:http/http.dart' as http;

class ApiProvider extends ChangeNotifier {
  ApiProvider() {
    //userSign(UserLogInfo(email, password));
  }
  /*
  List<Todo> _todos = [];

  List<Todo> get todos {
    return [..._todos];
  }
*/
  void userSign(UserSignInfo userSignData) async {
/*
    final response = await http.post( Uri.parse('https://django-todo-v1.herokuapp.com/api/todo/' ),body: jsonEncode(task));
    print("entered todo");*/
    final url = Uri.parse('hhttp://127.0.0.1:8000/api/signup/');

    final headers = {"Content-type": "application/json"};
    final json = {
      "name": '${userSignData.name}',
      "email": '${userSignData.email}',
      "password": '${userSignData.password}',
      //"dob": '${userData.dob}',
      //"gender": '${userData.gender}'
    };

    final response = await http.post(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    if (response.statusCode == 201) {
      // _todos.add(todo);
      print("Successful");
    }
  }

  void userLog(UserLogInfo userLogData) async {
/*
    final response = await http.post( Uri.parse('https://django-todo-v1.herokuapp.com/api/todo/' ),body: jsonEncode(task));
    print("entered todo");*/
    final url = Uri.parse('http://127.0.0.1:8000/api/login/');

    final headers = {"Content-type": "application/json"};
    final json = {
      "email": '${userLogData.email}',
      "password": '${userLogData.password}',
      //"dob": '${userData.dob}',
      //"gender": '${userData.gender}'
    };
    final response = await http.post(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    if (response.statusCode == 201) {
      // _todos.add(todo);
      print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
      print(response);
      print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    }
  }

  /*fetchTasks() async {
    const url = 'https://django-todo-v1.herokuapp.com/api/todo/?format=json';
    final response = await http.get(Uri.parse(url));
    //final json = jsonDecode(response);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List;
      _todos = data.map<Todo>((json) => Todo.makeJson(json)).toList();
    }
  }
}*/
}
