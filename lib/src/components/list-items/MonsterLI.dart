import 'package:flutter/material.dart';
import '../../helpers.dart';
import '../../models/SrdCategory.dart';
import './SrdCategoryItemLI.dart';
import './items/TextWithBorder.dart';
import './SrdCategoryItemLITemplate.dart';

class MonsterLI extends SrdCategoryItemLI {


  MonsterLI(SrdCategoryItem srdCategoryItem) : super(srdCategoryItem);

  @override
  Widget build(BuildContext context) {

    return new SrdCategoryItemLITemplate(
      srdCategoryItem.name,
      leading1: new Text('CR ' + srdCategoryItem.data['Challenge Rating'] + ' - ' + srdCategoryItem.data['data-XP'] + ' XP'),
      leading2: new TextWithBorder(Helpers.capitalize(srdCategoryItem.data['Type']).toString().split(' ')[0]),
      
      trailing1: new Text(srdCategoryItem.data['Size']),
      trailing2: new Text(Helpers.capitalize(srdCategoryItem.data['Alignment']), overflow: TextOverflow.ellipsis),
    );

  }
}