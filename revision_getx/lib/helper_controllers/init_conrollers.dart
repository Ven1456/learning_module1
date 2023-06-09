import 'package:get/get.dart';
import 'package:revision_getx/controller/getx_controller.dart';
import 'package:revision_getx/controller/list_controller.dart';

Future<void> init()
 async
{
Get.put(() => TapController());
Get.put(() => ListController());
}