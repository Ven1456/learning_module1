import 'package:get/get.dart';
import 'package:user_api_using_getx/controller/user_controller.dart';

class UserBindings extends Bindings
{
  @override
  void dependencies() {
     Get.put<UserController>(UserController());
  }

}