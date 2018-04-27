import 'package:flutter/material.dart';

class TextWithBorder extends StatelessWidget {

  final String text;
  double maxWidth;

  TextWithBorder(this.text, {this.maxWidth=100.0});

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Text(this.text, style: new TextStyle(fontSize: 13.0), overflow: TextOverflow.ellipsis,),
      padding: new EdgeInsets.fromLTRB(4.0, 1.0, 4.0, 1.0),
      decoration: new BoxDecoration(
        border: new Border.all(),
        borderRadius: new BorderRadius.all(new Radius.circular(8.0))
      ), constraints: new BoxConstraints(maxWidth:this.maxWidth),

    );
  }
}