

import 'package:flutter/material.dart';
import 'package:statemanagement/provider/shopping_cart.dart';
import 'package:statemanagement/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/provider/counter_provider.dart';
import 'package:statemanagement/screens/secondScreen.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create:(_) => Counter() ),
      ChangeNotifierProvider(create: (_) => ShopingCart()),
    ],
      child: MyApp(),
    ),
    
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
    initialRoute:'/',
        routes: {
        '/':(context)=>HomeScreen(),
          '/second':(context) => SecondScreen(),
    },
    );
  }
}
