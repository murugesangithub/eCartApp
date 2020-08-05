import 'package:flutter/material.dart';

Map<int, Color> _primaryColor = {
  50: Color.fromRGBO(0, 50, 50, .1),
  100: Color.fromRGBO(0, 50, 50, .2),
  200: Color.fromRGBO(0, 50, 50, .3),
  300: Color.fromRGBO(0, 50, 50, .4),
  400: Color.fromRGBO(0, 50, 50, .5),
  500: Color.fromRGBO(0, 50, 50, .6),
  600: Color.fromRGBO(0, 50, 50, .7),
  700: Color.fromRGBO(0, 50, 50, .8),
  800: Color.fromRGBO(0, 50, 50, .9),
  900: Color.fromRGBO(0, 50, 50, 1),
};
MaterialColor primaryColorCustom = MaterialColor(0xFF003232, _primaryColor);

Map<int, Color> _primaryColorLight = {
  50: Color.fromRGBO(0, 142, 142, .1),
  100: Color.fromRGBO(0, 142, 142, .2),
  200: Color.fromRGBO(0, 142, 142, .3),
  300: Color.fromRGBO(0, 142, 142, .4),
  400: Color.fromRGBO(0, 142, 142, .5),
  500: Color.fromRGBO(0, 142, 142, .6),
  600: Color.fromRGBO(0, 142, 142, .7),
  700: Color.fromRGBO(0, 142, 142, .8),
  800: Color.fromRGBO(0, 142, 142, .9),
  900: Color.fromRGBO(0, 142, 142, 1),
};
MaterialColor primaryColorLightCustom =
    MaterialColor(0xFF008E8E, _primaryColorLight);

Map<int, Color> _accentColor = {
  50: Color.fromRGBO(0, 142, 142, .1),
  100: Color.fromRGBO(0, 142, 142, .2),
  200: Color.fromRGBO(0, 142, 142, .3),
  300: Color.fromRGBO(0, 142, 142, .4),
  400: Color.fromRGBO(0, 142, 142, .5),
  500: Color.fromRGBO(0, 142, 142, .6),
  600: Color.fromRGBO(0, 142, 142, .7),
  700: Color.fromRGBO(0, 142, 142, .8),
  800: Color.fromRGBO(0, 142, 142, .9),
  900: Color.fromRGBO(0, 142, 142, 1),
};
MaterialColor accentColorCustom = MaterialColor(0xFF008E8E, _accentColor);

Map<int, Color> _backgroundColor = {
  50: Color.fromRGBO(231, 234, 236, .1),
  100: Color.fromRGBO(231, 234, 236, .2),
  200: Color.fromRGBO(231, 234, 236, .3),
  300: Color.fromRGBO(231, 234, 236, .4),
  400: Color.fromRGBO(231, 234, 236, .5),
  500: Color.fromRGBO(231, 234, 236, .6),
  600: Color.fromRGBO(231, 234, 236, .7),
  700: Color.fromRGBO(231, 234, 236, .8),
  800: Color.fromRGBO(231, 234, 236, .9),
  900: Color.fromRGBO(231, 234, 236, 1),
};
MaterialColor backgroundCustom = MaterialColor(0xFFE7EAEC, _backgroundColor);

Map<int, Color> _descriptionTextColor = {
  50: Color.fromRGBO(80, 82, 85, .1),
  100: Color.fromRGBO(80, 82, 85, .2),
  200: Color.fromRGBO(80, 82, 85, .3),
  300: Color.fromRGBO(80, 82, 85, .4),
  400: Color.fromRGBO(80, 82, 85, .5),
  500: Color.fromRGBO(80, 82, 85, .6),
  600: Color.fromRGBO(80, 82, 85, .7),
  700: Color.fromRGBO(80, 82, 85, .8),
  800: Color.fromRGBO(80, 82, 85, .9),
  900: Color.fromRGBO(80, 82, 85, 1),
};
MaterialColor descriptionTextCustom =
    MaterialColor(0xFF505255, _descriptionTextColor);

Map<int, Color> _borderColor = {
  50: Color.fromRGBO(213, 213, 213, .1),
  100: Color.fromRGBO(213, 213, 213, .2),
  200: Color.fromRGBO(213, 213, 213, .3),
  300: Color.fromRGBO(213, 213, 213, .4),
  400: Color.fromRGBO(213, 213, 213, .5),
  500: Color.fromRGBO(213, 213, 213, .6),
  600: Color.fromRGBO(213, 213, 213, .7),
  700: Color.fromRGBO(213, 213, 213, .8),
  800: Color.fromRGBO(213, 213, 213, .9),
  900: Color.fromRGBO(213, 213, 213, 1),
};
MaterialColor borderCustom = MaterialColor(0xFF5d5d5d5, _borderColor);

Map<int, Color> _bottomBarColor = {
  50: Color.fromRGBO(248, 248, 248, .1),
  100: Color.fromRGBO(248, 248, 248, .2),
  200: Color.fromRGBO(248, 248, 248, .3),
  300: Color.fromRGBO(248, 248, 248, .4),
  400: Color.fromRGBO(248, 248, 248, .5),
  500: Color.fromRGBO(248, 248, 248, .6),
  600: Color.fromRGBO(248, 248, 248, .7),
  700: Color.fromRGBO(248, 248, 248, .8),
  800: Color.fromRGBO(248, 248, 248, .9),
  900: Color.fromRGBO(248, 248, 248, 1),
};
MaterialColor bottomBarCustom = MaterialColor(0xFFf8f8f6, _bottomBarColor);

Map<int, Color> _lightGreen = {
  50: Color.fromRGBO(140, 219, 80, .1),
  100: Color.fromRGBO(140, 219, 80, .2),
  200: Color.fromRGBO(140, 219, 80, .3),
  300: Color.fromRGBO(140, 219, 80, .4),
  400: Color.fromRGBO(140, 219, 80, .5),
  500: Color.fromRGBO(140, 219, 80, .6),
  600: Color.fromRGBO(140, 219, 80, .7),
  700: Color.fromRGBO(140, 219, 80, .8),
  800: Color.fromRGBO(140, 219, 80, .9),
  900: Color.fromRGBO(140, 219, 80, 1),
};
MaterialColor lightGreen = MaterialColor(0xFF8CDB50, _lightGreen);

Map<int, Color> _skyBlue = {
  50: Color.fromRGBO(134, 207, 201, .1),
  100: Color.fromRGBO(134, 207, 201, .2),
  200: Color.fromRGBO(134, 207, 201, .3),
  300: Color.fromRGBO(134, 207, 201, .4),
  400: Color.fromRGBO(134, 207, 201, .5),
  500: Color.fromRGBO(134, 207, 201, .6),
  600: Color.fromRGBO(134, 207, 201, .7),
  700: Color.fromRGBO(134, 207, 201, .8),
  800: Color.fromRGBO(134, 207, 201, .9),
  900: Color.fromRGBO(134, 207, 201, 1),
};

MaterialColor skyBlue = MaterialColor(0xFF86cfc9, _skyBlue);
