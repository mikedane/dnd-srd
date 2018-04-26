import 'package:flutter/material.dart';
import '../../models/SrdCategory.dart';
import './SrdCategoryItemView.dart';

class ClassView extends SrdCategoryItemView {


  ClassView(SrdCategoryItem srdCategoryItem) : super(srdCategoryItem);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(srdCategoryItem.name),
    );
  }
}