import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _result = [];

  @override
  void initState()
  {
    super.initState();
    fetchUser();
    print("fetch has been intialized");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Practce Rest Api"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _result.length,
                itemBuilder: (context,index)
            {
              final data = _result[index];
              final title = data["name"]["first"];
              final location = data["location"]["street"]["name"];
              final picture = data["picture"] ["large"];

              // final
              return ListTile(
                leading:ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CircleAvatar(

                      child: Image.network(picture)),
                ),
              title: Text(title.toString()),
                subtitle: Text(location.toString()),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: ElevatedButton(onPressed: fetchUser, child: Text("Refresh Data")),
          )
        ],
      ),
    );
  }
  void fetchUser() async
  {
    final Uri uri = Uri.parse("https://randomuser.me/api/?results=100");
    final response = await http.get(uri);
    final getResult = jsonDecode(response.body);

    setState(() {
      _result = getResult["results"];
    });
    print("fetch completed");




  }

}
