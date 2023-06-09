import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_cubit_api/bloc/Cubitnetwork.dart';
import 'package:practice_cubit_api/cubit/cubit.dart';
import 'package:practice_cubit_api/ui/screens/homescreen/Homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => TodoCubit(TodoNetwork())),

    ],
        child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:HomeScreen(),
    )
    );
  }
}
