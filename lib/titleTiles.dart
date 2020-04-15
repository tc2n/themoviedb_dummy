import 'package:flutter/material.dart';

class TitleTiles extends StatelessWidget {
  
  String title;
  TitleTiles({this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        title,
        style: Theme.of(context).textTheme.body1,
      ),
      trailing: Icon(Icons.chevron_right, color: Theme.of(context).colorScheme.secondaryVariant,),
    );
  }
}