import 'dart:async';
import 'package:get/get.dart';
import 'package:team1_khayat/features/todo/todo_repositry/todo_repositry.dart';
import 'package:team1_khayat/state_managment/app_state_controller.dart';
import '../todo_model/to_do.dart';

class TodoController extends GetxController {
  TodoRepositry todoRepo = TodoRepositry();

  AppStateController appStateController = Get.find();
  RxList<Todo> myTodolist = <Todo>[].obs;

  Future<void> getTodoList() async {
    try {
      myTodolist.clear();
      appStateController.startLoading();
      final data = await todoRepo.getToDoList();
      if (data != null)
      {
        myTodolist.assignAll(data);
        appStateController.setSuccess();
      } else {
        print('\n null todo list \n');
      }
    } catch (error)
    {
      appStateController.setError('Error in get todo list : $error /n');
    }
  }
}
