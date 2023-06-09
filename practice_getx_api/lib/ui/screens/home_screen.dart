import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:practice_getx_api/controller/album_controller.dart';

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
        title: Text("Getx Api"),
      ),
      body: Obx(() => _controller.isLoading.value? Center(child: const CircularProgressIndicator()):
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Album ID: ${_controller.photoList[0].albumId}"),
              Text("urlz: ${_controller.photoList[0].url}"),
              Text("title: ${_controller.photoList[0].title}"),
              // Text("url: ${_controller.photoList[0].url}}"),
          //    Image.network(_controller.photoList[0].thumbnailUrl),
            ],
          ),
        ),
      ),
    );
  }
}
