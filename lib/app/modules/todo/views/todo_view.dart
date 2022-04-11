import 'package:cubitapp/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/todo_controller.dart';

class TodoView extends GetView<TodoController> {
  final con = Get.find<TodoController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TodoView'),
          actions: [
            InkWell(
              onTap: () {
                Get.toNamed(Routes.ADDTODO);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.add),
              ),
            )
          ],
          centerTitle: true,
        ),
        body: Obx(
          () => con.isloading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: con.tl.length,
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed(Routes.EDITTODO,
                            arguments: {'index': index});
                      },
                      child: Dismissible(
                          confirmDismiss: (_) async {
                            con.changecompletion(
                                con.tl[index].id, con.tl[index]);
                            return false;
                          },
                          background: Container(
                            color: Colors.indigo,
                          ),
                          key: Key(con.tl[index].id.toString()),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(con.tl[index].todo),
                                Obx(
                                  () => Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                            width: 4,
                                            color: con.tl[index].isCompleted
                                                ? Colors.green
                                                : Colors.red)),
                                  ),
                                )
                              ],
                            ),
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey))),
                          )),
                    );
                  }),
        ));
  }
}
