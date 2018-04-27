import 'package:flutter/material.dart';
import '../../models/SrdCategory.dart';
import './SrdCategoryItemLI.dart';
import './SrdCategoryItemLITemplate.dart';
import '../../helpers.dart';

class AdventuringGearLI extends SrdCategoryItemLI {

  AdventuringGearLI(SrdCategoryItem srdCategoryItem) : super(srdCategoryItem);

  @override
  Widget build(BuildContext context) {
    return new SrdCategoryItemLITemplate(
      srdCategoryItem.name,
      trailingWidth: 55.0,
      leading1: new Text(this.getContentString(), maxLines: 2, overflow: TextOverflow.ellipsis,),
      trailing2: new Text(Helpers.getAttribute(this.srdCategoryItem, 'Cost', emptyPlaceholder: "-- gp")),
      trailing1: new Text(Helpers.getAttribute(this.srdCategoryItem, 'Weight', emptyPlaceholder: "-- ") + ' lbs'),
    );
  }

  String getContentString(){
    if(this.srdCategoryItem.content.length > 0 && !this.srdCategoryItem.content.contains('Includes:')){
      return this.srdCategoryItem.content.replaceAll('*', '');
    }
    return "Common equipment frequently used  by adventurers.";
  }

}