import 'package:flutter/material.dart';
import '../datastore.dart';
import '../components/views/SrdCategoryItemView.dart';
import '../components/lists/SrdCategoryItemsList.dart';
import '../models/SrdCategory.dart';

class SrdCategoryItemViewScreen extends StatefulWidget {

  final SrdCategoryItem srdCategoryItem;

  SrdCategoryItemViewScreen(this.srdCategoryItem);

  @override
  _SrdCategoryItemViewScreenState createState() => new _SrdCategoryItemViewScreenState(this.srdCategoryItem);
}

class _SrdCategoryItemViewScreenState extends State<SrdCategoryItemViewScreen> {

  SrdCategoryItem srdCategoryItem;

  _SrdCategoryItemViewScreenState(this.srdCategoryItem);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(this.srdCategoryItem.name),),
      body: SrdCategoryItemView.getItemForCategory(this.srdCategoryItem)
    );
  }



}

