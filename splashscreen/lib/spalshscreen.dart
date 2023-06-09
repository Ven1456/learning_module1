import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/main.dart';

class spalsh extends StatefulWidget
{
  @override
  State<spalsh> createState() => _spalshState();
}

class _spalshState extends State<spalsh> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),()
    {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> demo(),));
    }
    );
  }
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body:Container(
          color:Colors.blue,
        child:Center(child: Text("Spalsh Screen",
        style:TextStyle(fontSize: 34,fontWeight: FontWeight.w700,color:Colors.white)),),


      ),

    );
  }
}