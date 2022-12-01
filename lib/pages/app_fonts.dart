import 'package:flutter/material.dart';

class FontFamily {
  static const lobster = 'lobster';
  static const lb = 'libre_baskerville';
}

class AppFonts {
  static const TextStyle h1 = TextStyle(
      fontWeight: FontWeight.bold, fontFamily: FontFamily.lb, fontSize: 16, color: Colors.lightBlue);
  static const TextStyle h2 = TextStyle(
      fontFamily: FontFamily.lb, fontSize: 16, color: Colors.black);
  static const TextStyle h3 = TextStyle(
      fontFamily: FontFamily.lb, fontSize: 18, color: Colors.black);
  static const TextStyle h4 = TextStyle(
      fontWeight: FontWeight.bold, fontFamily: FontFamily.lb, fontSize: 18, color: Colors.black);
  static const TextStyle h5 = TextStyle(
      fontFamily: FontFamily.lobster, fontSize: 32, color: Colors.pink);
  static const TextStyle h6 = TextStyle(
      fontFamily: FontFamily.lb, fontSize: 14, color: Colors.black);
}