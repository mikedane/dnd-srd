import 'package:flutter/material.dart';
import '../../models/SrdCategory.dart';
import '../../rpg_icons_icons.dart';

class SrdCategoryList extends StatelessWidget {

  final List<SrdCategory> srdCategories;
  final Function(BuildContext, SrdCategory) onTap;

  SrdCategoryList(this.srdCategories, this.onTap);

  @override
  Widget build(BuildContext context){
    return new ListView.builder(
      itemCount: this.srdCategories.length,
      itemBuilder: (BuildContext context, int index){
        return new Column(
          children: [
            new ListTile(
              title: new Text(this.srdCategories[index].name),
              leading: new Icon(RpgIcons.getIconDataByName(this.srdCategories[index].id), size: 40.0,),
              onTap: () => this.onTap(context, this.srdCategories[index])
            ),
            new Divider(color: Colors.black)
          ]
        );
      }
    );
  }
}