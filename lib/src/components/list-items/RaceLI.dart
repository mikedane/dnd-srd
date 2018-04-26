import 'package:flutter/material.dart';
import '../../models/SrdCategory.dart';
import './SrdCategoryItemLI.dart';

class RaceLI extends SrdCategoryItemLI {


  RaceLI(SrdCategoryItem srdCategoryItem) : super(srdCategoryItem);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(srdCategoryItem.name),
    );
  }
}