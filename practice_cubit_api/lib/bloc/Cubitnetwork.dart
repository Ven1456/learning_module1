import 'dart:convert';

import 'package:http/http.dart'as http;

import 'package:practice_cubit_api/bloc/APIConstants.dart';
import 'package:practice_cubit_api/model/todo_model.dart';

import 'Statuscodes.dart';

class TodoNetwork {

  Future<List<TodoModel>> GetData() async
  {
    final url = APIConstants.baseURL;
    final uri = Uri.parse(url);
     final response = await http.get(uri);
   if(response==StatusCodes.SUCSSES)
{
  final json = jsonDecode(response.body)as List;
  final result = json.map((e) {
    return TodoModel(
        title: e["title"],
        id: e["id"],
        completed: e ["completed"],
        userId: e["userId"]);
  }).toList();
  return result;
}
   else
     {
       throw "something went wrong ${StatusCodes.PAGENOTFOUND}";
     }




  }
}