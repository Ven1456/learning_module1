// import 'dart:convert';
// import 'dart:js';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
//
// // Update Data
//
// import 'package:flutter/cupertino.dart';
//
// TextEditingController titleController = TextEditingController();
// TextEditingController descriptionController = TextEditingController();
// bool isEdit = false;
//
//
// class UpdateData
// {
//   Future<void> UpdatedData() async {
//     final todo = widget.todo;
//     if (todo == null) {
//       print("No Updated data");
//       return;
//     }
//     final id = todo["_id"];
//     final title = titleController.text;
//     final description = descriptionController.text;
//     final body = {
//       "title": title,
//       "description": description,
//       "is_completed": false,
//     };
//     final url = "https://api.nstack.in/v1/todos/$id";
//     final uri = Uri.parse(url);
//     final respond = await http.put(uri,
//         body: jsonEncode(body), headers: {"Content-Type": "application/json"});
//     if (respond.statusCode == 200) {
//       showSuccessSnackBar("Updating Successfully");
//     } else {
//       showErrorSnackBar("Updating Failed");
//     }
//   }
//
// }
//
// // submitted Data
//
// Future<void> UpdatedData() async {
//   final todo = widget.todo;
//   if (todo == null) {
//     print("No Updated data");
//     return;
//   }
//   final id = todo["_id"];
//   final title = titleController.text;
//   final description = descriptionController.text;
//   final body = {
//     "title": title,
//     "description": description,
//     "is_completed": false,
//   };
//   final url = "https://api.nstack.in/v1/todos/$id";
//   final uri = Uri.parse(url);
//   final respond = await http.put(uri,
//       body: jsonEncode(body), headers: {"Content-Type": "application/json"});
//   if (respond.statusCode == 200) {
//     showSuccessSnackBar("Updating Successfully");
//   } else {
//     showErrorSnackBar("Updating Failed");
//   }
// }
//
// //snackbar
//
//
//
