import 'dart:ui';

import 'package:clutchskins/src/models/rifa.dart';
import 'package:clutchskins/src/models/riffaNumbers.dart';
import 'package:clutchskins/src/services/api.dart';
import 'package:flutter/material.dart';


class RiffaNumberWidget extends StatefulWidget{
  final Riffa riffa;
  _RiffaNumberWidget createState() => _RiffaNumberWidget();
  RiffaNumberWidget({Key key, @required this.riffa}) : super(key: key);
}

class _RiffaNumberWidget extends State<RiffaNumberWidget>{
  final List<int> numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RiffaNumbers>>(
      future: getNumbers(widget.riffa.id),
      builder: (context,snapshot){
        if(snapshot.hasData){
          for(int i = 1; i < snapshot.data.length; i++){
            numbers.remove(snapshot.data[i].number);
          }
          return GridView.builder(
            itemCount: numbers.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
            itemBuilder: (ctx,int index){
              return Container(
                margin: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(0.6)),
                  color: Colors.black.withOpacity(0.6)
                ),
                child: InkWell(
                  child: Center(child: Text(numbers[index].toString())),
                  onTap: (){
                    print(numbers[index]);
                  },
                ),
              );
            },
          );
        }else if(snapshot.hasError){
          return Text("Error");
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}