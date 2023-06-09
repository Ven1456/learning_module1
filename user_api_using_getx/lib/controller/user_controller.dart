import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import '../model/user_model.dart';

class UserController extends GetxController
{
  var userList = <UserModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit()
  {
    super.onInit();
    fetchUser();
  }
  Future<void>fetchUser() async
  {

    final response  = await  http.get(Uri.parse("https://jsonplaceholder.typicode.com/users/10"));
    if(response.statusCode==200)
    {

      UserModel _userModel = UserModel.fromJson(jsonDecode(response.body));
      userList.add(UserModel(
          id: _userModel.id,
          name: _userModel.name,
          username: _userModel.username,
          email: _userModel.email,
          phone: _userModel.phone,
          website: _userModel.website));

      isLoading.value=false;
    }

    else
      {
        Get.snackbar("Error on Data Loding ", "${response.statusCode}");
      }

}




}