import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_cart/screens/Homepage_Screen.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({Key? key}) : super(key: key);

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2400),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => MyHomePage()
            )
        )
    );
    @override
  Widget build(BuildContext context) {
    return Container();
  }
}

  @override
  Widget build(BuildContext context) {
    return Container(

      color: Colors.cyanAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

           Lottie.network("https://assets1.lottiefiles.com/packages/lf20_5aw3ejl3.json"),

          

        ],
      ),
    );
  }
}


/*
*
* import 'dart:async';

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
 */