import 'package:dio/dio.dart';
import 'package:team1_khayat/core/network/api_exceptions.dart';
import 'package:team1_khayat/core/network/dio_utils.dart';

import '../todo_model/to_do.dart';


class TodoRepositry
{
  Future<List<Todo>> getToDoList() async
  {
    final myDio = DioUtils.getInstance();
    Response myResponse = await myDio.get('/todos');
    List<dynamic> data = myResponse.data;

    if (myResponse.statusCode == 200)
    {
      return data.map((element)
      {
        return Todo.fromJson(element);
      }).toList();
    } else {
      throw ServerException('Error in server ');
    }
  }
}
