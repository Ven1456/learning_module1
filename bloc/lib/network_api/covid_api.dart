import 'dart:convert';
import 'dart:core';

import 'package:bloc/model/covid_model.dart';
import 'package:http/http.dart' as http;

class CovidApi
{
 Future<List<CovidModel>> getLatestCovidData()async {
   try {
     var data = await http.get(Uri.parse("https://api.covid19api.com/summary"));
     return (json.decode(data.body) ["Countries"] as List)
         .map((e) => CovidModel.fromJSON(e)).toList();
   }
   catch (e)
   {
     throw Exception(e);
   }
 }

}