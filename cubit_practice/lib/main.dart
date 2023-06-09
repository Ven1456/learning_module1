import 'package:cubit_practice/bloc/Network_cubit.dart';
import 'package:cubit_practice/bloc/cubit/cubit.dart';
import 'package:cubit_practice/ui/screens/Homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers:[
      BlocProvider(create: (context) => Cubit_info(CubitNetwork())),
    ], child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Homepage(),)
    );
  }
}