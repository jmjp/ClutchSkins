import 'dart:ui';

import 'package:clutchskins/src/services/api.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dashPage.dart';


class LoginPage extends StatefulWidget{

  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage>{
  String username;
  String password;
  

@override
Widget build(BuildContext context){
  return Scaffold(
    body: Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
              color: Colors.deepOrange,
              image: DecorationImage(image: NetworkImage('http://www.accomodations.asia/bigimg/104/1041557_csgo-hyper-beast-wallpaper.jpg'),
                  fit: BoxFit.cover

              )
          ),
        ),
         Center(
          child: Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * 0.93,
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 30, 30, 30),
              border: Border(top: BorderSide(color: Colors.deepOrange, width: 5)),
              boxShadow: [BoxShadow(
                color: Colors.black,
                offset: Offset.zero,
                blurRadius: 10.0,
                spreadRadius: 4,
              )]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 70,
                  width: 100,
                  
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Usuario',
                    labelStyle: TextStyle(color: Colors.orangeAccent),
                    border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange))
                  ),
                  onChanged: (text){
                    setState(() {
                     username = text; 
                    });
                  },
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: TextStyle(color: Colors.orangeAccent),
                    border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange))
                  ),
                  onChanged: (text){
                    setState(() {
                      password = text;
                    });
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 10,bottom: 5),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child:  RaisedButton(
                  color: Colors.deepOrange,
                  child: Text('LOGIN'),
                  onPressed: () async {
                    if(username != null && password != null){
                      bool _isLogged = await login(username, password);
                      if(_isLogged == true){
                        return Navigator.pushReplacement(context, new MaterialPageRoute(builder: (BuildContext context) => DashPage()));
                      }else{
                        return Fluttertoast.showToast(msg:'Verifique seu usuario e senha');
                      }
                    }
                  },
                ),
                ),
                InkWell(
                  child: Text('Não possui uma conta? Crie agora!'),
                  onTap: (){

                  },
                )
              ],
            ),
          ),
        ),
      ],
    )
  );
}



}