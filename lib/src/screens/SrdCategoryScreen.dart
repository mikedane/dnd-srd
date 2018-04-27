import 'package:flutter/material.dart';
import '../datastore.dart';
import '../components/lists/SrdCategoryList.dart';
import '../components/lists/SrdCategoryItemsList.dart';
import './SrdCategoryItemViewScreen.dart';

import './SrdCategoryItemsScreen.dart';
import '../models/SrdCategory.dart';

class SrdCategoryScreen extends StatefulWidget {

  List<SrdCategory> srdCategories;
  String title; 

  SrdCategoryScreen(this.srdCategories, this.title);

  @override
  _SrdCategoryScreenState createState() => new _SrdCategoryScreenState(srdCategories, title);
}

class _SrdCategoryScreenState extends State<SrdCategoryScreen> {

  String title;
  String textFieldValue = "";
  List<SrdCategory> srdCategories;
  Datastore datastore = new Datastore();

  _SrdCategoryScreenState(this.srdCategories, this.title);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(this.title),),
      body: new Column(
        children: <Widget>[
          new TextField(
            onChanged: this.onTextFieldChanged, 
            decoration: new InputDecoration(
              
              hintText: "Search " + this.title,
              prefixIcon: new Icon(Icons.search),
               contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0)
            )
            
          ),
          new Expanded(
          child: this.textFieldValue.length > 0 ? 
            new SrdCategoryItemsList(datastore.searchCategoriesInList(this.srdCategories, this.textFieldValue), 'category', this.onSrdCategoryItemListItemTap) :
            new SrdCategoryList(this.srdCategories, this.onSrdCategoryListItemTap) 
          )
        ],
      )
    );
  }

  void onSrdCategoryListItemTap(BuildContext context, SrdCategory srdCategory){
    Navigator.push(context, new MaterialPageRoute(builder: (context) {
      if(srdCategory.subCategories != null){
        return new SrdCategoryScreen(srdCategory.subCategories, srdCategory.name);
      } else {
        return new SrdCategoryItemsScreen(srdCategory);
      }
    }));
  }

  void onSrdCategoryItemListItemTap(BuildContext context, SrdCategoryItem srdCategoryItem){
    Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return new SrdCategoryItemViewScreen(srdCategoryItem);
    }));
  }

  

  void onTextFieldChanged(String textFieldValue){
    this.setState((){
      this.textFieldValue = textFieldValue;
    });
  }

}

