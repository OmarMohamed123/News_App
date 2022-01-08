import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
const appName="My news";
const backGround=Color.fromRGBO(238, 240, 249, 1);
const red=Color.fromRGBO(246,20, 20, 1);
const light=Color(0xFFC3E0E5);
const dark1=Color(0xFF5885AF);
const dark2=Color(0xFF41729F);
const dark3=Color(0xFF274472);
const white=Colors.white;
const orangeLight=Color.fromRGBO(255,162, 0, 1);
const yellow=Color.fromRGBO(255,193, 7, 1);
const orangeDark=Color.fromRGBO(255,85, 0, 1);
const blue=Color.fromRGBO(45,95,255, 1);
const green=Color.fromRGBO(0,198,105, 1);
const black=Color.fromRGBO(0,0,0,1);
const textColor=Color.fromRGBO(38,50,91,1);
const double paddinglarg=33;
const double fonttitel=18;
const double fontSubTitel=16;
const double fontbigger=36;
const double fontxlarg=30;
const double fontlarge=20;
const double fontsmaller=12;

ThemeData buildLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    buttonColor: Color(0xFF1A374D),
    cardColor: Color(0xFFB1D0E0),
    backgroundColor: Color(0xFFB1D0E0),
    primaryColor: Color(0xFF1A374D),
    accentColor: Color(0xFF1A374D),
    scaffoldBackgroundColor: Color(0xFFB1D0E0),
  );
}

ThemeData buildDarkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    buttonColor: Color(0xFFB1D0E0),
    cardColor: Color(0xFF1A374D),
    backgroundColor: Color(0xFF1A374D),
    primaryColor: Colors.blue[900],
    accentColor: Color(0xFFB1D0E0),
    scaffoldBackgroundColor: Color(0xFF1A374D),
  );
}