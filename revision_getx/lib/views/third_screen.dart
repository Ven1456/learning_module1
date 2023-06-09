import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revision_getx/controller/getx_controller.dart';
import 'package:revision_getx/views/fourth_page.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TapController controller = Get.find();
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<TapController>(builder: (_) {
                return Text(
                  controller.x.toString(),
                );
              }),
              ElevatedButton(
                  onPressed: () {
                    controller.Decrease();
                  },
                  child: const Text("Decrease")),
              GestureDetector(
                onTap: () {
                  Get.to(const FourtPage());
                },
                child: Container(
                  width: 100,
                  height: 20,
                  color: Colors.red,
                  child: Column(
                    children: const [
                      Text("Next Page 4"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
