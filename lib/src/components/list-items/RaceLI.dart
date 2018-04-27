import 'package:flutter/material.dart';
import '../../models/SrdCategory.dart';
import './SrdCategoryItemLI.dart';
import './items/TextWithBorder.dart';
import './SrdCategoryItemLITemplate.dart';
import '../../helpers.dart';

class RaceLI extends SrdCategoryItemLI {


  RaceLI(SrdCategoryItem srdCategoryItem) : super(srdCategoryItem);

  @override
  Widget build(BuildContext context) {
    return new SrdCategoryItemLITemplate(
      srdCategoryItem.name,
      trailing1: new Text(Helpers.getAttributeFromContent(this.srdCategoryItem.content, "Your base walking speed is ", ".")),
      leading2: new TextWithBorder(Helpers.getAttributeFromContent(this.srdCategoryItem.content, "Your size is ", ".")),
      leading1: new Text(Helpers.getAttributeFromContent(this.srdCategoryItem.content, 'You can speak, read, and write ', '.'), overflow: TextOverflow.ellipsis,)
    );
  }



}