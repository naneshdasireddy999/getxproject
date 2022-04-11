import 'package:get/get.dart';

import '../modules/addtodo/bindings/addtodo_binding.dart';
import '../modules/addtodo/views/addtodo_view.dart';
import '../modules/edittodo/bindings/edittodo_binding.dart';
import '../modules/edittodo/views/edittodo_view.dart';

import '../modules/todo/bindings/todo_binding.dart';
import '../modules/todo/views/todo_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TODO;

  static final routes = [
    GetPage(
      name: _Paths.TODO,
      page: () => TodoView(),
      binding: TodoBinding(),
    ),
    GetPage(
      name: _Paths.ADDTODO,
      page: () => AddtodoView(),
      binding: AddtodoBinding(),
    ),
    GetPage(
      name: _Paths.EDITTODO,
      page: () => EdittodoView(),
      binding: EdittodoBinding(),
    ),
  ];
}
