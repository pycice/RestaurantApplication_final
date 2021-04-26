import 'package:flutter/material.dart';

class MyStyle {

  Color darkColor = Colors.pink;
  Color prinaryColor = Colors.deepPurpleAccent;
  Color lightColor = Colors.blue;

  TextStyle redBoldStyle() => TextStyle(
      color: Colors.red.shade700,
      fontWeight: FontWeight.bold
  );

  Widget showLogo() => Image.asset('image/logo.png');

  Widget titleH1(String string) => Text(
      string,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: darkColor,
      )
  );

  Widget titleH2(String string) => Text(
      string,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: darkColor,
      )
  );

  Widget titleH3(String string) => Text(
      string,
      style: TextStyle(
        fontSize: 16,
        //fontWeight: FontWeight.bold,
        color: darkColor,
      )
  );

  MyStyle();
}