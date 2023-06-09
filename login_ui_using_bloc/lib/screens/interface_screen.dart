import 'package:flutter/material.dart';
class Interface extends StatelessWidget {
  const Interface({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Interface"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Welcome To Second Page",style: TextStyle(fontSize: 21),),
      ),
    );
  }
}
