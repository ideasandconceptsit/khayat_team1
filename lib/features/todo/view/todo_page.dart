import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_colors.dart';
import '../../../state_managment/app_state_controller.dart';
import '../../../state_managment/app_status.dart';
import '../todo_controller/todo_controller.dart';


class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {

  final TodoController todoController = Get.find();
  AppStateController appStateController=Get.find() ;
@override
  void initState() {
  todoController.getTodoList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('todo page'),
      ),
      body:Obx(()
      {
        if(appStateController.state.value==AppState.loading)
        {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: AppColors.primary,
            
            ),
          );
        }
        else if(appStateController.state.value==AppState.error)
        {
          return const Text('error');
        }
        return ListView.builder(
          itemCount: todoController.myTodolist.length,
          itemBuilder: (context, index)
          {
              final todo = todoController.myTodolist[index];
              return ListTile(
                title: Text(todo.title),
                subtitle: Text('${todo.completed}'),
              );
          },
        );
      },),
    );
  }
}
