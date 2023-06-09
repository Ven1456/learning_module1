import 'package:flutter/material.dart';

class ShopingCart with ChangeNotifier
{
  final List<String> _shoppingCart = ["apple",'banana','orange'];
  int get count => _shoppingCart.length;
  List <String> get cart => _shoppingCart;

  void addItem(String item){
    _shoppingCart.add(item);
    notifyListeners();
  }
  void removeItem(String item )
  {
    _shoppingCart.remove(item);
    notifyListeners();
  }


}