import 'package:flutter/material.dart';
import '../../helpers.dart';
import '../../models/SrdCategory.dart';
import './SrdCategoryItemView.dart';

class MonsterView extends SrdCategoryItemView {


  MonsterView(SrdCategoryItem srdCategoryItem) : super(srdCategoryItem);

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
           
          ],
        ),
        new Expanded(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
            
            ],
          ),
        )
      ],
    );
  }
}