
import 'package:bloc_cubit_api/cubit/cubit.dart';
import 'package:bloc_cubit_api/cubit/states_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  void initState() {

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit =context.read<TodoCubit>();
      cubit.fetchData();
    });
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Cubit"),
        ),
        body: BlocBuilder< TodoCubit,TodoState>(
          builder: (context,state)

          {

            if(state is InitTodoState || state is LoadingTodoState )
              {
                return Center(child: CircularProgressIndicator());
              }
            else if(state is ResponseTodoState)
              {
                final todos = state.todos;
            return ListView.builder(
              itemCount: todos.length,
                itemBuilder:(context,index) {
                final view = todos[index];
                  return ListTile(
                    title: Text(view.title.toString()),


                  );

                });
              }
            return Center(child: Text(state.toString())

            );
          }
        ),
      );
  }
}
