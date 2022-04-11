import 'dart:convert';

import 'package:cubitapp/app/modules/todo/models/todo_model.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();
  static Future<List<Todo>?> fetchtodo() async {
    try {
      var response = await client.get(Uri.parse('http://localhost:3000/todos'));
      if (response.statusCode == 200) {
        var jsonstring = response.body;
        return todoFromJson(jsonstring);
      } else {
        return null;
      }
    } on Exception catch (e) {
      // TODO
    }
  }

  static Future<void> patchtodo(int id, Todo t) async {
    try {
      print(t.isCompleted);
      var response = await client.patch(
        Uri.parse('http://localhost:3000/todos/$id'),
        body: jsonEncode({
          "is completed": !t.isCompleted,
        }),
        headers: {"Content-type": "application/json"},
      );
    } on Exception catch (e) {
      // TODO
    }
  }
}
