import 'package:cubitapp/app/modules/todo/models/todo_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RemoteServices {
  static var client = http.Client();
  static Future<void> deletetodo(int id) async {
    try {
      var response = await client.delete(
        Uri.parse('http://localhost:3000/todos/$id'),
        headers: {"Content-type": "application/json"},
      );
    } on Exception catch (e) {
      // TODO
    }
  }

  static Future<void> edittodo(int id, String s) async {
    try {
      var response = await client.patch(
        Uri.parse('http://localhost:3000/todos/$id'),
        body: jsonEncode({"todo": s}),
        headers: {"Content-type": "application/json"},
      );
    } on Exception catch (e) {
      // TODO
    }
  }
}
