import 'package:flutter/material.dart';
import '../../models/SrdCategory.dart';
import './SrdCategoryItemLI.dart';
import './SrdCategoryItemLITemplate.dart';
import './items/TextWithBorder.dart';
import '../../helpers.dart';

class PotionLI extends SrdCategoryItemLI {


  PotionLI(SrdCategoryItem srdCategoryItem) : super(srdCategoryItem);

  @override
  Widget build(BuildContext context) {
    return new SrdCategoryItemLITemplate(
      srdCategoryItem.name,
      trailingWidth: 0.0,
      leading1: new Text(this.getWeight() + Helpers.getAttributeFromContent(this.srdCategoryItem.content, "", ".") + '.', maxLines: 2),
    );
  }

  String getWeight(){
    String weight = '';
    if(this.srdCategoryItem.data['Weight'] != null){
      weight = '(' + this.srdCategoryItem.data['Weight'] + ' lbs) - ';
    }
    return weight;
  }
}