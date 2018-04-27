import 'package:flutter/material.dart';

class SrdCategoryItemLIOneColumn extends StatelessWidget {
  final String title;
  final Widget leading1;
  final Widget leading2;

  SrdCategoryItemLIOneColumn(this.title, {this.leading1, this.leading2});

  @override
  Widget build(BuildContext context){
    return new Container(
      padding: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: this.getLeadingChildren(),
      ), 
    );
  }


  List<Widget> getLeadingChildren(){
    List<Widget> results = [];

    results.add(
      new Text(this.title,
        overflow: TextOverflow.ellipsis,
        style: new TextStyle(
        fontWeight: FontWeight.bold, fontSize: 15.0),),
    );

    if(this.leading1 != null){
      results.add(this.leading1);
    } else if (this.leading2 != null){
      results.add(
        new Text(""),
      );
    } 
    if(this.leading2 != null){
      results.add(this.leading2);
    }
  return results;
  }

  
}