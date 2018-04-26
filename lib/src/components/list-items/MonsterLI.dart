import 'package:flutter/material.dart';
import '../../helpers.dart';
import '../../models/SrdCategory.dart';
import './SrdCategoryItemLI.dart';

class MonsterLI extends SrdCategoryItemLI {


  MonsterLI(SrdCategoryItem srdCategoryItem) : super(srdCategoryItem);

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child:
           new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Text(srdCategoryItem.name,
                  overflow: TextOverflow.ellipsis,
                  style: new TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 15.0),),
                new Text('CR ' + srdCategoryItem.data['Challenge Rating'] + ' - ' + srdCategoryItem.data['data-XP'] + ' XP'),
                new Container(
                  child: new Text(Helpers.capitalize(srdCategoryItem.data['Type']).toString().split(' ')[0], style: new TextStyle(fontSize: 13.0)),
                  padding: new EdgeInsets.all(1.5),
                  decoration: new BoxDecoration(
                    border: new Border.all(),
                    borderRadius: new BorderRadius.all(new Radius.elliptical(2.0, 10.0))
                  )
                )
              ],
            ),
          ),
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Text(srdCategoryItem.data['Size']),
                new Text(Helpers.capitalize(srdCategoryItem.data['Alignment']), overflow: TextOverflow.ellipsis),
              ],
            ),
          )
        ],
      )
    );
  }
}