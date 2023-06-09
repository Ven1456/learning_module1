
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/cubit/counter-cubit.dart';
import 'package:untitled3/cubit/counter_cubit_states.dart';
import 'package:untitled3/routes/app_routes.dart';
import 'package:untitled3/screens/second_screen.dart';
import 'package:untitled3/screens/third_screen.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: BlocListener<CounterCubit,CubitState>(
        listener: (context,state)
        {
          if(state.IsIncrement== true)
          {
          }
          else if(state.IsIncrement == false)
          {}

        },
        child: Container(
          child:  Center(
            child: Column
              (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<CounterCubit,CubitState>(builder:(context,state)
                {

                  if (state.counterValue < 0)
                  {
                    return Text("Negative Value" + state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,);
                  }
                  else
                  {
                    return Text(state.counterValue.toString(),style: Theme.of(context).textTheme.headline4,);
                  }

                },
                ),
                const SizedBox(height: 20,),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: (){
                          BlocProvider.of<CounterCubit>(context).decrement();

                        },
                        tooltip: "decrement",
                        child: const Icon(Icons.minimize),


                      ),
                      SizedBox(width: 40,),

                      FloatingActionButton(
                        onPressed: (){
                          BlocProvider.of<CounterCubit>(context).increment();

                        },
                        tooltip: "increase",
                        child: const Icon(Icons.add),

                      )
                    ],
                  ),
                ),
                SizedBox(height: 30,),

                MaterialButton(
                    color: Colors.limeAccent,
                    child: Text("Go To Second Page"),

                    onPressed: (){
                      //
                      // Navigator.pushNamed(context, "/second");

                      Navigator.push(context, MaterialPageRoute(builder: (context) => BlocProvider.value(

                          value:BlocProvider.of<CounterCubit>(context),
                      child: Second_Screen(),

                      )));


                    }),

                MaterialButton(
                    color: Colors.limeAccent,
                    child: Text("Go To Third Page"),

                    onPressed: (){

                      // Navigator.pushNamed(context, "/three");
                      Navigator.push(context,MaterialPageRoute(builder:( context) => BlocProvider.value(

                          value: BlocProvider.of<CounterCubit>(context),
                      child: Third_Screen(),))

                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}




