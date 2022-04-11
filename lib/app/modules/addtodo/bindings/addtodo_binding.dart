import 'package:cubitapp/app/modules/addtodo/controllers/addtod_controller.dart';
import 'package:get/get.dart';

class AddtodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTodoController>(
      () => AddTodoController(),
    );
  }
}
