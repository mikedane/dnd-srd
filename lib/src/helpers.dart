import 'package:flutter/material.dart';
import './models/SrdCategory.dart';

class Helpers {
  static capitalize(String s){
    return s[0].toUpperCase() + s.substring(1);
  }

  static formatCountingNumber(String number){
    switch(number){
      case '1':
        return number.toString() + 'st';
        break;
      case '2':
        return number.toString() + 'nd';
        break;
      case '3': 
        return number.toString() + 'rd';
        break;
      default:
        return number.toString() + 'th';
    }
  }

  static String getAttributeFromContent(String content, String baseString, String endString){
    int startIndex = content.toLowerCase().indexOf(baseString.toLowerCase()) + baseString.length;
    int endIndex = content.toLowerCase().substring(startIndex).indexOf(endString.toLowerCase()) + startIndex;
    return content.substring(startIndex, endIndex);
  }

  static String getAttribute(SrdCategoryItem srdCategoryItem, String targetAttribute, {String emptyPlaceholder = ""}){
    String result = emptyPlaceholder;
    if(srdCategoryItem.data[targetAttribute] != null){
     result = srdCategoryItem.data[targetAttribute];
    }
    return result;
  }

}