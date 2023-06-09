import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/database/cart_db.dart';
import 'package:shopping_cart/provider/cart_provider.dart';
import 'package:shopping_cart/resources/fontmanager.dart';
import 'package:shopping_cart/resources/fontsize.dart';

import '../models/cart_model.dart';
import '../resources/ColorManager.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Products"),
        centerTitle: true,
        actions: [
          Center(
            // badge
            child: Badge(
              badgeContent: Consumer<CartProvider>(
                builder: (context, value, child) {
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
          const SizedBox(width: 20)
        ],
      ),

      body: Column(
        children: [

          FutureBuilder(
              future: cart.getData(),
              builder: (context, AsyncSnapshot<List<Cart>> snapshot)
              {
                if (snapshot.hasData) {
                  return Expanded(child:
                  ListView.builder(
                      itemCount: snapshot.data!.length,
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
                                    height: 100,
                                    width: 100,
                                    image: NetworkImage(
                                        snapshot.data![index].productImage
                                            .toString()),
                                  ),
                                  Column(

                                    children: [



                                    // product name
                                      Text(snapshot.data![index].productName.toString(),
                                          style: const TextStyle(
                                          fontWeight: FontWeightManager.semibold, fontSize: FontSize.s20)),

                                      const SizedBox(height: 10,),
                                      // product units

                                      Text(snapshot.data![index].productUnits.toString()),],
                                  ),
                                  const SizedBox(width: 10,),

                                  // product price
                                  Text( r"$  " + snapshot.data![index].price.toString(),

                                    style: const TextStyle(fontWeight: FontWeightManager.medium, fontSize: FontSize.s14),),
                                  const SizedBox(width: 40,),
                                  // container data
                                  InkWell(
                                    onTap: ()
                                    {
                                    dbHelper!.delete(snapshot.data![index].id!);
                                    cart.removeCounter();
                                    cart.removeTotalPrice(double.parse(snapshot.data![index].price.toString()));

                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(right:18.0),
                                      child: Row(
                                        children: const [ Icon(Icons.delete)],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 40,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: ColorManager.accentGreen,
                                          borderRadius: BorderRadius.circular(
                                              21)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [

                                            // remove button

                                            InkWell(

                                                onTap: ()
                                                {
                                                  int quantity = snapshot.data![index].quantity!;
                                                  int pricequantity = snapshot.data![index].initialPrice!;
                                                  quantity--;
                                                  int? newPrice = pricequantity * quantity;
                                                  if (quantity > 0)
                                                    {
                                                      dbHelper!.updateQuantity(
                                                        Cart(

                                                            id: snapshot.data![index].id!,
                                                            productId: snapshot.data![index].id!.toString(),
                                                            productName: snapshot.data![index].productName!,
                                                            initialPrice:snapshot.data![index].initialPrice!,
                                                            price: newPrice,
                                                            quantity: quantity,
                                                            productUnits: snapshot.data![index].productUnits.toString(),
                                                            productImage: snapshot.data![index].productImage .toString()),
                                                      ).then((value) {
                                                        newPrice = 0;
                                                        quantity =0 ;
                                                        cart.removeTotalPrice(double.parse(snapshot.data![index].initialPrice!.toString()));

                                                      }).onError((error, stackTrace)
                                                      {
                                                        print(error.toString());
                                                      });
                                                    }
                                                },
                                                // remove icon
                                                child: const Icon(Icons.remove)),
                                          Text(snapshot.data![index].quantity.toString(),
                                          style: const TextStyle(fontSize: FontSize.s13,
                                              fontWeight: FontWeightManager
                                                  .bold),),

                                            // delete button
                                            InkWell(
                                                onTap: (){
                                                // {
                                                  int quantity = snapshot.data![index].quantity!;
                                                  int pricequantity = snapshot.data![index].initialPrice!;
                                                  quantity++;
                                                  int? newPrice = pricequantity * quantity;
                                                  dbHelper!.updateQuantity(
                                                    Cart(

                                                        id: snapshot.data![index].id!,
                                                        productId: snapshot.data![index].id!.toString(),
                                                        productName: snapshot.data![index].productName!,
                                                        initialPrice:snapshot.data![index].initialPrice!,
                                                        price: newPrice,
                                                        quantity: quantity,
                                                        productUnits: snapshot.data![index].productUnits.toString(),
                                                        productImage: snapshot.data![index].productImage .toString()),
                                                    ).then((value) {
                                                      newPrice = 0;
                                                      quantity =0 ;
                                                      cart.addTotalPrice(double.parse(snapshot.data![index].initialPrice!.toString()));

                                                  }).onError((error, stackTrace)
                                                  {
                                                    print(error.toString());
                                                  });



                                                },

                                                // add icon
                                                child: const Icon(Icons.add)),
                                          ],
                                        ),
                                      )
                                    ),
                                  )

                                ],


                              )
                            ],
                          ),
                        );
                      }),




                  );

                }
                return const Text("");

              }
          ),


          Consumer<CartProvider>(builder: (context,value,child)
    {
      return Padding(
        padding: const EdgeInsets.only(right:16.0,left:16,bottom:25),
        child: Visibility(
          visible: value.getTotalPrice().toStringAsFixed(2) == "0.00" ? false :true,
          child: Column(
          children: [
            ReusableWidget(title: "Sub Total",


                value: r"$"+value.getTotalPrice().toStringAsFixed(2)),
          ],
          ),
        ),
      );
    }
          ),


        ],
      ),
    );
  }

}
// reusable widget
class ReusableWidget extends StatelessWidget
{
  final String title , value;
  const ReusableWidget({super.key,
    required this.title,
    required this.value,

});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left:15,bottom: 35),
      child: Row(
      children: [
      Text(title,style: Theme.of(context).textTheme.subtitle2,),
    const SizedBox(width: 210,),
    Text (value.toString(),style: Theme.of(context).textTheme.subtitle2,)
    ],
    )
    );


  }
}