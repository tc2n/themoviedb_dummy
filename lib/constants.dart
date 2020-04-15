import 'package:flutter/material.dart';


//By default dark mode
Color backPrimary = const Color(0xff0F1110);
Color backSecondary = Colors.grey[900]; 
Color diffGrey = Colors.grey[800];
Color fifyFull = Colors.white54; // ! missspelled
Color seventyFull = Colors.white70;
Color appBarTransparent = Color(0x77121212);
Color activeButtonColor = Colors.white;
TextStyle headingTitles = TextStyle(color: Colors.white70, fontSize: 24, fontWeight: FontWeight.w700);

//Light mode colors
Color backSecondaryLight = Colors.white;
Color diffGreyLight = Colors.black12; 
Color fifyFullLight = Colors.black45;
Color seventyFullLight = Colors.black54;
Color appBarTransparentLight = Color(0x77fefefe);
Color activeButtonColorLight = Colors.black87;
TextStyle headingTitlesLight = TextStyle(color: Colors.black54, fontSize: 24, fontWeight: FontWeight.w700);

Color primary = const Color(0xff0d253f);
Color secondary = const Color(0xff01b4e4);
Color tert = const Color(0xff90cea1);

TextStyle all = TextStyle(color: Colors.white70);
TextStyle trendingTitle = TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600);
TextStyle trendingGenre = TextStyle(color: Colors.white54, fontSize: 15, fontWeight: FontWeight.w500);
TextStyle lightFont = TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400);

Map genres = {
  28 : 'Action',
  12 : 'Adventure',
  16 : 'Animation',
  35 : 'Comedy',
  80 : 'Crime',
  99 : 'Documentary',
  18 : 'Drama',
  10751 : 'Family',
  14 : 'Fantasy',
  36 : 'History',
  27 : 'Horror',
  10402 : 'Music',
  9648 : 'Mystery',
  10749 : 'Romance',
  878 : 'Science Fiction',
  10770 : 'TV Movie',
  53 : 'Thriller',
  10752 : 'War',
  37 : 'Western'
};