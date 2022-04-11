import 'dart:convert';

import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();
  static Future<void> addtodo(String s) async {
    try {
      var response = await client.post(
        Uri.parse('http://localhost:3000/todos/'),
        body: jsonEncode({
          "todo": s,
          "is completed": false,
        }),
        headers: {"Content-type": "application/json"},
      );
      print(response.statusCode);
      print(response.body);
    } catch (e) {
      throw e;
    }
  }
}
