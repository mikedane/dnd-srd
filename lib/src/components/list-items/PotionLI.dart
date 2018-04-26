import 'package:flutter/material.dart';
import '../../models/SrdCategory.dart';
import './SrdCategoryItemLI.dart';

class PotionLI extends SrdCategoryItemLI {


  PotionLI(SrdCategoryItem srdCategoryItem) : super(srdCategoryItem);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(srdCategoryItem.name),
    );
  }
}