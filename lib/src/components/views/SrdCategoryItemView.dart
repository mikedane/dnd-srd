import 'package:flutter/material.dart';
import '../../models/SrdCategory.dart';

// Views
import './MonsterView.dart';
import './SpellView.dart';
import './ClassView.dart';
import './RaceView.dart';
import './PotionView.dart';
import './AdventuringGearView.dart';
import './ArmorView.dart';
import './MiscItemView.dart';
import './WeaponView.dart';


abstract class SrdCategoryItemView extends StatelessWidget {
  final SrdCategoryItem srdCategoryItem;
  SrdCategoryItemView(this.srdCategoryItem);

  static Widget getItemForCategory(SrdCategoryItem categoryItem){
    switch(categoryItem.categoryId){
      case 'monsters':
        return new MonsterView(categoryItem);
        break;
      case 'spells':
        return new SpellView(categoryItem);
        break;
      case 'classes':
        return new ClassView(categoryItem);
        break;
      case 'races':
        return new RaceView(categoryItem);
        break;
      case 'potions':
        return new PotionView(categoryItem);
        break;
      case 'adventuring-gear':
        return new AdventuringGearView(categoryItem);
        break;
      case 'armor':
        return new ArmorView(categoryItem);
        break;
      case 'weapons':
        return new WeaponView(categoryItem);
        break;
      case 'misc-items':
        return new MiscItemView(categoryItem);
        break;
    }
    return null;
  }
}