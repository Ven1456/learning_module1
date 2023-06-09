import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:login_bloc/auth/auth_repository.dart';
import 'package:login_bloc/login/login_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login UI Using Bloc',
      theme: ThemeData(
       primarySwatch: Colors.indigo
      ),
home:LoginView()


    );

  }



}
