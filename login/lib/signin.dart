import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/home.dart';
import 'package:login/reusablewidget.dart';
import 'package:login/signup.dart';


class signin extends StatefulWidget
{
  const signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blue,
            Colors.tealAccent.shade200,
          ])),

        child: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 252, 15, 4000),
            child: Column(
              children: <Widget>[

                const Text("Welcome Login Screen",
                style:TextStyle(
                  fontWeight: FontWeight.bold,fontSize: 24
                )),
                const SizedBox(height:35),
                reusableTextField("Enter Username", Icons.person_outline, false,
                _emailTextController),
                const SizedBox(height:15),
                reusableTextField("Enter Password", Icons.lock_outline,true,_passwordTextController),
                const SizedBox(height: 15,),
                SignInButton(context, true, () {
                  FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text).
                  then((value) {
                    Navigator.push(context,MaterialPageRoute(builder:(context)=> home())).onError((error, stackTrace){
                      print("ERROR");
                    });
                  });

                }),
                signOption(),

              ],

            ),
          ),
        ),

      ),

    );
  }

  Row signOption()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text ("Don't have Account?)",
        style:TextStyle(color:Colors.white70)),
        GestureDetector(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder:
            (context) =>signup()));
          },

          child:const Text(" Sign Up",style:TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
          ),
        )
      ],
    );
  }
}



