import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddItem extends StatefulWidget {
  final Map? todo;
  const AddItem({
    super.key,
    this.todo,
  });

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isEdit = false;
  @override
  void initState() {
    super.initState();
    final todo = widget.todo;
    if (todo != null) {
      isEdit = true;

      final title = todo["title"];
      final decription = todo["description"];
      titleController.text = title;
      descriptionController.text = decription;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? "Edit Items " : "Add Items"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "Title",
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: "Description",
              ),
              keyboardType: TextInputType.multiline,
              maxLines: 6,
              minLines: 4,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  onPressed: isEdit ? UpdatedData : SubmitData,
                  child: Text(isEdit ? "Update" : "Submit")),
            )
          ],
        ),
      ),
    );
  }

// update data
  Future<void> UpdatedData() async {
    final todo = widget.todo;
    if (todo == null) {
      print("No Updated data");
      return;
    }
    final id = todo["_id"];
    final title = titleController.text;
    final description = descriptionController.text;
    final body = {
      "title": title,
      "description": description,
      "is_completed": false,
    };
    final url = "https://api.nstack.in/v1/todos/$id";
    final uri = Uri.parse(url);
    final respond = await http.put(uri,
        body: jsonEncode(body), headers: {"Content-Type": "application/json"});
    if (respond.statusCode == 200) {
      showSuccessSnackBar("Updating Successfully");
    } else {
      showErrorSnackBar("Updating Failed");
    }
  }

// submi data
  Future<void> SubmitData() async {
    // given data here
    final title = titleController.text;
    final description = descriptionController.text;
    final body = {
      "title": title,
      "description": description,
      "is_completed": false
    };

    //submit data to serve
    final url = "https://api.nstack.in/v1/todos";
    final uri = Uri.parse(url);
    final respond = await http.post(uri,
        body: jsonEncode(body), headers: {"Content-Type": "application/json"});
    if (respond.statusCode == 201 || respond.statusCode == 200) {
      titleController.text = '';
      descriptionController.text = '';
      print("Creation Successfull ${respond.body}");
      showSuccessSnackBar("Created Successfully");
    } else {
      print("Creation Failed");
      showErrorSnackBar("Creation failed");
    }
  }

  // snackbar

  void showSuccessSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.white,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showErrorSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
