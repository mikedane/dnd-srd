import 'package:flutter/material.dart';
import '../../models/SrdCategory.dart';
import '../list-items/SrdCategoryItemFilterLI.dart';

class SrdCategoryItemsFilterList extends StatefulWidget {

  final List<SrdCategoryItemFilterField> filterFields;

  SrdCategoryItemsFilterList(this.filterFields);

  @override
  _SrdCategoryItemsFilterListState createState() => new _SrdCategoryItemsFilterListState(filterFields);
}

class _SrdCategoryItemsFilterListState extends State<SrdCategoryItemsFilterList> {
  
  List<SrdCategoryItemFilterField> filterFields;

  _SrdCategoryItemsFilterListState(this.filterFields);
  
  @override
  Widget build(BuildContext context) {
    return new Column( children: <Widget>[
      
      new Expanded(child: 
        new ListView.builder(
          itemCount: this.filterFields.length,
          itemBuilder: (BuildContext context, int index){
            return new ExpansionTile(
              title: new Text(this.filterFields[index].field),
              children: this.getExpansionTileChildren(this.filterFields[index], index),
            );
          },
        )
      )
    ]);
    
  }

  List<Widget> getExpansionTileChildren(SrdCategoryItemFilterField filterField, int index){
    List<Widget> results = [
      new ButtonBar(
        
        children: <Widget>[
          new FlatButton(
            child: new Text('Select All'),
            textColor: Colors.blue,
            onPressed: (){
              for(SrdCategoryItemFilterFieldOption filterFieldOption in filterField.filterFieldOptions){
                filterFieldOption.selected = true;
              }
              this.setState((){
                this.filterFields[index] = filterField;
              });
            },
          ),
          new FlatButton(
            child: new Text('Deselect All'),
            textColor: Colors.blue,
            onPressed: (){
              for(SrdCategoryItemFilterFieldOption filterFieldOption in filterField.filterFieldOptions){
                filterFieldOption.selected = false;
              }
              this.setState((){
                this.filterFields[index] = filterField;
              });
            },
          )
        ], alignment: MainAxisAlignment.center,
      )
    ];
    results.addAll(filterField.filterFieldOptions.map((SrdCategoryItemFilterFieldOption filterFieldOption){
      return new SrdCategoryItemFilterLI(filterFieldOption);
    }).toList());

    return results;
  }

}










