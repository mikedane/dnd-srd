import './models/SrdCategory.dart';

class Datastore {

  List<SrdCategory> srdCategories = [
    new SrdCategory.loadData('Monsters & Beasts', 'monsters', [
      new SrdCategoryItemFilterField('Size'),
      new SrdCategoryItemFilterField('Type'),
      new SrdCategoryItemFilterField('Alignment'),
      new SrdCategoryItemFilterField('Challenge Rating')
    ]),
    new SrdCategory.loadData('Spells', 'spells', [
      new SrdCategoryItemFilterField('Level'),
      new SrdCategoryItemFilterField('Components', true, ' '),
      new SrdCategoryItemFilterField('Damage Type'),
      new SrdCategoryItemFilterField('School'),
      new SrdCategoryItemFilterField('Classes', true, ', '),
    ]),
    new SrdCategory.loadData('Classes', 'classes', []),
    new SrdCategory.loadData('Races', 'races', []),
    new SrdCategory.withSubCategories('Items', 'items', [
      new SrdCategory.loadData('Potions', 'potions', []),
      new SrdCategory.loadData('Armor', 'armor', []),
      new SrdCategory.loadData('Adventuring Gear', 'adventuring-gear', []),
      new SrdCategory.loadData('Misc. Items', 'misc-items', []),
      new SrdCategory.loadData('Weapons', 'weapons', [])
    ]),
  ];


  SrdCategory getSrdCategory(categoryId){ 
    for(SrdCategory srdCategory in this.srdCategories){
      if(srdCategory.id == categoryId){
        return srdCategory;
      }
    }
  }

  List<SrdCategoryItem> searchCategoriesInList(List<SrdCategory> srdCategories, String query){
    List<SrdCategoryItem> results = [];
    for(SrdCategory srdCategory in srdCategories){
      if(srdCategory.subCategories != null){
        results.addAll(this.searchCategoriesInList(srdCategory.subCategories, query));
      } else {
        results.addAll(srdCategory.searchData(query, []));
      }
    }
    return results;
  }
  
  static final Datastore _singleton = new Datastore._internal();
  factory Datastore() {
    return _singleton;
  }
  Datastore._internal();
}


