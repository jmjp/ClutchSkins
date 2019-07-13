import 'package:clutchskins/src/widgets/RiffaFrosted.dart';
import 'package:flutter/material.dart';
import '../models/rifa.dart';
import '../services/api.dart';


class IndexPage extends StatelessWidget{
Widget build(BuildContext context){
  return FutureBuilder<List<Riffa>>(
    future: getRifas(),
    builder: (context, snapshot){
        if(snapshot.hasData){
           return new ListView.builder(
             itemCount: snapshot.data.length,
             itemBuilder: (ctx,int index){
               return Container(
                 child: RiffaCardFrosted(myRiffa: snapshot.data[index]),
               );
             },
           );
        }else if(snapshot.hasError){
          return Text("Houve um problema");
        }
        return Center(child: CircularProgressIndicator());
    },
  );
}

}