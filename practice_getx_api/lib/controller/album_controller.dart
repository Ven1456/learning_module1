import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:practice_getx_api/model/album_model.dart';

class AlbumController extends GetxController{
 var photoList =  <AlbumModel>[].obs;
 var isLoading = true.obs;
@override
void onInit()
{
  super.onInit();
  fetchData();
}


Future<void> fetchData() async
 {
   final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos/3"));


  if(response.statusCode==200)
  {
  AlbumModel _albumModel = AlbumModel.fromJson(jsonDecode(response.body));

 photoList.add(
 AlbumModel(
 albumId: _albumModel.albumId,
 id: _albumModel.id,
 title: _albumModel.title,
 url: _albumModel.url,
 thumbnailUrl: _albumModel.thumbnailUrl)
 );
 isLoading.value =false;
  }
  else
    {
      Get.snackbar("Error Loading data", "${response.statusCode}");
    }


 }
}

class APIConstants{
  static const String user = "";
}