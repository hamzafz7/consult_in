import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Map<int, Color> color = {
  50: const Color.fromARGB(24, 14, 136, 51),
  100: const Color.fromARGB(51, 81, 250, 3),
  200: const Color.fromARGB(75, 8, 243, 59),
  300: const Color.fromARGB(102, 3, 146, 27),
  400: const Color.fromARGB(126, 14, 136, 34),
  500: const Color.fromARGB(153, 18, 136, 14),
  600: const Color.fromARGB(177, 28, 136, 14),
  700: const Color.fromARGB(204, 14, 136, 30),
  800: const Color.fromARGB(227, 24, 136, 14),
  900: const Color.fromARGB(255, 14, 136, 34),
};

var mycolor = HexColor("#057C82");
var mysecondcolor = HexColor("#E3F5EE");
var mythirdcolor = HexColor("#4B907C");
var theme = ThemeData(
  primarySwatch: MaterialColor(
    0xff057c82,
    color,
  ),
  textTheme: TextTheme(
      headline1:
          TextStyle(fontSize: 34, color: mycolor, fontWeight: FontWeight.bold),
      headline2: TextStyle(
        fontSize: 30,
        color: mycolor,
        fontWeight: FontWeight.bold,
      ),
      headline3:
          TextStyle(fontSize: 26, color: mycolor, fontWeight: FontWeight.bold),
      headline4:
          TextStyle(fontSize: 22, color: mycolor, fontWeight: FontWeight.bold),
      headline5:
          TextStyle(fontSize: 22, color: mycolor, fontWeight: FontWeight.bold),
      headline6:
          TextStyle(fontSize: 18, color: mycolor, fontWeight: FontWeight.bold),
      bodyText1:
          TextStyle(fontSize: 16, color: mycolor, fontWeight: FontWeight.bold)),
);
