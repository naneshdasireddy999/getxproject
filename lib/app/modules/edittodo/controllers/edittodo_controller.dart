import 'package:cubitapp/app/modules/edittodo/services/remote_services.dart';
import 'package:cubitapp/app/modules/todo/controllers/todo_controller.dart';
import 'package:get/get.dart';

class EdittodoController extends GetxController {
  final con = Get.find<TodoController>();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> deletetodo(int id) async {
    var mytodo = await RemoteServices.deletetodo(id);
    con.fetchtodos();
    Get.back();
  }

  Future<void> ledittodo(int id, String s) async {
    var mytodo = await RemoteServices.edittodo(id, s);
    con.fetchtodos();
    Get.back();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
