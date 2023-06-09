import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_cubit_api/cubit/cubit.dart';
import 'package:practice_cubit_api/cubit/cubit_states.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cubit Api"),
      ),
      body: BlocBuilder<TodoCubit,TodoState>(
        builder: (context,state) {

          if(state is InitTodo)
            {
              return Center(child: CircularProgressIndicator());
            }
        // else if(state is RespondTodo)
        //   {
        //     final states = state.states;
        //
        //   return ListView.builder(
        //       itemCount: states.length,
        //       itemBuilder: (context,index)
        //   {
        //     final View = states[index];
        //     return ListTile(
        //       title: Text(View.title),
        //     );
        //   });
        //   }

        return Text(state.toString());
        },
      ),
    );
  }
}
