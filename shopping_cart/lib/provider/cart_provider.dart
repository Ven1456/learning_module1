import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_cart/database/cart_db.dart';

import '../models/cart_model.dart';

class CartProvider with ChangeNotifier
{
  DBHelper db = DBHelper();
int _counter =0 ;
int get counter => _counter;

double _totalprice = 0.0;
double get totalprice => _totalprice;

late Future<List<Cart>> _cart;
Future <List<Cart>> get cart  => _cart;

Future <List<Cart>> getData() async
{
  _cart = db.getCartList();
  return _cart;
}



 void _setPreference()

async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt("cart_item", _counter);
  prefs.setDouble("total_price", _totalprice);
  notifyListeners();
}

void _getPrefernce()

async {
 SharedPreferences prefs = await SharedPreferences.getInstance() ;
 _counter = prefs.getInt("cart_item") ?? 0;
 _totalprice =prefs.getDouble("total_price") ?? 0.0 ;
 notifyListeners();
}
//total price
  void addTotalPrice(double price)
  {
    _totalprice = _totalprice + price;
    _setPreference();
    notifyListeners();
  }
  void removeTotalPrice(double price)
  {
    _totalprice = _totalprice - price;
    _setPreference();
    notifyListeners();
  }

  double getTotalPrice()
  {
    _getPrefernce();
    return _totalprice;


  }

  //counter
  void addCounter()
{
  _counter ++ ;
  _setPreference();
  notifyListeners();
}
void removeCounter()
{
  _counter --;
  _setPreference();
  notifyListeners();
}

int getCounter()
{
  _getPrefernce();
  return _counter;
}



}