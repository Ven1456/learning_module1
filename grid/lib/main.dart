import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: home(),
    );
  }
}
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid layout"),
        centerTitle: true,
      ),
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(crossAxisCount: 2,
          mainAxisSpacing: 11,
          crossAxisSpacing: 11,

          children: [
          Container(color: Colors.red,),
          Container(color: Colors.green,),
          Container(color: Colors.yellowAccent,),
          Container(color: Colors.greenAccent,),
          Container(color: Colors.purple),
          Container(color: Colors.black87,),
          Container(color: Colors.red,),
          Container(color: Colors.blueAccent,),
          Container(color: Colors.red,),
          Container(color: Colors.greenAccent,),
          Container(color: Colors.blueAccent,),

        ],),
      )
    );
  }
}
