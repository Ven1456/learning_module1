

import 'package:bar/NavBar.dart';
import 'package:flutter/material.dart';



//import 'package:sidebar/NavBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          drawer:NavBar(),

    appBar: AppBar(
    title:Text("SideBar"),
    centerTitle: true,

    ),

          body:Center(
            child:Text("first app"),
          )
        ),
    );
  }
}


