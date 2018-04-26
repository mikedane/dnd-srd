import 'package:flutter/material.dart';
import '../../models/SrdCategory.dart';
import '../list-items/SrdCategoryItemLI.dart';

class SrdCategoryItemsList extends StatelessWidget {

  final List<SrdCategoryItem> srdCategoryItems;
  final Function(BuildContext, SrdCategoryItem) onTap;
  final String separator;

  SrdCategoryItemsList(this.srdCategoryItems, this.separator, this.onTap);

  @override
  Widget build(BuildContext context){
    return new ListView.builder(
        itemCount: this.srdCategoryItems.length,
        itemBuilder: (BuildContext context, int index){ 
          List<Widget> columnChildren = [];
          if(this.shouldDisplayListSeparator(index)){
            columnChildren.add(this.getListSeparator(index));
          }
          columnChildren.add(
            new InkWell(
              child: SrdCategoryItemLI.getListItemForCategory(this.srdCategoryItems[index]),
              onTap:() =>  onTap(context, this.srdCategoryItems[index])
            )
          );

          if(!this.shouldDisplayListSeparator(index+1)){
            columnChildren.add(new Divider(color: Colors.black));
          }
          return new Column(children: columnChildren);
        }
    );
  }

  bool shouldDisplayListSeparator(int index){
    if(index > 0 && this.srdCategoryItems.length - 1 >= index){
      SrdCategoryItem previousItem = this.srdCategoryItems[index-1];
      SrdCategoryItem currentItem = this.srdCategoryItems[index];
      switch(this.separator){
        case 'category':
          
          return previousItem.categoryId != currentItem.categoryId;
          break;
        case 'name':
          return previousItem.name[0] != currentItem.name[0];
        default:
          return false;
      }
    } else if(index < 0){
      return false;
    }
    return true;  
  }

  Widget getListSeparator(index){
    SrdCategoryItem srdCategoryItem = this.srdCategoryItems[index];
    String separatorString = "";
    switch(this.separator){
      case 'category':
        separatorString = srdCategoryItem.categoryName;
        break;
      case 'name':
        separatorString = srdCategoryItem.name[0];
        break;
    }
    return 
    new Container(
      height: 35.0,
      color: Colors.grey[300],
      child:
    new ListTile(
      title: new Text(separatorString),
      dense: true,
      )
    );
  }
}