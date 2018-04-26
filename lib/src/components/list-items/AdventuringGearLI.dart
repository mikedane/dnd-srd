import 'package:flutter/material.dart';
import '../../models/SrdCategory.dart';
import './SrdCategoryItemLI.dart';

class AdventuringGearLI extends SrdCategoryItemLI {

  AdventuringGearLI(SrdCategoryItem srdCategoryItem) : super(srdCategoryItem);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(this.srdCategoryItem.name),
    );
  }
}