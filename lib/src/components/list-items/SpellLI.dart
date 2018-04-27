import 'package:flutter/material.dart';
import '../../helpers.dart';
import '../../models/SrdCategory.dart';
import './SrdCategoryItemLI.dart';
import './SrdCategoryItemLITemplate.dart';
import './items/TextWithBorder.dart';
import './items/LetterCircle.dart';

class SpellLI extends SrdCategoryItemLI {


  SpellLI(SrdCategoryItem srdCategoryItem) : super(srdCategoryItem);

  @override
  Widget build(BuildContext context) { 
    return new SrdCategoryItemLITemplate(
      srdCategoryItem.name,
      trailingWidth: 170.0,
      leading1: new Text(srdCategoryItem.data['Classes'], overflow: TextOverflow.ellipsis),
      leading2: new Row( children: this.getTrailing3()),
      
      trailing1: new Text(Helpers.formatCountingNumber(srdCategoryItem.data['Level'])),
      trailing2: new Text(srdCategoryItem.data['Range']),
      trailing3: this.getVSMNodes()
    );
    
  }

  Widget getVSMNodes(){
    
    List<Widget> nodes = [new Expanded(child: new Text("")), new TextWithBorder(srdCategoryItem.data['Casting Time'].toString().split(',')[0])];
    if(this.srdCategoryItem.data['Components'] != null){
      nodes.add(new Container(width: 5.0,));
      if(this.srdCategoryItem.data['Components'].contains('V')) nodes.add(new LetterCircle('V'));
      if(this.srdCategoryItem.data['Components'].contains('S')) nodes.add(new LetterCircle('S'));
      if(this.srdCategoryItem.data['Components'].contains('M')) nodes.add(new LetterCircle('M'));
    }
    return new Row(
      children: nodes,
    );
  }

  List<Widget> getTrailing3(){
    List<Widget> trailing3 =  [TextWithBorder(Helpers.capitalize(srdCategoryItem.data['School']))];
    trailing3.addAll(this.getCRNodes());
    return trailing3;
  }

  List<Widget> getCRNodes(){
    List<Widget> nodes = [new Container(width: 5.0,)];
    if(this.srdCategoryItem.data['Ritual'] != null){
      nodes.add(new LetterCircle('R'));
    }
    if(this.srdCategoryItem.data['Concentration'] != null){
      nodes.add(new LetterCircle('C'));
    }
    return nodes;
  }
}