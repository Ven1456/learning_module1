import 'package:flutter/material.dart';
import 'package:untitled6/assets/hel.dart';
import 'package:untitled6/ko.dart';

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
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _isOriginal = false;
  bool _isOriginalMother = false;
  late int selectedindex;

  List <Widget> _screens = [];

  @override
  void initState() {
    _screens = <Widget>[
      helo(),
      ok(),
      heelo2(),
    ];
    super.initState();
    selectedindex = 0;
  }


  @override
  Widget build(BuildContext context) {
    //   return Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       ElevatedButton(onPressed: (){
    //
    //         if(selectedindex == 0) {
    //           Navigator.push(context, MaterialPageRoute(builder: (context) => helo() ));
    //         }
    //        else if(selectedindex == 1) {
    //           Navigator.push(context, MaterialPageRoute(builder: (context) => ok() ));
    //         }
    //         else if(selectedindex == 2) {
    //           Navigator.push(context, MaterialPageRoute(builder: (context) => heelo2() ));
    //         }
    //         else
    //           {
    //             null;
    //           }
    //
    //       }, child: Text("submit")),
    //
    //       GestureDetector(
    //         onTap: () {
    //             selectedindex = 0;
    //           setState(() {
    //
    //
    //           });
    //         },
    //         child: Center(
    //           child: Stack(
    //             children: [
    //               Visibility(
    //                   visible: _isOriginal,
    //                   child: Container(
    //                     height: 100,
    //                     width: 100,
    //                     color: Colors.red,
    //                   )     ),
    //               Visibility(
    //                   visible: !_isOriginal,
    //                   child: Container(
    //                     height: 100,
    //                     width: 100,
    //                     color: Colors.white70,
    //                   )  ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       SizedBox(height: 50,),
    //       GestureDetector(
    //         onTap: () {
    //
    //             selectedindex = 1;
    //
    //           setState(() {
    //
    //           });
    //         },
    //         child: Center(
    //           child: Stack(
    //             children: [
    //               Visibility(
    //                   visible: _isOriginalMother,
    //                   child: Container(
    //                     height: 100,
    //                     width: 100,
    //                     color: Colors.red,
    //                   )     ),
    //               Visibility(
    //                   visible: !_isOriginalMother,
    //                   child: Container(
    //                     height: 100,
    //                     width: 100,
    //                     color: Colors.white70,
    //                   )  ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   );
    // }
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {
            if (selectedindex == 0) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => helo()));
            } else if (selectedindex == 1) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ok()));
            }
            else if (selectedindex == 2) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => heelo2()));
            }
            else {
              null;
            }
          }, child: Text("submit")),

          GestureDetector(
            onTap: () {
              selectedindex = 0;

              setState(() {


              });
            },
            child: Center(
              child: Container(
                height: 100,
                width: 100,
                color: selectedindex == 0 ? Colors.red : Colors.white70,
              ),
            ),
          ),
          const SizedBox(height: 50,),
          GestureDetector(
            onTap: () {
              selectedindex = 1;

              setState(() {

              });
            },
            child: Center(
              child: Container(
                height: 100,
                width: 100,
                color: selectedindex == 1 ? Colors.red : Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

