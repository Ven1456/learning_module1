import 'package:cart_sm/screens/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart_screen extends StatefulWidget {
  const Cart_screen({Key? key}) : super(key: key);

  @override
  State<Cart_screen> createState() => _Cart_screenState();
}

class _Cart_screenState extends State<Cart_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page"),
      ),
      body: Consumer<CartProvider>(
        builder: (context,data,child) {
         return ListView.builder(
              itemCount: data.myCartItemList.length,
              itemBuilder: (context, index) {

                return data.myCartItemList == null||data.myCartItemList.length ==0 ? Text("No Items")
                : Card(
                  child: ListTile(
                    title: Text(
                      data.myCartItemList[index].name, style: TextStyle(fontSize: 21),
                    ),
                    subtitle: Text(
                        "\$" + data.myCartItemList[index].price.toString(),
                        style: TextStyle(fontSize: 18)

                    ),

                  ),
                );
              }
          );

        }),

      floatingActionButton: Consumer<CartProvider> (
        builder: (_,data,child){
          return Text("Cart Total \$ ${data.totalCartValue}");
        },
      )


    );
  }
}
