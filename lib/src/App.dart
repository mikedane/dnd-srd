import 'package:flutter/material.dart';
import './datastore.dart';
import './components/lists/SrdCategoryList.dart';
import 'dart:async';
class HomePage extends StatelessWidget {

  final Datastore datastore = new Datastore();

  HomePage();

  @override
  Widget build(BuildContext context){
    // return new SrdCategoryList(datastore.srdCategories, 'D&D SRD');
    return new Text("Hello");
  }
}