import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sm_timer/provider/time_provider.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override

  void initState(){
    var timerProvider = Provider.of<TimeProvider> (context,listen: false);
    Timer.periodic(Duration(seconds: 1), (timer){
      timerProvider.updateTimer();

    }) ;
    super.initState();

  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StateManagement",
            )



      ),
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children:  [
           Text("StateManagement Using Provider ",style: TextStyle(fontSize: 24),),
           SizedBox(height: 20,),
           
           Icon(Icons.timer,
           size: 90,
           color: Colors.red,),
           Container(
             child: Consumer<TimeProvider>(
               builder: (context,data,child){
                 return Text("${data.countDown}",style: TextStyle(fontSize: 25),);
               },
             ),

           )
         ],
       ),
     ),

    );
  }
}
