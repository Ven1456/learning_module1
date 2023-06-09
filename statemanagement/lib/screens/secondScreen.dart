import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/provider/counter_provider.dart';
import 'package:statemanagement/provider/shopping_cart.dart';



class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("provider (${context.watch<Counter>().count})"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("${context.watch<ShopingCart>().count}"),
            Text("${context.watch<ShopingCart>().cart}")
          ],
        ),
      ),
      
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: ()=> context.read<ShopingCart>().addItem("Bread"),
            tooltip: "Add item",
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 15,),
          FloatingActionButton(onPressed: ()=> context.read<ShopingCart>().removeItem("Bread"),
          key: const Key("remove"),
          tooltip: "Remove",
          child: const Icon(Icons.remove),),



        ],
      ),

    );
  }
}
