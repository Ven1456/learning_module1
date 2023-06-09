import 'package:cubit_practice/bloc/cubit/cubit.dart';
import 'package:cubit_practice/bloc/cubit/cubit_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  void initState()
  {
    super.initState();
    final cubit =  context.read<Cubit_info>();
    cubit.fetchData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cubit"),
      ),
      body:BlocBuilder<Cubit_info,CubitState>(
        builder: (context,state)
        {

          if(state is Initstate)
            {
              return Center(child: CircularProgressIndicator());
            }
          return Text(state.toString());
          // return ListView.builder(itemBuilder: (context,index)
          // {
          //   return ListTile();
          // });
        },
      )


    );
  }
}
