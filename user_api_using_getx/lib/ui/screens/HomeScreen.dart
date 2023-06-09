import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:user_api_using_getx/controller/user_controller.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Getx Example"),
      ),
      body: Obx(()=> _controller.isLoading.value?Center(child: CircularProgressIndicator()) :
      Card(
        child:  ListTile(

                  title: Text("name: ${_controller.userList[0].name}"),
                  subtitle: Text(("id:${_controller.userList[0].id}")),


                ),
      ),
              // Text("id:${_controller.userList[0].id}"),
              // Text("name: ${_controller.userList[0].name}"),
              // Text("username: ${_controller.userList[0].username}"),
              // Text("phone:${_controller.userList[0].phone}"),
              // Text("email:${_controller.userList[0].email}"),
              // Text("website:${_controller.userList[0].website}")

        ),
      

    );
  }
}
