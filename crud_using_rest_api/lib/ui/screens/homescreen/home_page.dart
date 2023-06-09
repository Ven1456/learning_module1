import 'dart:convert';

import 'package:crud_using_rest_api/ui/screens/homescreen/add_item_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isLoading = true;
  List items = [];



  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CRUD USING REST API"),
      ),
      body: Visibility(
        visible: isLoading,
        child: Center(child: CircularProgressIndicator()),
        replacement: RefreshIndicator(
          onRefresh: fetchData,

          child: Visibility(
            visible: items.isNotEmpty,
            replacement: Center(child: Text("No Items In Cart",style: TextStyle(fontSize: 22),),),

            child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index] as Map;
                    final id = item["_id"] as String;
                    return Card( 
                      child: ListTile(
                          leading: CircleAvatar(child: Text("${index + 1}")),
                          subtitle: Text(item["description"]),
                          title: Text(item['title']),
                          trailing: PopupMenuButton(
                            onSelected: (value) {
                              if (value == "edit") {
                                NavigateEditPage(item);
                              }
                              else if (value == "delete") {
                                deleteById(id);
                              }
                            },
                            itemBuilder: (context) {
                              return [
                                const PopupMenuItem(
                                  value: "edit",
                                  child: Text("Edit"),
                                ),
                                const PopupMenuItem(
                                  value: "delete",
                                  child: Text("delete"),
                                ),
                              ];
                            },
                          )),
                    );
                  }),
            ),
          ),

      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: NavigateSettingPage,
        label: const Text("add items"),
      ),
    );
  }
// navigate to edit page
 Future <void> NavigateEditPage(Map item)  async {
    final route = MaterialPageRoute(builder: (context) => AddItem(todo: item,));
    await Navigator.push(context, route);
    isLoading=true;
    fetchData();

  }
  // navigate to next page
  Future<void> NavigateSettingPage() async {
    final route = MaterialPageRoute(builder: (context) => AddItem());

    await Navigator.push(context, route);
    isLoading = true;
    fetchData();
  }

  Future<void> deleteById(String id) async {
    // delete  the item
    final url = "https://api.nstack.in/v1/todos/$id";
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    if (response.statusCode == 200) {
      // remove the item

      final updated =
          items = items.where((element) => element["_id"] != id).toList();
      setState(() {
        items = updated;
      });
    } else {}
  }

  // create a get method here
  Future<void> fetchData() async {
    final url = 'https://api.nstack.in/v1/todos?page=1&limit=20';
    final uri = Uri.parse(url);
    final respond = await http.get(uri);
    if (respond.statusCode == 200 || respond.statusCode == 201) {
      final json = jsonDecode(respond.body) as Map;
      final result = json['items'] as List;
      print(respond.body);
      print(respond.statusCode);
      setState(() {
        items = result;
      });
    }
    setState(() {
      isLoading = false;
    });
// final json = jsonDecode(result.body);
//
// final
  }
}
