import 'package:flutter/material.dart';
import '../../models/SrdCategory.dart';
import './SrdCategoryItemView.dart';

class MiscItemView extends SrdCategoryItemView {


  MiscItemView(SrdCategoryItem srdCategoryItem) : super(srdCategoryItem);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(srdCategoryItem.name),
    );
  }
}