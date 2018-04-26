import 'package:flutter/material.dart';
import '../../helpers.dart';
import '../../models/SrdCategory.dart';
import './SrdCategoryItemLI.dart';

class SpellLI extends SrdCategoryItemLI {


  SpellLI(SrdCategoryItem srdCategoryItem) : super(srdCategoryItem);

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Expanded(
          child:
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Text(srdCategoryItem.name),
            new Text(srdCategoryItem.data['Classes'], overflow: TextOverflow.ellipsis),
            new Text(Helpers.capitalize(srdCategoryItem.data['School'])),
          ],
        ),
        ),
        new Expanded(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Text(Helpers.formatCountingNumber(srdCategoryItem.data['Level'])),
              new Text(srdCategoryItem.data['Range']),
              this.getVSMNodes(),
            ],
          ),
        )
      ],
    );
  }

  Widget getVSMNodes(){
    
    List<Widget> nodes = [new Expanded(child: new Text("")), new Text(srdCategoryItem.data['Casting Time'].toString().split(',')[0])];
    if(this.srdCategoryItem.data['Components'] != null){
      if(this.srdCategoryItem.data['Components'].contains('V')) nodes.add(new Text('V'));
      if(this.srdCategoryItem.data['Components'].contains('S')) nodes.add(new Text('S'));
      if(this.srdCategoryItem.data['Components'].contains('M')) nodes.add(new Text('M'));
    }
    return new Row(
      children: nodes,
    );
  }
}