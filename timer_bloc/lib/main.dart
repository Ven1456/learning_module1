import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_bloc/time/time_states.dart';
import 'package:timer_bloc/time/timer_cubit.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        home:  Home()
    );
  }
}


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkoutCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('The BLoC App'),
        ),
        body: BlocBuilder<WorkoutCubit, WorkoutState>(
          builder: (context, state) {
            if (state is WorkoutInitial) {
              return  Center(
                child: ElevatedButton(
                    onPressed: ()=>BlocProvider.of<WorkoutCubit>(context).startWorkout(0),
                    child: Text("Start")),
              );
            }

            if(state is WorkoutInProgress){
              print("${state.elapsed}");
              return Center(child: Text("${state.elapsed!}"),);
            }

            return Container();
          },
        ),
      ),
    );
  }
}