import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class login extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Center(
        child: Scaffold(
          drawer: Drawer(),
          appBar: AppBar(

            title:Text("welcome to new page"),
            centerTitle: true,


          ),

          body:Container(

            color:Colors.blue.shade200,
            child: Center(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text("hello world",
                  style:TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
                 SizedBox(height:10),
                 ElevatedButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>demo()));

                 }, child: Text("Back",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 22,),),
                 ),

                ],
              )
            ),
          )
        ),
      ),
    );
  }
}