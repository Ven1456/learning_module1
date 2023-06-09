import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revision_getx/controller/getx_controller.dart';
import 'package:revision_getx/views/Total_page.dart';
import 'package:revision_getx/views/second_screen.dart';

class  Homepage extends StatelessWidget {
 Homepage({Key? key}) : super(key: key);

 // TapController controller = Get.put(TapController());
  TapController controller = Get.put(TapController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
            children: [

              GetBuilder<TapController>(builder: (_)
              {
                return Text(controller.x.toString(),style: const TextStyle(fontSize: 22),);
              },

    ),
        //Increase
              GestureDetector(
                onTap: () {
                  controller.Increment();
                  print("you clicked on tap 1 button");
                },
                child: Padding(
                  padding: const EdgeInsets.all(22.0),

                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21),
                        color: Colors.red,
                      ),
                      width: 400,
                      height: 100,
                      child: const Center(child: Text("Increase",style: TextStyle(fontSize: 21),)),




                  ),
                ),
              ),

              //Decrease
              GestureDetector(
                onTap: () {
                  controller.Decrease();

                  print('you clicked on button 2 ${controller.x}');
                },
                child: Padding(
                  padding: const EdgeInsets.all(22.0),

                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Colors.red,
                    ),
                    width: 400,
                    height: 100,
                    child: Center(child: Text("Decrease",style: TextStyle(fontSize: 21),)),




                  ),
                ),
              ),

              //Next Page
              GestureDetector(
                onTap: () {
                   Get.to(const SecondPage());
                },
                child: Padding(
                  padding: const EdgeInsets.all(22.0),

                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Colors.red,
                    ),
                    width: 400,
                    height: 100,
                    child: const Center(child: Text("Next Page",style: TextStyle(fontSize: 21),)),




                  ),
                ),
              ),

              //Total
              GestureDetector(
                onTap: () {
                  Get.to(const TotalPage());
                },
                child: Padding(
                  padding: const EdgeInsets.all(22.0),

                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Colors.red,
                    ),
                    width: 400,
                    height: 100,
                    child: const Center(child: Text("Total",style: TextStyle(fontSize: 21),)),




                  ),
                ),
              ),
            ],
      ),
    );
  }
}
