// To parse this JSON data, do
//
//     final genderModel = genderModelFromJson(jsonString);

import 'dart:convert';
import 'dart:ui';

List<GenderModel> genderModelFromJson(String str) => List<GenderModel>.from(
    json.decode(str).map((x) => GenderModel.fromJson(x)));

String genderModelToJson(List<GenderModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GenderModel {
  GenderModel({
    this.count,
    this.gender,
    this.name,
    this.probability,
    this.color,
  });

  int? count;
  String? gender;
  String? name;
  double? probability;
  Color? color;

  factory GenderModel.fromJson(Map<String, dynamic> json) => GenderModel(
        count: json["count"],
        gender: json["gender"],
        name: json["name"],
        probability: json["probability"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "gender": gender,
        "name": name,
        "probability": probability,
      };
}


