import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
  fontFamily: GoogleFonts.montserrat().fontFamily,
  // textTheme: _textTheme,
  tabBarTheme: TabBarTheme(
    labelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
    labelColor: Colors.black,
    unselectedLabelColor: Colors.black54,
    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
    indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Colors.blueAccent, width: 3)),
  ),
  brightness: Brightness.light,
  primarySwatch: Colors.primaries[5],
  accentColor: Colors.blueAccent,
  dividerColor: Colors.black26,
  scaffoldBackgroundColor: Colors.grey[100],
  backgroundColor: Colors.grey[100],
  bottomAppBarColor: Colors.white,
  appBarTheme: AppBarTheme(
      color: Colors.grey[100],
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black54),
      actionsIconTheme: IconThemeData(color: Colors.black54)),
);

final darkTheme = ThemeData(
  fontFamily: GoogleFonts.montserrat().fontFamily,
  // textTheme: _textTheme,
  tabBarTheme: TabBarTheme(
    labelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
    indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Colors.red, width: 3)),
  ),
  brightness: Brightness.dark,
  primarySwatch: Colors.grey,
  accentColor: Colors.lightBlue,
  dividerColor: Colors.white30,
  scaffoldBackgroundColor: Colors.grey[850],
  backgroundColor: Colors.grey[850],
  cardColor: Colors.grey[800],
  splashColor: Colors.red[100],
  indicatorColor: Colors.red,
  bottomAppBarColor: Colors.grey[700],
  iconTheme: IconThemeData(color: Colors.white),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.white30,
    textTheme: ButtonTextTheme.normal,
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: Colors.grey[800],
    contentTextStyle: TextStyle(color: Colors.white70),
  ),
);

final pitchBlack = ThemeData(
  fontFamily: GoogleFonts.montserrat().fontFamily,
  // textTheme: _textTheme,
  tabBarTheme: TabBarTheme(
    labelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
    indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Colors.red, width: 3)),
  ),
  brightness: Brightness.dark,
  primarySwatch: Colors.blueGrey,
  accentColor: Colors.red,
  dividerColor: Colors.white30,
  scaffoldBackgroundColor: Colors.black,
  backgroundColor: Colors.black,
  cardColor: Colors.grey[900],
  splashColor: Colors.red[100],
  bottomAppBarColor: Colors.grey[900],
  indicatorColor: Colors.red,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.white30,
    textTheme: ButtonTextTheme.normal,
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: Colors.grey[900],
    contentTextStyle: TextStyle(color: Colors.white60),
  ),
);
