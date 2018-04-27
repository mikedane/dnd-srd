import 'package:flutter/material.dart';
import '../../models/SrdCategory.dart';
import './SrdCategoryItemLI.dart';
import './SrdCategoryItemLITemplate.dart';
import '../../helpers.dart';

class MiscItemLI extends SrdCategoryItemLI {


  MiscItemLI(SrdCategoryItem srdCategoryItem) : super(srdCategoryItem);

  @override
  Widget build(BuildContext context) {
    return new SrdCategoryItemLITemplate(
      srdCategoryItem.name,
      trailingWidth: 0.0,
      leading1: new Text(this.srdCategoryItem.content, maxLines: 2, overflow: TextOverflow.ellipsis,),
      
    );
  }
}