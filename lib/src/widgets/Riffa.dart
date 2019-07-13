import 'dart:ui';

import 'package:flutter/material.dart';
import '../models/rifa.dart';
import '../pages/rafflePage.dart';

class RiffaCard extends StatefulWidget{
   final Riffa myRiffa;
  _RiffaCard createState() => _RiffaCard();
  RiffaCard({Key key, @required this.myRiffa}) : super(key: key);
}

class _RiffaCard extends State<RiffaCard>{
@override
Widget build(BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    overflow: Overflow.visible,
    children: <Widget>[
      Positioned(
        top: 55,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
              color: Color.fromRGBO(34, 34, 34, 1),
              border: Border(bottom: BorderSide(color: Colors.deepOrange,width: 5)),
              boxShadow: [BoxShadow(
                color: Colors.black,
                blurRadius: 15,
                offset: Offset(0, 1),
                spreadRadius: 1,
              )]
          ),
        ),
      ),
      Positioned(
        top: 0,
        child: Image(
            image: NetworkImage(widget.myRiffa.imageUrl),
            height: 120,
            width: 120,
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 110,bottom: 25),
        child: Column(
          children: <Widget>[
          Text(widget.myRiffa.itemName.toUpperCase()),
          Padding(padding: EdgeInsets.all(5),),
          Container(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepOrange, Colors.deepPurple]
            )
          ),
          child: InkWell(
            child: Center(child: Text("Participar por "+widget.myRiffa.priceNumber.toString()+" points")),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RafflePage(myRiffa: widget.myRiffa)),
              );
            },
          ),
        ),
        ],),
      )
    ],


  );
  }
}