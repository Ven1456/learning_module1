

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../cubit/counter-cubit.dart';
import '../cubit/counter_cubit_states.dart';
import 'Homepage.dart';
class Second_Screen extends StatefulWidget {
  const Second_Screen({Key? key}) : super(key: key);

  @override
  State<Second_Screen> createState() => _MyhomePageState();
}

class _MyhomePageState extends State<Second_Screen> {
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

                SizedBox(height: 40,),
              MaterialButton(
                  color: Colors.lightGreenAccent,
                  child: Text("go to first page"),

                  onPressed: (){
                Navigator.of(context).push( MaterialPageRoute(builder: (context) =>
                    BlocProvider.value(
                    value:BlocProvider.of<CounterCubit>(context),
                  child: MyHomePage(),



                )


                ));



              })

              ],
            ),
          ),
        ),
      ),
    );
  }
}


