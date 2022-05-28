import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/userInfo.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'routes.dart';
import 'storage.dart' as StorageMedium;

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
    final url = Uri.parse('http://10.0.2.2:8000/api/signup/');
    print("inuserSign");
    final headers = {"Content-type": "application/json"};
    final json = {
      "name": '${userSignData.name}',
      "email": '${userSignData.email}',
      "password": '${userSignData.password}',
      //"dob": '${userData.dob}',
      //"gender": '${userData.gender}'
    };

    final response = await http.post(url, headers: {}, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    print("before resonse code");
    if (response.statusCode == 202) {
      // _todos.add(todo);
      print("Successful");
    }
  }

  Future<String> forgotPassword(String emailAdress) async {
    final url = Uri.parse('http://10.0.2.2:8000/api/forgot/');

    // final headers = {"Content-type": "application/json"};
    final json = {
      "email": '${emailAdress}',
      //"dob": '${userData.dob}',
      //"gender": '${userData.gender}'
    };

    final response = await http.post(url, headers: {}, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    if (response.statusCode == 200) {
      Map<String, dynamic> message = jsonDecode(response.body);
      var messageOut = message['message'];
      print("message Out::" + messageOut);
      return messageOut;
    }
    return "Network Error! Please Try again";
  }

  void resetPassword(String emailAdress) async {
    final url = Uri.parse('http://10.0.2.2:8000/api/forgot/');

    // final headers = {"Content-type": "application/json"};
    final json = {
      "email": '${emailAdress}',
      //"dob": '${userData.dob}',
      //"gender": '${userData.gender}'
    };

    final response = await http.post(url, headers: {}, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    print("before resonse code");
    if (response.statusCode == 202) {
      // _todos.add(todo);
      print("Successful");
    }
  }

  Future<String> resetConfirm(String otp, String pass) async {
    final url = Uri.parse('http://10.0.2.2:8000/api/reset/');

    // final headers = {"Content-type": "application/json"};
    final json = {
      "otp": '${otp}',
      "pw": '${pass}'

      //"dob": '${userData.dob}',
      //"gender": '${userData.gender}'
    };

    final response = await http.post(url, headers: {}, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    if (response.statusCode == 202) {
      Map<String, dynamic> message = jsonDecode(response.body);
      var messageOut = message['message'];
      print("message Out::" + messageOut);
      return messageOut;
    }
    return "Network Error! Please Try again";
  }

  void userLog(UserLogInfo userLogData) async {
/*
    final response = await http.post( Uri.parse('https://django-todo-v1.herokuapp.com/api/todo/' ),body: jsonEncode(task));
    print("entered todo");*/
    final url = Uri.parse('http://10.0.2.2:8000/api/login/');

    final headers = {};
    final json = {
      "email": '${userLogData.email}',
      "password": '${userLogData.password}',
      //"dob": '${userData.dob}',
      //"gender": '${userData.gender}'
    };
    final response = await http.post(url, headers: {}, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    if (response.statusCode == 202) {
      // _todos.add(todo);
      // Map<String, dynamic> responseJson = json.decode(response.body);
//print(responseJson.nameAtribute);
      // var data = jsonDecode(response.body);
      Map<String, dynamic> authTokenJson = jsonDecode(response.body);
      var tokenVal = authTokenJson['token'];
      print("Object is ${tokenVal}");
      StorageMedium.Author.authToken = tokenVal;

// Write value

    }
  }

  void sendHealth(double height, int weight, bool isSmoking, bool isAlcoholic,
      String dob, String gender) async {
    final url = Uri.parse('http://10.0.2.2:8000/api/health/');
    print(StorageMedium.Author.authToken);
    final headers = {
      "Authorization": "Bearer ${StorageMedium.Author.authToken}"
    };
    final json = {
      "height": height.toString(),
      "weight": weight.toString(),
      "smoking": isSmoking.toString(),
      "alcoholic": isAlcoholic.toString(),
      "dob": dob,
      "gender": gender
    };

    final response = await http.post(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    print("before resonse code");
    if (response.statusCode == 200) {
      print("Successful");
    }
  }

  Future<bool> checkExUser() async {
/*
    final response = await http.post( Uri.parse('https://django-todo-v1.herokuapp.com/api/todo/' ),body: jsonEncode(task));
    print("entered todo");*/
    final url = Uri.parse('http://10.0.2.2:8000/api/check-data/');

    final headers = {
      "Authorization": "Bearer ${StorageMedium.Author.authToken}"
    };

    final response = await http.post(url, headers: headers);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    if (response.statusCode == 200) {
      print("SAFE DONE");
    }
    Map<String, dynamic> jsonObj = jsonDecode(response.body);
    if (jsonObj['Has Filled'] != null) {
      var hasFilled = jsonObj['Has Filled'];
      print("Object is ${hasFilled}");
      return true;
    }

    return false;
  }

  void getAnalytic() async {
    final url = Uri.parse('http://10.0.2.2:8000/api/analyse-data/');

    final headers = {
      "Authorization": "Bearer ${StorageMedium.Author.authToken}"
    };

    final response = await http.get(url, headers: headers);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    print("before resonse code");
    if (response.statusCode == 200) {
      print("Successful");
    }
  }
}
