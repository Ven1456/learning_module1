import 'package:flutter/material.dart';
import 'package:internet_connectivity_bloc/Screens/third.dart';
import 'package:internet_connectivity_bloc/Screens/second.dart';
import 'package:internet_connectivity_bloc/Screens/home_screen.dart';


import '../Screens/home_screen.dart';
import '../Screens/second.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomeScreen(
            title: "Home Screen",
            color: Colors.blueAccent,
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => SecondScreen(
            title: "Second Screen",
            color: Colors.redAccent, key: null,
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => ThirdScreen(
            title: "Thirst Screen",
            color: Colors.greenAccent,
          ),
        );
      default:
        return null;
    }
  }
}
