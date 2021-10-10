import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: 'PoppinsMedium',
      backgroundColor: darkGrey,
      canvasColor: creamColor,
      buttonColor: darkBluishColor,
      accentColor: darkBluishColor,
      appBarTheme: AppBarTheme(
        elevation: 0,
      ));

  static darkTheme(BuildContext context) => ThemeData(
        backgroundColor: Colors.red,
        buttonColor: darkBluishColor,
      );

static Color creamColor = Color(0xfff5f5f5);
  static Color darkGrey = Color(0xFF18181B);
  static Color darkBluishColor = Color(0xff403b58);
}
