import './models/SrdCategory.dart';

class Datastore {

  List<SrdCategory> srdCategories = [
    new SrdCategory.loadData('Monsters & Beasts', 'monsters', 'skull', [
      new SrdCategoryItemFilterField('Size'),
      new SrdCategoryItemFilterField('Type'),
      new SrdCategoryItemFilterField('Alignment'),
      new SrdCategoryItemFilterField('Challenge Rating')
    ]),
    new SrdCategory.loadData('Spells', 'spells', 'auto-fix', [
      new SrdCategoryItemFilterField('Level'),
      new SrdCategoryItemFilterField('Components', true, ' '),
      new SrdCategoryItemFilterField('Damage Type'),
      new SrdCategoryItemFilterField('School'),
      new SrdCategoryItemFilterField('Classes', true, ', '),
    ]),
    new SrdCategory.loadData('Classes', 'classes', 'skull', []),
    new SrdCategory.loadData('Races', 'races', 'skull', []),
    new SrdCategory.withSubCategories('Items', 'items', 'skull', [
      new SrdCategory.loadData('Potions', 'potions', 'skull', []),
      new SrdCategory.loadData('Armor', 'armor', 'skull', []),
      new SrdCategory.loadData('Adventuring Gear', 'adventuring-gear', 'skull', []),
      new SrdCategory.loadData('Misc. Items', 'misc-items', 'skull', []),
      new SrdCategory.loadData('Weapons', 'weapons', 'skull', [])
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


