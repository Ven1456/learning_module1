//
//
// import 'dart:js';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:untitled3/cubit/counter-cubit.dart';
// import 'package:untitled3/screens/Homepage.dart';
// import 'package:untitled3/screens/second_screen.dart';
// import 'package:untitled3/screens/third_screen.dart';
//
// class AppRoutes
// {
//   final CounterCubit _counterCubit = CounterCubit();
//
//   Route  onGenrateRoute(RouteSettings routeSettings)
//
//   {
//
//
//     switch (routeSettings.name)
//     {
//       case '/' :
//         return MaterialPageRoute(
//
//             builder: (_) => BlocProvider.value(
//             value:_counterCubit,
//
//             child: MyHomePage()));
//         break;
//
//       case "/second" : return MaterialPageRoute(builder:
//         (_) => BlocProvider.value
//
//         (
//           value:_counterCubit,
//           child: Second_Screen()));
//       break;
//       case " /three " :
//         return MaterialPageRoute(builder:
//         (_)  => BlocProvider.value(
//           value: _counterCubit,
//           child: Third_Screen()));
//       break;
//       default:
//         return null ;
//
//       }
//
//   }
//
// }
//
