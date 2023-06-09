import 'package:flutter/material.dart';
import 'package:login/signin.dart';
class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold
        (
        appBar: AppBar
          (
          title: Text("Welcome Page"),
          centerTitle: true,
        ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:(context)=>signin()));


              }, child: Text("Back")),

                Text("Welcome To Home Page"),

            ],
          ),
        )
      ),
    );
  }
}
