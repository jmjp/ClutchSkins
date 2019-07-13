
// To parse this JSON data, do
//
//     final riffaNumbers = riffaNumbersFromJson(jsonString);

import 'dart:convert';

List<RiffaNumbers> riffaNumbersFromJson(String str) => new List<RiffaNumbers>.from(json.decode(str).map((x) => RiffaNumbers.fromJson(x)));

String riffaNumbersToJson(List<RiffaNumbers> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class RiffaNumbers {
    String id;
    int number;

    RiffaNumbers({
        this.id,
        this.number,
    });

    factory RiffaNumbers.fromJson(Map<String, dynamic> json) => new RiffaNumbers(
        id: json["_id"],
        number: json["number"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "number": number,
    };
}
