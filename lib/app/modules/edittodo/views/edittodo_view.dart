import 'package:cubitapp/app/modules/todo/controllers/todo_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edittodo_controller.dart';

class EdittodoView extends GetView<EdittodoController> {
  final a = Get.arguments['index'];
  final con = Get.find<TodoController>();
  final myc = TextEditingController();
  final cons = Get.find<EdittodoController>();

  @override
  Widget build(BuildContext context) {
    myc.text = con.tl[a].todo;
    return Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: () {
                cons.deletetodo(con.tl[a].id);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.delete),
              ),
            )
          ],
          title: Text('EdittodoView'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            TextField(
              controller: myc,
            ),
            TextButton(
                onPressed: () {
                  cons.ledittodo(con.tl[a].id, myc.text);
                },
                child: Text('edit todo'))
          ],
        ));
  }
}
