import 'dart:async';
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

class SrdCategory {

  String name;
  String id;
  List<SrdCategoryItem> categoryItems = [];
  List<SrdCategory> subCategories;
  List<SrdCategoryItemFilterField> filterFields;
  
  SrdCategory(this.name, this.id, this.filterFields);

  SrdCategory.loadData(this.name, this.id, this.filterFields){
    this._loadSRDCategoryFiles();
  }
  SrdCategory.withData(this.name, this.id, this.categoryItems, this.filterFields){
    this._populateFilterFieldOptions();
  }
  SrdCategory.withSubCategories(this.name, this.id, this.subCategories);

  void _populateFilterFieldOptions(){
    for(SrdCategoryItemFilterField filterField in this.filterFields){
      filterField.filterFieldOptions = this.getFilterOptions(filterField);
    }
  }

  String _getCategoryAssetPath(){
    String rootAssetPath = 'data/srd/';
    switch(this.id){
      case 'monsters':
        return rootAssetPath + 'Monsters.json';
      case 'spells':
        return rootAssetPath + 'Spells.json';
      case 'classes':
        return rootAssetPath + 'Classes.json';
      case 'races':
        return rootAssetPath + 'Races.json';
      case 'misc-items':
        return rootAssetPath + 'MiscItems.json';
      case 'adventuring-gear':
        return rootAssetPath + 'AdventuringGear.json';
      case 'potions':
        return rootAssetPath + 'Potions.json';
      case 'weapons':
        return rootAssetPath + 'Weapons.json';
      case 'armor':
        return rootAssetPath + 'Armor.json';
      default:
        return '';
    }
  }

  Future<void> _loadSRDCategoryFiles() async {
    this.categoryItems = [];
    List<dynamic> tempResult = json.decode(
      await rootBundle.loadString(this._getCategoryAssetPath())
    ); 
    for(Map result in tempResult){
      this.categoryItems.add(new SrdCategoryItem(result['name'], this.id, this.name, result['content'], result['htmlContent'], result['data']));
    }
    this.categoryItems.sort((a, b) => a.name.compareTo(b.name)); 
    this._populateFilterFieldOptions();

  }

  List<SrdCategoryItem> searchData(String query, List<SrdCategoryItemFilterField> filters){
    if(query.length <= 0 && filters.length <= 0){
      return this.categoryItems;
    }
    List<SrdCategoryItem> searchResults = this.categoryItems;
    
    if(query.length > 0){
      searchResults = [];
      for(SrdCategoryItem categoryItem in this.categoryItems){
        if(categoryItem.name.toLowerCase().contains(query.toLowerCase())){
          searchResults.add(categoryItem);
        }
      }
    }

    List<SrdCategoryItem> filterResults = searchResults;
    if(filters.length > 0){
      filterResults = [];




      for(SrdCategoryItem categoryItem in searchResults){
        bool match = true;

        for(SrdCategoryItemFilterField filterField in filters){ // For each filter field
          bool filterMatch = false;
          

          // For each filter option in field
          for(SrdCategoryItemFilterFieldOption filterOption in filterField.filterFieldOptions){
            
            if(filterOption.selected){
              if(filterOption.value == 'No ' + filterField.field){
                if(categoryItem.data[filterField.field] == null){
                  filterMatch = true;
                }
              } else if(filterField.contains){
                if(categoryItem.data[filterField.field].toString().contains(filterOption.value)){
                  filterMatch = true;
                }
              } else {
                if(categoryItem.data[filterField.field] == filterOption.value){ 
                  filterMatch = true;
                }
              }

            }
            
          }

          if(filterMatch == false) match = filterMatch;
          
        }



        if(match) filterResults.add(categoryItem);
      }
    }





    return filterResults;
  }

  List<SrdCategoryItemFilterFieldOption> getFilterOptions(SrdCategoryItemFilterField filterField){
    Map<String, int> results = {};
    for(SrdCategoryItem srdCategoryItem in this.categoryItems){
      if(srdCategoryItem.data[filterField.field] != null){
        for(String option in srdCategoryItem.data[filterField.field].toString().trim().split(filterField.splitString)){
          if(!["", " ", "  "].contains(option)){
            results[option.trim()] = 1;
          }
        }
      } else {
        results['No ' + filterField.field] = 1;
      }
    }
    List<String> filterOptions = results.keys.toList();
    filterOptions.sort();
    return filterOptions.map((String filterValue){
      return new SrdCategoryItemFilterFieldOption(filterValue);
    }).toList();
  }

}

class SrdCategoryItem {
  String name;
  String content;
  String htmlContent;
  String categoryId;
  String categoryName;
  Map data;

  SrdCategoryItem(this.name, this.categoryId, this.categoryName, this.content, this.htmlContent, this.data);
}

class SrdCategoryItemFilterField{
  String field;
  String splitString;
  bool contains;
  List<SrdCategoryItemFilterFieldOption> filterFieldOptions;

  SrdCategoryItemFilterField(this.field, [this.contains=false, this.splitString = '***********']);
}

class SrdCategoryItemFilterFieldOption{

  bool selected = true;
  String value;

  SrdCategoryItemFilterFieldOption(this.value);
}