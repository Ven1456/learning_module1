import 'package:flutter/cupertino.dart';

class TimeProvider extends ChangeNotifier
{
    int countDown = 1000;

  updateTimer(){
    countDown--;
    notifyListeners();
  }
}