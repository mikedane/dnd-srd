import 'package:flutter/material.dart';
import '../../models/SrdCategory.dart';
import './SrdCategoryItemLI.dart';
import './items/TextWithBorder.dart';
import './SrdCategoryItemLITemplate.dart';

class ClassLI extends SrdCategoryItemLI {


  ClassLI(SrdCategoryItem srdCategoryItem) : super(srdCategoryItem);

  @override
  Widget build(BuildContext context) {
    return new SrdCategoryItemLITemplate(
      srdCategoryItem.name,
      leading1: new Text('Saving Throws:', style: new TextStyle(fontWeight: FontWeight.w500 )),
      leading2: new Text(srdCategoryItem.data['Saving Throws'], style: new TextStyle(fontStyle: FontStyle.italic)),//new Text(srdCategoryItem.data['Saving Throws'], overflow: TextOverflow.ellipsis, style: new TextStyle(),),
      
      trailing1: new Row(children: <Widget>[new Expanded(child: new Text('')), new Text('Hit Dice'), new Container(width: 5.0,), new TextWithBorder(this.srdCategoryItem.data['Hit Dice'])],)
    );
  }
}