import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final scrollcontrolller = ScrollController();
  List post=[];
  bool isLoading = false;
  int page=1;
  @override
  void initState()
  {
    super.initState();
    scrollcontrolller.addListener(_scrollListener);
    fetchdata();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("Pagenation"),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        controller: scrollcontrolller,
        itemCount: isLoading ? post.length +1  : post.length,
          itemBuilder: (context,index)
      {

        if(index < post.length)
          {
            final posts = post[index];
            final title = posts["title"] ["rendered"];
            final author = posts["author"];
            return Card(
              child: ListTile(
                leading: CircleAvatar( child: Text("${index + 1} ".toString())),
                title: Text('$title',maxLines: 2,),
                subtitle: Text("$author",maxLines: 4,),
              ),
            );
          }
        else
          {
            return const Center(child: CircularProgressIndicator());
          }

      }
      )
    );
  }
  Future<void> fetchdata() async{
    final url  = "https://techcrunch.com/wp-json/wp/v2/posts?context=embed&per_page=10&$page";
    print(url);
     final uri = Uri.parse(url);
    final response = await http.get(uri);

    if(response.statusCode==200)
      {
        final json= jsonDecode(response.body);
        setState(() {
          post= post + json;
        });

      }
    // else
    //   {
    //     print("Something Went Wrong");
    //   }

  }

 Future <void> _scrollListener () async
  {
    if (isLoading) return;
   if(scrollcontrolller.position.pixels != scrollcontrolller.position.maxScrollExtent)
     {
       setState((){
         isLoading = true;

       });
       page= page+1;
       await  fetchdata();
        setState(() {
         isLoading=false;
       });
     }
   // else
   //   {
   //     print("Do not  Called");
   //   }
  }
}

