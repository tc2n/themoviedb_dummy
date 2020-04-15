import 'package:flutter/material.dart';
import 'constants.dart';
import 'drawer.dart';
import 'homebody.dart';
import 'package:provider/provider.dart';
import 'darkModel.dart';

void main() => runApp(ChangeNotifierProvider(create: (context)=>DarkData(),
    child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: backSecondaryLight,
        canvasColor: Colors.white,
        textTheme: TextTheme(body1: headingTitlesLight,
          body2: lightFont
        ),
        buttonColor: activeButtonColorLight,
        colorScheme: ColorScheme.light(
          primaryVariant: diffGreyLight,
          secondary: fifyFullLight,
          secondaryVariant: seventyFullLight,
          surface: appBarTransparentLight,
        ),
      ),
      darkTheme: ThemeData(
        primaryColor: backSecondary,
        canvasColor: backSecondary,
        textTheme: TextTheme(body1: headingTitles, body2: lightFont),
        buttonColor: activeButtonColor,
        colorScheme: ColorScheme.dark(
          primaryVariant: diffGrey,
          secondary: fifyFull,
          secondaryVariant: seventyFull,
          surface: appBarTransparent
        ),
      ),
      themeMode: Provider.of<DarkData>(context).isDark ? ThemeMode.dark : ThemeMode.light,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
       color: Theme.of(context).primaryColor,
       child: SizedBox(
         height: 60,
                child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            BottomBarIcons(iconName: Icons.home, text: 'Home', isActive: true,),
             BottomBarIcons(iconName: Icons.live_tv, text: 'TV',),
            Image.asset('assets/logo_alt.png',
            width: 50,
            color: Theme.of(context).colorScheme.secondary,
            ),
              BottomBarIcons(iconName: Icons.movie, text: 'Movies',),
               BottomBarIcons(iconName: Icons.music_note, text: 'Music',),
          ],
      ),
       ), 
      ),
      backgroundColor: Theme.of(context).primaryColor,
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        title: Image.asset('assets/logo.png',
        fit: BoxFit.cover,
        width: 150,),
        actions: <Widget>[
          Icon(Icons.search),
          SizedBox(width: 10),
        ],
      ),
      body: HomeBody(),
    );
  }
}

class BottomBarIcons extends StatelessWidget {

  final IconData iconName;
  final String text;
  bool isActive ;

  BottomBarIcons({this.iconName, this.text, this.isActive: false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Icon(iconName, color: isActive? Theme.of(context).buttonColor: Theme.of(context).colorScheme.secondary, ),
        ),
        Text(text, style: TextStyle(fontSize: 10,color: isActive? Theme.of(context).buttonColor: Theme.of(context).colorScheme.secondary),),
      ],
    );
  }
}