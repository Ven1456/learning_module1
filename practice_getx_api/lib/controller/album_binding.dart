import 'package:get/get.dart';
import 'package:practice_getx_api/controller/album_controller.dart';

class AlbumBinding extends Bindings {
  @override
  void dependencies() {
  Get.put<AlbumController>(AlbumController());
  }
}
