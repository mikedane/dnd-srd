import 'package:flutter/material.dart';
import '../../models/SrdCategory.dart';
import './SrdCategoryItemLI.dart';
import './items/TextWithBorder.dart';
import './SrdCategoryItemLIOneColumn.dart';
import './SrdCategoryItemLITemplate.dart';
import '../../helpers.dart';

import './items/LetterCircle.dart';

class ArmorLI extends SrdCategoryItemLI {

  ArmorLI(SrdCategoryItem srdCategoryItem) : super(srdCategoryItem);

  @override
  Widget build(BuildContext context) {
    return new SrdCategoryItemLITemplate(
      srdCategoryItem.name,
      trailingWidth: 75.0,
      leading1: new TextWithBorder(this.srdCategoryItem.data['Item Type'], maxWidth: 120.0,),
      leading2: new Text(this.srdCategoryItem.content.trim(), maxLines: 1, overflow: TextOverflow.ellipsis,),
      trailing2: new Text(Helpers.getAttribute(this.srdCategoryItem, 'Cost', emptyPlaceholder: "-- gp")),
      trailing1: new Text(Helpers.getAttribute(this.srdCategoryItem, 'Weight', emptyPlaceholder: "-- ") + ' lbs'),
      trailing3: new Row(
        children: <Widget>[
          new Expanded(child: new Text("")), 
          new Text('AC'), new Container(width: 3.0), 
          new LetterCircle(Helpers.getAttribute(this.srdCategoryItem, 'AC', emptyPlaceholder: "-")) 
        ],
      )
    );
  }

  Widget getAC(){
    List<Widget> nodes = [new Expanded(child: new Text(""))];

    if(this.srdCategoryItem.data['AC'] != null){
     nodes.addAll([new Text('AC'), new Container(width: 3.0), new LetterCircle(this.srdCategoryItem.data['AC']) ]);
    }
    return new Row(children: nodes,);
  }

  
  

}