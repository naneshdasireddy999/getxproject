import 'package:cubitapp/app/modules/todo/models/todo_model.dart';
import 'package:cubitapp/app/modules/todo/services/remote_services.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  RxList<Todo> tl = [Todo(todo: '', isCompleted: false, id: 0)].obs;
  RxBool isloading = true.obs;

  final count = 0.obs;
  Future<void> fetchtodos() async {
    var mytodo = await RemoteServices.fetchtodo();
    if (mytodo != null) {
      isloading.value = false;
      tl.value = mytodo;
    }
  }

  Future<void> changecompletion(int id, Todo t) async {
    var mytodo = await RemoteServices.patchtodo(id, t);
    fetchtodos();
  }

  @override
  void onInit() {
    fetchtodos();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
