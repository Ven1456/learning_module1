import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revision_getx/controller/getx_controller.dart';
import 'package:revision_getx/views/third_screen.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TapController controller = Get.find();
    return Scaffold(

      appBar: AppBar(

      ),
      
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            GetBuilder<TapController>(builder: (_){
            return Text(controller.x.toString());

            },
            ),

            GestureDetector(
              onTap: ()
              {
                controller.Decrease();

              },
              child: Container(
                width: 100,
                height: 30,
                color: Colors.blue,
                child:
                const Text("Decrease me "),

              ),
            ),
            const SizedBox(height:100,),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  onPressed:() {
                    Get.back();
                  },
                  child: const Text("Back To Homepage")),
            ),
                const SizedBox(height:100,),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                      onPressed:() {
                        Get.to(const ThirdPage());

                      },
                      child: const Text("Next page 3")),
                )

          ],
        ),
      ),

    );
  }
}
