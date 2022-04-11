import 'package:cubitapp/app/modules/addtodo/controllers/addtod_controller.dart';
import 'package:cubitapp/app/modules/todo/controllers/todo_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AddtodoView extends GetView<AddTodoController> {
  final mycontroller = TextEditingController();
  final con = Get.find<AddTodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AddtodoView'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: mycontroller,
                autofocus: true,
                decoration: InputDecoration(hintText: 'enter todo message'),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    mycontroller.text.isEmpty
                        ? Get.back()
                        : con.addnewtodo(mycontroller.text);
                  },
                  child: Text('add todo'))
            ],
          ),
        ));
  }
}
