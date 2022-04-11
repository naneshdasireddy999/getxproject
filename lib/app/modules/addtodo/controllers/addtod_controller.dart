import 'package:cubitapp/app/modules/addtodo/services/remote_services.dart';
import 'package:cubitapp/app/modules/todo/controllers/todo_controller.dart';

import 'package:get/get.dart';

class AddTodoController extends GetxController {
  final con = Get.find<TodoController>();
  Future<void> addnewtodo(String s) async {
    var mytodo = await RemoteServices.addtodo(s);
    con.fetchtodos();

    Get.back();
  }
}
