import 'dart:ui';

import 'package:clutchskins/src/models/rifa.dart';
import 'package:clutchskins/src/widgets/RiffaNumbers.dart';
import 'package:flutter/material.dart';


class RafflePage extends StatefulWidget{
 final Riffa myRiffa;
  _RafflePage createState() => _RafflePage();
  RafflePage({Key key, @required this.myRiffa}) : super(key: key);
}

class _RafflePage extends State<RafflePage>{
  @override
  void initState() {
    super.initState();
  }
 
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text(widget.myRiffa.itemName.toUpperCase()),
      centerTitle: true,
    ),
    body: Container(
      width: MediaQuery.of(context).size.width * 1,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.png'),
          fit: BoxFit.cover
        )
      ),
      child: Column(
        children: <Widget>[
          Container(
            child: Image(
              image: NetworkImage(widget.myRiffa.imageUrl),
            ),
            height: 200,
            width: 200,
          ),
          Container(
            child:ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.26,
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: new BoxDecoration(
                    color: Colors.grey.shade700.withOpacity(0.5),
                    border: Border(top: BorderSide(color: Colors.deepOrange,width: 5)),

                ),
                child: RiffaNumberWidget(riffa: widget.myRiffa)
              ),
            ),
          )
          ),
        ],
      )
    )

  );
}
}