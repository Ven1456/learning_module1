import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:untitled3/cubit/counter-cubit.dart';
import 'package:untitled3/cubit/counter_cubit_states.dart';
import 'package:untitled3/screens/Homepage.dart';
import 'package:untitled3/screens/second_screen.dart';
import 'package:untitled3/screens/third_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),

        home:MyHomePage(),
        // routes: {
        //
          // "/" :(context) => BlocProvider.value(
          //     value: _counterCubit,
          //     child: MyHomePage()),
          //
          //
          // "/second" : (context) => BlocProvider.value(
          //     value: _counterCubit,
          //     child: Second_Screen()),
          //
          // "/third" : (context) => BlocProvider.value(
          //     value: _counterCubit,
          //     child: Third_Screen()),
        // },
        ),

    );
  }
}




