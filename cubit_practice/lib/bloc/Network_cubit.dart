import 'dart:convert';

import 'package:cubit_practice/bloc/StatusCode.dart';
import 'package:cubit_practice/model/todo_model.dart';
import 'package:http/http.dart'as http;
import 'package:cubit_practice/bloc/APIConstants.dart';

class CubitNetwork
{
  Future<List<CubitModel>> FetchData() async
{
  final url = APIConstant.baseURL;
  final uri =Uri.parse(url);
  final response = await http.get(uri);
  final json = jsonDecode(response.body)as List;

  if (response==StatusCodes.SUCCESS)
  {
    final result=json.map((e) {
      return CubitModel(title:e  ['title'],
          id: e ['id'],
          userId: e ['userId'],
          completed: e['completed']
      );
    }).toList();
    return result;
  }
  else
  {
    throw ("something went wrong ${response==StatusCodes.PAGENOTFOUND}");
  }
}
}