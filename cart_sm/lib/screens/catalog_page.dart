import 'package:cart_sm/screens/cart_screen.dart';
import 'package:cart_sm/screens/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'item_page.dart';
class Catalogscreen extends StatefulWidget {
  const Catalogscreen({Key? key}) : super(key: key);

  @override
  State<Catalogscreen> createState() => _CatalogscreenState();
}

class _CatalogscreenState extends State<Catalogscreen> {

  List<ItemModel> menuItemList = [];

  Menu() {
    menuItemList.add(ItemModel(name: "Pens", price: 50.56));
    menuItemList.add(ItemModel(name: "Books", price: 100.5));
    menuItemList.add(ItemModel(name: "Colors", price: 100.8));
    menuItemList.add(ItemModel(name: "Eraser", price: 58.52));
    menuItemList.add(ItemModel(name: "Sharpner", price: 40.2));
  }

late CartProvider cartProvider;

  @override
  void initState() {
    Menu();
    cartProvider = Provider.of<CartProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Shopping Zone"),
          actions: [
            IconButton(onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=> Cart_screen()));
            }, icon: Icon(Icons.add_shopping_cart))
          ],
        ),

        body: ListView.builder(
            itemCount: menuItemList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(
                    menuItemList[index].name, style: TextStyle(fontSize: 21),
                  ),
                  subtitle: Text(
                      "\$" + menuItemList[index].price.toString(),
                      style: TextStyle(fontSize: 18)

                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.blue,
                    onPressed: () {
                      cartProvider.addToCart(menuItemList[index]);
                    },
                  ),
                ),
              );
            }
        )
    );
  }
}
