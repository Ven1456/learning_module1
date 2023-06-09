import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:practice_getx_using_api/controler/album_controller.dart';
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _controller = Get.find<AlbumController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Practice GETX API"),
       ),

      body: Obx(() => _controller.isLoading.value? Center(child: CircularProgressIndicator()) :
         Column(
          children: [

         Text("${_controller.albumList[0].title}"),
        Text("${_controller.albumList[0].id}"),


          ],
        ),
      ),
    );
  }
}
