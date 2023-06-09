import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revision_getx/controller/getx_controller.dart';
import 'package:revision_getx/views/home_screen.dart';
class FourtPage extends StatelessWidget {
  const FourtPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TapController controller = Get.find();
    return Scaffold(
        appBar: AppBar(),
        body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
             Obx(() => Text(Get.find<TapController>().y.toString())),
              ElevatedButton(onPressed: ( ) {
                controller.DecreaseY();

              } ,
                  child: const Text("Decrease Y")),
              const SizedBox(height: 60,),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.to(Homepage());
                  },
                  child: Container(
                    width: 100,
                    height: 40,
                    color: Colors.red,
                    child: const Text("Next Page 5"),
                  ),
                ),
              ),


            ],
          ),


        )

    );
  }
}
