// To parse this JSON data, do
//
//     final riffa = riffaFromJson(jsonString);

import 'dart:convert';

List<Riffa> riffaFromJson(String str) => new List<Riffa>.from(json.decode(str).map((x) => Riffa.fromJson(x)));

String riffaToJson(List<Riffa> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class Riffa {
  DateTime finishAt;
  dynamic winner;
  String imageUrl;
  String id;
  String itemName;
  int numbers;
  int priceNumber;
  DateTime createdAt;
  int v;

  Riffa({
    this.finishAt,
    this.winner,
    this.imageUrl,
    this.id,
    this.itemName,
    this.numbers,
    this.priceNumber,
    this.createdAt,
    this.v,
  });

  factory Riffa.fromJson(Map<String, dynamic> json) => new Riffa(
    finishAt: DateTime.parse(json["finishAt"]),
    winner: json["winner"],
    imageUrl: json["imageUrl"],
    id: json["_id"],
    itemName: json["itemName"],
    numbers: json["numbers"],
    priceNumber: json["priceNumber"],
    createdAt: DateTime.parse(json["createdAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "finishAt": finishAt.toIso8601String(),
    "winner": winner,
    "imageUrl": imageUrl,
    "_id": id,
    "itemName": itemName,
    "numbers": numbers,
    "priceNumber": priceNumber,
    "createdAt": createdAt.toIso8601String(),
    "__v": v,
  };
}
