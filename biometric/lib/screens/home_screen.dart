import 'package:biometric/screens/biometric.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showBiometric = false;
  bool isAuthenticate = false;

  @override
  void initState() {

    super.initState();
    isBiometricAvailable();

  }
  isBiometricAvailable() async
  {
    showBiometric = await BioMetric().hasEnrolledBioMetric();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
    //  body: Container(color: Colors.white,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("data"),

            if(showBiometric)
            ElevatedButton(onPressed: ()async{
              isAuthenticate = await BioMetric().authenticate();

            }, child: const Text("Enroll",style: TextStyle(color: Colors.white),)),
            const SizedBox(height: 20,),
            if(isAuthenticate)
              const Text("Successfully enrolled",style: TextStyle(color: Colors.white),)
          ],
        ),
      ),

    );
  }
}
