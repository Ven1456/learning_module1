import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/spalshscreen.dart';
import 'loginpage.dart';
import 'signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

        primarySwatch: Colors.blue,
      ),
      home: spalsh(),
    );
  }
}
class demo extends StatelessWidget
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
          backgroundColor: Colors.cyanAccent.shade200,
          appBar: AppBar(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Login Page"),
                // ElevatedButton(onPressed: () {
                //   Navigator.push(context,MaterialPageRoute(builder: (context) => login(),
                //   ),
                //   );
                //
                // }, child: Text("Next"))

              ],
            ),
            centerTitle: true,
          ),

          body:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome To Login Page",
              style:TextStyle(fontWeight: FontWeight.bold,fontSize: 24)),



            SizedBox(height:89),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: Container(
                  decoration: BoxDecoration(
                    color:Colors.deepPurpleAccent[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15)

                  ),


       child: Padding(
          padding: const EdgeInsets.only(left:12.0),
          child: TextField(
                  decoration: InputDecoration(border: InputBorder.none,
                  prefixIcon: Icon(Icons.email,color:Colors.white),
                  hintText: "Enter Your Email",
                      hintStyle:TextStyle(color:Colors.white),
                  ),

                ),
        ),
                ),
              ),


              SizedBox(height:15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent[200],
                      border: Border.all(color:Colors.white,),
                      borderRadius: BorderRadius.circular(15)

                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:12.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(border:InputBorder.none,
                        contentPadding: EdgeInsets.only(top:14),

                        prefixIcon: Icon(
                          Icons.security,
                          color: Colors.white,

                        ), hintText: "Enter Your Password",
                          hintStyle:TextStyle(color:Colors.white),
                      )
                      ,
                    ),
                  ),
                ),
              ),
            SizedBox(height:25),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 77.0),
                child: Row(
                  children:[
                  ElevatedButton(onPressed: (){

                  }, child: Text ("Login",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                  ),

                    SizedBox(width: 65),


                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>signin()));

                  }, child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text ("Signin",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                  ),
                  ),
                ]
                 ),
              ),
            )

            ],

          ),


          // demo of login page
          //  body:Container(
          //    color:Colors.blue.shade200,
          //
          //    child: Center
          //
          //      (
          //
          //      child:Column(
          //        mainAxisAlignment: MainAxisAlignment.center,
          //        children: [
          //          Center(child: Text("welcome",
          //          style:TextStyle(fontWeight: FontWeight.bold,fontSize:34))),
          //          SizedBox(height:10),
          //          ElevatedButton(onPressed: (){
          //            Navigator.push(context, MaterialPageRoute(builder: (context)=> login()),);
          //          }, child: Text("Next",style:TextStyle(fontWeight: FontWeight.bold
          //          ,fontSize: 24,
          //          )),)
          //        ],
          //      ),
          //
          // ),
          //  ),

      ),
      ),

    );
  }
}
/*
*
* import 'package:flutter/material.dart';

void main()  => runApp(login());

    class login extends StatelessWidget
    {
      @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      body:SafeArea(

        child:Center(
     child:Column(
       mainAxisAlignment: MainAxisAlignment.center,
        children: [


          //Text
        SizedBox(height:15),
          Text("Welcome User",
          style:TextStyle(fontWeight:FontWeight.bold,fontSize: 24),),
        SizedBox(height:10),
        Text("Welcome To SignIn App",
        style:TextStyle(fontWeight: FontWeight.bold,fontSize: 19)),
          //Text Field
          SizedBox(height:50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),

            child: Container(
              decoration: BoxDecoration(
                color:Colors.deepPurpleAccent[200],
                border: Border.all(color:Colors.white,),

                borderRadius: BorderRadius.circular(14)

              ),
              child: Padding(

                padding: const EdgeInsets.only(left:12.0),

                child: TextField(
                  decoration: InputDecoration(border: InputBorder.none,
                  hintText: "Enter Your Email",
                  contentPadding: EdgeInsets.only(top:15),
                  prefixIcon: Icon(Icons.email,
                  color:Colors.white)),

                ),
              ),
            ),
          ),
          //password
          SizedBox(height:15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent[200],
                border: Border.all(color:Colors.white,),
                borderRadius: BorderRadius.circular(15)

              ),
              child: Padding(
                padding: const EdgeInsets.only(left:12.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(border:InputBorder.none,
                  contentPadding: EdgeInsets.only(top:14),

                  prefixIcon: Icon(
                    Icons.security,
                    color: Colors.white,

                  ), hintText: "Enter Your Password",),
                ),
              ),
            ),
          ),
          //signin
          SizedBox(height:13),
          Padding(


            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Container(
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(color:Colors.purple,
              borderRadius: BorderRadius.circular(12)),
              child:Text("Signin",
              style:TextStyle(color:Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
            ),
          ),

          SizedBox(height:25),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a Member? ",
                style:TextStyle(fontWeight: FontWeight.bold,)),
                Text("Register Now",
                style: TextStyle(color:Colors.blueAccent,fontWeight: FontWeight.bold,),

                ),
              ],
            ),
          )
        ],
     ),
        ),
      ),
    );
  }
    }*/