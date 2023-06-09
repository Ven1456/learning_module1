import 'package:deep_linking_flutter/lo.dart';
import 'package:deep_linking_flutter/profile_screen.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const Homepage());
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
   InitFirebaseDeepLink();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      routes: {
        '/profile': (BuildContext context) =>  lol()
      },
      home: Scaffold(
        body: Center(
          child: Text("This Home Screen"),
        ),
      ),
    );
  }
}

void InitFirebaseDeepLink() async {
  FirebaseDynamicLinks.instance.onLink(
   onSuccess:(PendingDynamicLinkData ? dynamicLink)async{
     final Uri? deeplink = dynamicLink?.link;
     if(deeplink!=null)
       {
        print("deeplink" + deeplink.queryParameters.values.first);
        Get.toNamed('/profile');
        print("error");
       }
   },
   onError: (OnLinkErrorException e) async{
     print(e.message);
 }
 );
}