import 'package:flutter/material.dart';
import '../../models/SrdCategory.dart';
import './SrdCategoryItemView.dart';

class AdventuringGearView extends SrdCategoryItemView {


  AdventuringGearView(SrdCategoryItem srdCategoryItem) : super(srdCategoryItem);

  @override
  Widget build(BuildContext context) {
    print("Dg");
    return new Text("J");
  }
}