import 'package:flutter/material.dart';
import '../datastore.dart';
import './SrdCategoryItemViewScreen.dart';
import '../components/lists/SrdCategoryItemsList.dart';
import '../components/lists/SrdCategoryItemsFilterList.dart';
import '../models/SrdCategory.dart';

class SrdCategoryItemsScreen extends StatefulWidget {

  SrdCategory srdCategory;
  SrdCategoryItemsScreen(this.srdCategory);

  @override
  _SrdCategoryItemsScreenState createState() => new _SrdCategoryItemsScreenState(srdCategory);
}

class _SrdCategoryItemsScreenState extends State<SrdCategoryItemsScreen>{

  String textFieldValue = "";
  SrdCategory srdCategory;
  Datastore datastore = new Datastore();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  _SrdCategoryItemsScreenState(this.srdCategory);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: this._scaffoldKey,
      endDrawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new DrawerHeader(child: new Column(children: <Widget>[
                new Icon(Icons.plus_one, size: 35.0,),
                new Text(this.srdCategory.name + ' Filters', style: new TextStyle(fontSize: 35.0),)
            ])),
            new Expanded(
              child: this.getSrdCategoryItemsFilterList(this.srdCategory.filterFields)
              ),
          ],
        ), 
      ), 
      appBar: new AppBar(title: new Text(this.srdCategory.name), actions: <Widget>[new Text('')],),
    
      body: new Column(
        children: <Widget>[
          new TextField(
            onChanged: this.onTextFieldChanged, 
            decoration: new InputDecoration(
              suffixIcon: new IconButton(
                icon: new Icon(Icons.filter_list),
                onPressed: () => this._scaffoldKey.currentState.openEndDrawer(),
              )
            )
          ),
          new Expanded(
          child:  
            new SrdCategoryItemsList(
              this.srdCategory.searchData(this.textFieldValue, this.srdCategory.filterFields),
              'name',
              this.onSrdCategoryItemListItemTap) 
          )
        ],
      )
    );
  }





  Widget getSrdCategoryItemsFilterList( List<SrdCategoryItemFilterField> filterFields){
    return new Column( children: <Widget>[
      new Expanded(child: 
        new ListView.builder(
          itemCount: filterFields.length,
          itemBuilder: (BuildContext context, int index){
            return new ExpansionTile(
              title: new Text(filterFields[index].field),
              children: this.getExpansionTileChildren(filterFields[index], index),
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
                // this.srdCategory = this.srdCategory;
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
                // this.srdCategory = this.srdCategory;
              });
            },
          )
        ], alignment: MainAxisAlignment.center,
      )
    ];
    results.addAll(filterField.filterFieldOptions.map((SrdCategoryItemFilterFieldOption filterFieldOption){
      return this.getSrdCategoryItemFilterLI(filterFieldOption);
    }).toList());

    return results;
  }

  Widget getSrdCategoryItemFilterLI(SrdCategoryItemFilterFieldOption filterFieldOption){
    return new InkWell(
      onTap: (){
        this.setState((){
          filterFieldOption.selected = !filterFieldOption.selected;
        });
        
      },
      child:new ListTile(
        title: new Text(filterFieldOption.value),
        leading: new Checkbox(
          value: filterFieldOption.selected,
          onChanged: (bool newValue) {
            setState(() {
              filterFieldOption.selected = newValue;
            });
          },
        ),
      )
    );
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

