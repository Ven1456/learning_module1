import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/database/cart_db.dart';
import 'package:shopping_cart/models/cart_model.dart';
import 'package:shopping_cart/provider/cart_provider.dart';
import 'package:shopping_cart/resources/ColorManager.dart';
import 'package:shopping_cart/resources/fontmanager.dart';
import 'package:shopping_cart/screens/cart_screen.dart';

import '../resources/fontsize.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  List<String> productName = ['Mango','Orange',"Grapes","Banana","Cherry","Apples"];
  List<String> productUnits = ["KG","Dozen","KG","Dozen","KG","KG"];
  List<int> price = [10,15,14,15,10,13];
  List<String> productImage =[
    "https://media.istockphoto.com/id/1008183290/photo/whole-and-slice-ripe-mango-fruit-with-green-leaves-isolated-on-white-background.jpg?b=1&s=170667a&w=0&k=20&c=F-0NZbvJ3j0XuC3ulX4XX191UsuBVd2oaUo2jGR4XhA=",
    "https://media.istockphoto.com/id/1194662606/photo/orange-isolated-on-white-background-clipping-path-full-depth-of-field.jpg?s=612x612&w=0&k=20&c=rhITc7KJiHKvRe_aVnC_3Tjae4B67MrvAcH6HpxC8xM=",
    "https://thumbs.dreamstime.com/b/blue-wet-grapes-bunch-white-background-isabella-as-package-design-element-45127219.jpg",
    "https://media.istockphoto.com/id/636739634/photo/banana.jpg?s=612x612&w=0&k=20&c=pO0985tQi1LpWRlWqpRvbab8S5yxgnEOVcs5CHIlcDE=",
    "https://media.istockphoto.com/id/533381303/photo/cherry-with-leaves-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=6BV79sui5Hc6lj555eV_ePiGlKfdZveIG9B5hIWidug=",
    "https://media.istockphoto.com/id/495878092/photo/red-apple.jpg?s=612x612&w=0&k=20&c=M2ndFI1v2erJM18q1Cd1QCM8jqBlRKLc1nLE9BNp-EY=",
  ];
  DBHelper? dbHelper = DBHelper();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(

        appBar: AppBar(
          title: const Text("Product List"),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen()));
              },
              child: Center(
                child: Badge(
                  badgeContent: Consumer<CartProvider>(
                    builder: (context,value,child)
                    {
                      return
                      Text(value.getCounter().toString(),
                        style: const TextStyle(color: Colors.white),
                      );
                    },

                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  child: const Icon(Icons.shopping_bag_outlined),
                ),
              ),
            ),
            const SizedBox(width: 20)
          ],
        ),
        body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: productName.length,
                    itemBuilder: (context, index) {
                  //card
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            Image(
                              height:100,
                              width: 100,
                              image: NetworkImage(productImage[index].toString()),
                            ),
                            Column(

                              children: [
                                Text(productName[index].toString(),style:const TextStyle( fontWeight: FontWeightManager.semibold,fontSize: FontSize.s20)),
                                const SizedBox(height: 10,),
                                Text((productUnits) [index].toString()),
                              ],
                            ),
                            const SizedBox(width: 20,),
                            Text( r"$  "  +   price[index] . toString(),style: const TextStyle(fontWeight: FontWeightManager.medium,fontSize: FontSize.s14),),


                            const SizedBox(width: 50,),
                            InkWell(
                              onTap: (){
                            dbHelper!.insert(Cart(
                                id: index,
                                productId: index.toString(),
                                productName: productName[index].toString(),
                                initialPrice: price[index],
                                price: price[index],
                                quantity: 1,
                                productUnits: productUnits[index].toString(),
                                productImage: productImage[index].toString())

                            ).then((value) {
                              print("Added to Cart");
                              cart.addTotalPrice(double.parse(price[index].toString()));
                              cart.addCounter();

                            }).onError((error, stackTrace) {
                              print (error.toString());
                            });
                              },

                              child: Padding(
                                padding: const EdgeInsets.only(left: 24.0),
                                child: Container(
                                  height: 40,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: ColorManager.accentGreen,
                                    borderRadius: BorderRadius.circular(21)
                                  ),
                                  child: const Center(child: Text("Add To Cart",
                                    style: TextStyle(fontSize: FontSize.s12,
                                      fontWeight: FontWeightManager.bold),)),
                                ),
                              ),
                            )

                          ],


                        )
                      ],
                    ),
                  );
                }),
              )
            ],
          ),
        );
  }
}
