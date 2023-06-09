import 'package:get/get.dart';
import 'package:revision_getx/controller/getx_controller.dart';
import 'package:revision_getx/controller/list_controller.dart';

class InitDependency implements Bindings
{
  @override
   void dependencies()
  {
    Get.lazyPut(() => TapController());
    Get.lazyPut(() => ListController());
  }
}