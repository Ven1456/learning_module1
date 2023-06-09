import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:practice_getx_using_api/controler/album_binding.dart';
import 'package:practice_getx_using_api/ui/Homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AlbumBinding(),
      title: 'Flutter GET X  Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Homepage(),
    );
  }
}
