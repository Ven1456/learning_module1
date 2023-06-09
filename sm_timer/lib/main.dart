

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sm_timer/provider/time_provider.dart';
import 'package:sm_timer/screens/home_page.dart';

void main() {
  runApp(
    MultiProvider(providers: [

      ChangeNotifierProvider(create: (context) => TimeProvider()),
    ],
  child: MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StateManagement',


      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
