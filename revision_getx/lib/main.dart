import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revision_getx/helper_controllers/second_model_init_controller.dart';
import 'package:revision_getx/views/home_screen.dart';
import 'package:revision_getx/helper_controllers/init_conrollers.dart'as non;
Future <void>main() async {
  // this is one of the model of controllers using getx
  // WidgetsFlutterBinding.ensureInitialized();
 //  await non.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitDependency(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Homepage(),
    );
  }
}
