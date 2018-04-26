import 'package:flutter/material.dart';
import '../../models/SrdCategory.dart';

// List Items
import './MonsterLI.dart';
import './SpellLI.dart';
import './ClassLI.dart';
import './RaceLI.dart';
import './PotionLI.dart';
import './AdventuringGearLI.dart';
import './ArmorLI.dart';
import './MiscItemLI.dart';
import './WeaponLI.dart';

abstract class SrdCategoryItemLI extends StatelessWidget {
  final SrdCategoryItem srdCategoryItem;

  SrdCategoryItemLI(this.srdCategoryItem);

    static Widget getListItemForCategory(SrdCategoryItem categoryItem){
    switch(categoryItem.categoryId){
      case 'monsters':
        return new MonsterLI(categoryItem);
        break;
      case 'spells':
        return new SpellLI(categoryItem);
        break;
      case 'classes':
        return new ClassLI(categoryItem);
        break;
      case 'races':
        return new RaceLI(categoryItem);
        break;
      case 'potions':
        return new PotionLI(categoryItem);
        break;
      case 'adventuring-gear':
        return new AdventuringGearLI(categoryItem);
        break;
      case 'armor':
        return new ArmorLI(categoryItem);
        break;
      case 'weapons':
        return new WeaponLI(categoryItem);
        break;
      case 'misc-items':
        return new MiscItemLI(categoryItem);
        break;
    }
    return new Text('Jews');
  }
}