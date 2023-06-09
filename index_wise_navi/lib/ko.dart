import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class helo extends StatefulWidget {
  const helo({Key? key}) : super(key: key);

  @override
  State<helo> createState() => _heloState();
}

class _heloState extends State<helo> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: Center(
         child: Text("HELO"),
       ),
     );
  }
}

class ok extends StatefulWidget {
  const ok({Key? key}) : super(key: key);

  @override
  State<ok> createState() => _okState();
}

class _okState extends State<ok> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("welcome "),
      ),
    );
  }
}

class heelo2 extends StatefulWidget {
  const heelo2({Key? key}) : super(key: key);

  @override
  State<heelo2> createState() => _heelo2State();
}

class _heelo2State extends State<heelo2> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text("hello world"),
      ),
    );
  }
}
