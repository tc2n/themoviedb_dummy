import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'darkModel.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 150,
            child: DrawerHeader(
              child: ListTile(
                leading: CircleAvatar(
                  child: Image.asset('assets/profile.png'),
                  radius: 30,
                ),
                title: Text('Log in', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.secondaryVariant),),
                subtitle: Text('For a better experience', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Theme.of(context).colorScheme.secondary),),
                trailing: Icon(Icons.chevron_right, color: Theme.of(context).colorScheme.secondaryVariant,),
              ),
            ),
          ),
          Container(
            color: Theme.of(context).colorScheme.primaryVariant,
            child: ListTile(
              leading: Image.asset(
                'assets/kids.png',
                height: 30,
              ),
              trailing: Switch(value: false, onChanged: (newVal) {}),
            ),
          ),
          ListTileSub(icon: Icons.file_download, text: 'Downloads', subtitle: 'Watch videos offline',),
          
          ListTileSub(icon: Icons.view_list, text: 'Watchlist', subtitle: 'Save to Watch Later',),
          ListTileSub(icon: Icons.card_giftcard, text: 'Prizes', subtitle: 'Prizes you have won',),
          ListTileWSub(icon: Icons.language, text: 'Languages',),
          ListTileWSub(icon: Icons.settings, text: 'Settings',),
          ListTile(
            leading: Icon(Icons.lightbulb_outline, color: Theme.of(context).colorScheme.secondaryVariant,),
            title: Text('Dark Mode', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.secondaryVariant),),
            trailing: Switch(value: Provider.of<DarkData>(context).isDark, onChanged: (newVal) {Provider.of<DarkData>(context, listen: false).toggleDarkTheme();})
          ),
          Divider(
            color: Theme.of(context).colorScheme.secondary,
          ),
          ListTileWSub(icon: Icons.help, text: 'Help',),
          Divider(
            color: Theme.of(context).colorScheme.secondary,
          ),
          Text('   Privacy Policy    .    T&C',
              style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 12,
                  color: Theme.of(context).buttonColor)),
          Text('   v 10.0.0.76000',
              style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 12,
                  color: Theme.of(context).buttonColor))
        ],
      ),
    );
  }
}

class ListTileSub extends StatelessWidget {
  String text;
  String subtitle;
  IconData icon;

  ListTileSub({this.text, this.subtitle, this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.secondaryVariant,),
      title: Text(text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.secondaryVariant),),
      subtitle: Text(subtitle, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Theme.of(context).colorScheme.secondary),),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}

class ListTileWSub extends StatelessWidget {
  String text;
  IconData icon;

  ListTileWSub({this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.secondaryVariant,),
      title: Text(text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.secondaryVariant),),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
