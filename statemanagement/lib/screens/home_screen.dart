
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/provider/counter_provider.dart';



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
          title: const Text("Provider"),
          centerTitle: true,

        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Center(child: Text("How Many Times You Clicked the Item: ${context.watch<Counter>().count}",
              style: const TextStyle(fontSize: 18),)),
            const Count(),
  ElevatedButton(onPressed: (){
    Navigator.pushNamed(context, "/second");
  }, child: const Text("Next Screen"))

          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              key:const Key("decrement"),
              onPressed: ()=> context.read<Counter>().decrement(),
              tooltip: "increment",
              child:const Icon(Icons.remove),


            ),
            const SizedBox(width:10),

            FloatingActionButton(
              key: const Key("reset"),
              onPressed:() => context.read<Counter>().reset(),
              tooltip: "reset",
              child: const Icon(Icons.exposure_zero),
            ),
            const SizedBox(width:10),

            FloatingActionButton(
                onPressed: ()=> context.read<Counter>().increment(),
              key: const Key("increment"),
              tooltip: "increment",
              child: const Icon(Icons.add),


            ),],
        )
      );
  }
}

class Count extends StatelessWidget
{
  const Count({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Text("${context.watch<Counter>().count}",
    style: const TextStyle(fontSize: 24),
    key: const Key("Count"),);
  }
}