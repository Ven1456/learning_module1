import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/signin.dart';
import 'reusablewidget.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _usernameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
          title: const Text(
            "Sign Up",
            style:TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
          ),
      ),
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

          const Text("Welcome Signup Screen",
          style:TextStyle(
              fontWeight: FontWeight.bold,fontSize: 24
          )),
      const SizedBox(height:85),
      reusableTextField("Enter Username", Icons.person_outline, false,
          _usernameTextController),
      const SizedBox(height:15),
      reusableTextField("Enter Username", Icons.person_outline, false,
          _emailTextController),
      const SizedBox(height:15),
      reusableTextField("Enter Password", Icons.lock_outline,true,_passwordTextController),
      const SizedBox(height: 15,),
      SignInButton(context, false, () {

        FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text).then((value) {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>signin()));
        }).onError((error, stackTrace)
            {
              print("error occured");

            });


      }),
            ]
    ),
    ),
      ),
    ),

    );
  }
}
