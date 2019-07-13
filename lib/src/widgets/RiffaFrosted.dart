import 'dart:ui';

import 'package:flutter/material.dart';
import '../models/rifa.dart';
import '../pages/rafflePage.dart';

class RiffaCardFrosted extends StatefulWidget{
  final Riffa myRiffa;
  _RiffaCard createState() => _RiffaCard();
  RiffaCardFrosted({Key key, @required this.myRiffa}) : super(key: key);
}

class _RiffaCard extends State<RiffaCardFrosted>{
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      overflow: Overflow.visible,
      children: <Widget>[
        Positioned(
          top: 55,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.height * 0.5,
                decoration: new BoxDecoration(
                    color: Colors.grey.shade700.withOpacity(0.5),
                    border: Border(bottom: BorderSide(color: Colors.deepOrange,width: 5)),

                ),
                child: Column(children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 40),),
                  Text(widget.myRiffa.itemName.toUpperCase()),
                  Padding(padding: EdgeInsets.all(5),),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.07,
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
              ),
            ),
          )
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
          margin: EdgeInsets.only(top: 130,bottom: 45),
          
        )
      ],


    );
  }
}