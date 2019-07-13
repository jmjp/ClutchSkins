// To parse this JSON data, do
//
//     final account = accountFromJson(jsonString);

import 'dart:convert';

Account accountFromJson(String str) => Account.fromJson(json.decode(str));

String accountToJson(Account data) => json.encode(data.toJson());

class Account {
    int points;
    String steamtrade;
    String id;
    String username;
    String password;
    String email;
    DateTime createdAt;
    int v;

    Account({
        this.points,
        this.steamtrade,
        this.id,
        this.username,
        this.password,
        this.email,
        this.createdAt,
        this.v,
    });

    factory Account.fromJson(Map<String, dynamic> json) => new Account(
        points: json["points"],
        steamtrade: json["steamtrade"],
        id: json["_id"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "points": points,
        "steamtrade": steamtrade,
        "_id": id,
        "username": username,
        "password": password,
        "email": email,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
    };
}
