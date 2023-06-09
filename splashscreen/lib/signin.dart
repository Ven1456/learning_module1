import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/loginpage.dart';
import 'loginpage.dart';
import 'main.dart';


class signin extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home:Scaffold(
        backgroundColor: Colors.cyanAccent.shade200,
      appBar: AppBar(
        title:Text("Sign in "),
        centerTitle: true,
      ),
body:Center(
  child:   Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      //Text
      SizedBox(height:15),

      Text("Welcome To SignIn App",
          style:TextStyle(fontWeight: FontWeight.bold,fontSize: 24)),

      SizedBox(height:40),
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

              decoration: InputDecoration(border:InputBorder.none,
                contentPadding: EdgeInsets.only(top:14),

                prefixIcon: Icon(
                  Icons.security,
                  color: Colors.white,

                )
                , hintText: "Enter Your Username",
                hintStyle:TextStyle(color:Colors.white),
              ),
            ),
          ),
        ),
      ),

      SizedBox(height:15),
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
                  hintStyle:TextStyle(color:Colors.white),
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

                ), hintText: "Enter Your Password",
                  hintStyle:TextStyle(color:Colors.white),
              ),
            ),
          ),
        ),
      ),
      SizedBox(height: 15),
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

                )
                , hintText: "Confirm Your Password",
                hintStyle:TextStyle(color:Colors.white),
              ),
            ),
          ),
        ),
      ),

      SizedBox(height:15),
      ElevatedButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>demo()));

      }, child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text ("Submit",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
      ),
      ),
    ],

  ),
)

      )
    );
  }
}