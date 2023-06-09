import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revision_getx/controller/getx_controller.dart';
import 'package:revision_getx/controller/list_controller.dart';

class TotalPage extends StatelessWidget {
  const TotalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ListController listController = Get.put(ListController());
    return Scaffold(
      appBar: AppBar(

      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Increment
            GestureDetector(
              onTap: () {
                Get.find<TapController>().Increment();

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
                  child: GetBuilder<TapController>(builder: (_)
                  {
                    return Center(
                      //Text("Value of X  " +Get.find<TapController>().x.toString(),style: TextStyle(fontSize: 21),)
                      //or
                        child: Text("Value of X  ${Get.find<TapController>().x}",style: const TextStyle(fontSize: 21),));
                  }),
                ),
              ),
            ),
            // decrement
            GestureDetector(
              onTap: () {
                Get.find<TapController>().DecreaseY();
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
                  child: GetBuilder<TapController>(builder: (_) {
                    return Center(child: Text("Value of Y ${Get.find<TapController>().y}"));
                  })




                ),
              ),
            ),

            // Obx(() => Text(Get.find<TapController>().y.toString())),
            // ElevatedButton(onPressed: ( ) {
            //   Get.find<TapController>().DecreaseY();
            //
            // } ,
            //     child: Text("Increase Y")),

            // GestureDetector(
            //   onTap: () {
            //     Get.find<TapController>().Total();
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.all(22.0),
            //
            //     child: Container(
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(21),
            //         color: Colors.red,
            //       ),
            //       width: 400,
            //       height: 100,
            //       child: Center(child: Text("Total  " +Get.find<TapController>().z.toString() ,style: TextStyle(fontSize: 21),)),
            //     ),
            //   ),
            // ),

            GestureDetector(
              onTap: () {
                Get.find<TapController>().Total();
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
                  child:GetBuilder<TapController>(builder: (_){
                    return   Center(
                      child: Text
                      //("Total  " +Get.find<TapController>().z.toString() ,style: TextStyle(fontSize: 21)),
                      //or
                        ("Total  ${Get.find<TapController>().z}" ,style: const TextStyle(fontSize: 21)),
                    );

                  },)


                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.find<ListController>().setValues(Get.find<TapController>().z);
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
                    child:GetBuilder<TapController>(builder: (_){
                      return   const Center(
                        child: Text
                          ("Save Total "  ,style: TextStyle(fontSize: 21)),
                      );

                    },)


                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
