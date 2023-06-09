import 'dart:convert';
import 'package:bloc_cubit_api/bloc/APIConstants.dart';
import 'package:bloc_cubit_api/bloc/StatusCode.dart';
import 'package:bloc_cubit_api/model/model.dart';
import 'package:http/http.dart'as http;
class TodoNetwork
{
  Future<List<TodoModel>> accessData() async
  {
    const url = APIConstants.baseURL;
    final uri = Uri.parse(url);
    final response =await http.get(uri);


   if(response.statusCode==200)
     {
      final json = jsonDecode(response.body)as List;
    final result =  json.map((e) {
        return TodoModel(title: e ["title"],
            id: e ['id'],
            completed:e ['completed'],
            userId:e  ['userId'],);
      }).toList();
      return result;
     }
   else
     {
       throw "something went wrong ${response==StatusCodes.PAGENOTFOUND}";
     }


  }


}