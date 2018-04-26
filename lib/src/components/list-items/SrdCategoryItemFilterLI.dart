import 'package:flutter/material.dart';
import '../../models/SrdCategory.dart';

class SrdCategoryItemFilterLI extends StatefulWidget {

  final SrdCategoryItemFilterFieldOption filterFieldOption;

  SrdCategoryItemFilterLI(this.filterFieldOption);
  
  @override
  _SrdCategoryItemFilterLIState createState() => new _SrdCategoryItemFilterLIState(this.filterFieldOption);
}

class _SrdCategoryItemFilterLIState extends State<SrdCategoryItemFilterLI> {

    SrdCategoryItemFilterFieldOption filterFieldOption;

  _SrdCategoryItemFilterLIState(this.filterFieldOption);

  @override
  Widget build(BuildContext context) {
    return 
    new InkWell(
      onTap: (){
        this.setState((){
          this.filterFieldOption.selected = !this.filterFieldOption.selected;
        });
        
      },
      child:new ListTile(
        title: new Text(filterFieldOption.value),
        leading: new Checkbox(
          value: this.filterFieldOption.selected,
          onChanged: (bool newValue) {
            setState(() {
              this.filterFieldOption.selected = newValue;
            });
          },
        ),
      )
    );
  }
}