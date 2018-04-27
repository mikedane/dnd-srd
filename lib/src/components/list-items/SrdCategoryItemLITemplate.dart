import 'package:flutter/material.dart';

class SrdCategoryItemLITemplate extends StatelessWidget {
  final String title;
  final Widget leading1;
  final Widget leading2;

  final Widget trailing1;
  final Widget trailing2;
  final Widget trailing3;
  double trailingWidth;

  SrdCategoryItemLITemplate(this.title, {this.leading1, this.leading2, this.trailingWidth=100.0, this.trailing1, this.trailing2, this.trailing3});

  @override
  Widget build(BuildContext context){
    return new Container(
      padding: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: this.getLeadingChildren(),
            ),
          ),
          new Container(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: this.getTrailingChildren()
            ), width: this.trailingWidth
          )
        ],
      )
    );
  }


  List<Widget> getLeadingChildren(){
    List<Widget> results = [];

    results.add(
      new Text(this.title,
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

  List<Widget> getTrailingChildren(){
    List<Widget> results = [];
    if(this.trailing1 != null){
      results.add(this.trailing1);
    } else if (this.trailing2 != null || this.trailing3 != null){
      results.add(
        new Text(""),
      );
    } 
    if(this.trailing2 != null){
      results.add(this.trailing2);
    } else if (this.trailing3 != null){
      results.add(
        new Text(""),
      );
    } 
    if(this.trailing3 != null){
      results.add(this.trailing3);
    }
    return results;
  }
}