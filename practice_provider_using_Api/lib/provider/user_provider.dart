import 'package:flutter/material.dart';
import 'package:practice_provider_using_api/model/user_model.dart';
import 'package:practice_provider_using_api/services/';

import '../services/user_services.dart';
class UserProvider extends ChangeNotifier
{

  final _service = UserServices();
  bool isLoading = false ;
  List<UserModel> _model=[];
  List<UserModel> get _model=>_model;

  Future <void>getAllData()async
  {
    isLoading =true;
    notifyListeners();
    final response = await _service.fetchdata();

    _model=response;
    isLoading = false;
    notifyListeners();
  }
}