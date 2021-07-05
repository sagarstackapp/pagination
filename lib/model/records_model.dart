// To parse this JSON data, do
//
//     final recordsModel = recordsModelFromJson(jsonString);

import 'dart:convert';

List<RecordsModel> recordsModelFromJson(String str) => List<RecordsModel>.from(
    json.decode(str).map((x) => RecordsModel.fromJson(x)));

String recordsModelToJson(List<RecordsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecordsModel {
  int? userId;
  int? id;
  String? title;

  RecordsModel({
    this.userId,
    this.id,
    this.title,
  });

  factory RecordsModel.fromJson(Map<String, dynamic> json) => RecordsModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
      };
}
