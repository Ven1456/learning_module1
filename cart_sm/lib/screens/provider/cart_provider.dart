import 'package:flutter/cupertino.dart';
import 'package:cart_sm/screens/item_page.dart';

class CartProvider extends ChangeNotifier
{
  List<ItemModel> myCartItemList = [];
  double totalCartValue = 0;
  addToCart(ItemModel itemModel)
  {
    myCartItemList.add(itemModel);
     totalCartValue += itemModel.price;
    notifyListeners();



  }


}