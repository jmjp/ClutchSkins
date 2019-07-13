import 'dart:convert';

import 'package:clutchskins/src/models/login.dart';
import 'package:clutchskins/src/models/riffaNumbers.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
import '../models/account.dart';
import '../models/rifa.dart';

String baseUrl = "https://clutchskins.herokuapp.com/api";

Future<void> renewToken() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.post(baseUrl+'/users/renew',headers: {
      "token": prefs.getString('token')
    });
    final login = loginFromJson(response.body);
    prefs.setString('token', login.token);
}
Future<List<RiffaNumbers>> getNumbers(String id) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.get(baseUrl+'/joinraffle/'+id+'/',headers: {
      "token": prefs.getString('token')
    });
    if(response.statusCode == 200){
      return riffaNumbersFromJson(response.body);
    }else{
      throw Exception(response.statusCode);
    }
}
Future<Riffa> getRaffle(String id) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.get(baseUrl+'/raffle/view/'+id+'/',headers: {
      "token": prefs.getString('token')
    });
    if(response.statusCode == 200){
      return Riffa.fromJson(json.decode(response.body));
    }else{
      throw Exception(response.statusCode);
    }
}
void logout() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('token');
}

Future<bool> login(String user, String pass) async {
    Map data = {
      'username': user,
      'password': pass
    };
    //encode Map to JSON
    var bodyJson = json.encode(data);

    var response = await http.post(baseUrl+'/users/login',
        headers: {"Content-Type": "application/json"},
        body: bodyJson
    );
    if(response.statusCode == 200){
      final login = loginFromJson(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', login.token);
      return true;
    }
    return false;
  }

Future<Account> getAccount() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final response = await http.post(baseUrl+"/user/myprofile",
    headers: {"token": prefs.getString('token')},
  );
  if(response.statusCode == 200){
    final account = Account.fromJson(json.decode(response.body));
    return account;
  }else{
    throw Exception(response.statusCode);
  }

}

Future<List<Riffa>> getRifas() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var response = await http.post(baseUrl+"/raffle",
    headers: {"token": prefs.getString('token')},
  );
  if(response.statusCode == 200){
    return riffaFromJson(response.body);
  }else{
    throw Exception("Error");
  }

}

