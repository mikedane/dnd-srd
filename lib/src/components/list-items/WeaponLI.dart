import 'package:flutter/material.dart';
import '../../models/SrdCategory.dart';
import './SrdCategoryItemLI.dart';
import './items/TextWithBorder.dart';
import './SrdCategoryItemLITemplate.dart';
import '../../helpers.dart';

class WeaponLI extends SrdCategoryItemLI {


  WeaponLI(SrdCategoryItem srdCategoryItem) : super(srdCategoryItem);

  @override
  Widget build(BuildContext context) {
    return new SrdCategoryItemLITemplate(
      srdCategoryItem.name,
      // trailingWidth: 100.0,
      leading1: new TextWithBorder(this.srdCategoryItem.data['Item Type'], maxWidth: 120.0,),
      leading2: new Text(Helpers.getAttribute(this.srdCategoryItem, 'Damage', emptyPlaceholder: "No Damage Info")),
      trailing1: new Text(Helpers.getAttribute(this.srdCategoryItem, 'Weight', emptyPlaceholder: "-- ") + ' lbs'),
      trailing2: new Text(Helpers.getAttribute(this.srdCategoryItem, 'Cost', emptyPlaceholder: "-- gp")),
      trailing3: new TextWithBorder(Helpers.getAttribute(this.srdCategoryItem, 'Damage Type', emptyPlaceholder: "Regular")),
    );
  }

}