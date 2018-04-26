import 'package:flutter/material.dart';
import '../../models/SrdCategory.dart';
import './SrdCategoryItemLI.dart';


class ArmorLI extends SrdCategoryItemLI {

  ArmorLI(SrdCategoryItem srdCategoryItem) : super(srdCategoryItem);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(this.srdCategoryItem.name),
    );
  }
}