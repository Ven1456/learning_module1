import 'package:flutter/material.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0, left: 16, top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Icon(Icons.arrow_back_ios),
              const Spacer(),
              const Icon(Icons.shopping_cart)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16, top: 15),
          child: Row(
            children: [
              const Text(
                "Shopping Cart",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.none),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 20,
              ),
              const Spacer(),
              InkWell(onTap: () {}, child: const Icon(Icons.view_list_rounded)),
              const SizedBox(
                width: 20,
              ),
              const Icon(Icons.grid_view_rounded)
            ],
          ),
        ),
      Expanded(

        child: ListView.builder(

            itemCount: 10,
            itemBuilder: (context,index)

            {
              return ListTile(


              );
            },
            ),
      )
      ]),
    ));
  }
}
