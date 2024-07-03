import 'package:flutter/material.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';

abstract class Fontstyles {
  static const title = TextStyle(
      fontSize: 45,
      fontFamily: 'GaMaamli',
      color: ColorManager.titlewhite,
      fontWeight: FontWeight.normal);
  static const drawerItems = TextStyle(
      fontSize: 20,
      color: ColorManager.titlewhite,
      fontWeight: FontWeight.normal);
  static const titleStyle = TextStyle(
      fontFamily: 'Merriweather',
      fontSize: 25,
      color: ColorManager.titlewhite,
      fontWeight: FontWeight.bold);
}
