import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:practice_getx_using_api/model/album_model.dart';

class AlbumController extends GetxController
{
var albumList = <AlbumModel>[].obs;
var isLoading = true.obs;
@override
void onInit()
{
  super.onInit();
  fetchAlbum();
}


Future<void>fetchAlbum() async
{
  final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/albums/1"));
if(response.statusCode==200)
{

AlbumModel _albummodel =  AlbumModel.fromJson(jsonDecode(response.body));

albumList.add(AlbumModel(
userId: _albummodel.userId,
id: _albummodel.id,
title: _albummodel.title));

isLoading.value=false;
}
else
  {
    Get.snackbar("Error occured", "${response.statusCode}");
  }
}
}