import 'package:flutter/material.dart';

class LetterCircle extends StatelessWidget {
  
  final String letter;
  LetterCircle(this.letter);
 
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(child: new Text(this.letter, style: new TextStyle(fontSize: 13.0, color: Colors.white)),
      ),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.all(new Radius.circular(10.0)), 
        color: Colors.grey  
      ), 
      height: 20.0, 
      width: 20.0, 
    );
  }
}


    // return new Container(
    //   child: Text(this.letter, style: new TextStyle(fontSize: 13.0)),
      // padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      // decoration: new BoxDecoration(
      //   border: new Border.all(),
      //   borderRadius: new BorderRadius.all(new Radius.circular(40.0)), 
      // ), 
      // height: 20.0, 
      // width: 20.0,
    // );