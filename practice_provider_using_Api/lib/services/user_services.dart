import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:http/http.dart'as http;
import 'package:practice_provider_using_api/model/user_model.dart';
class UserServices
{
  Future <List<UserModel>> fetchData()async{
  final uri = Uri.parse("https://jsonplaceholder.typicode.com/todos");
  final response = await http.get(uri);
  if(response.statusCode==200)
  {
  final json =   jsonDecode(response.body)as List;
 final result = json.map((e) {
  return UserModel(
  userid:e ['userid'],
  id:e ['id'],
  title:e ['title'],
  completed: e['completed']);
  }).toList();
  return result;
  }
  else
    {
      throw ("Spmething went Wrong ${response.statusCode}");
    }

  }
}