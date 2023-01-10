import 'package:flutter/material.dart';

import 'app_colors.dart';

class FontFamily {
  static const lobster = 'lobster';
  static const lb = 'libre_baskerville';
  static const roboto = 'roboto_slab';
  static const qs = 'quicksand';
  static const ns = 'noto_san';
}

class AppFonts {
  static const TextStyle h1 = TextStyle(
      fontWeight: FontWeight.bold, fontFamily: FontFamily.qs, fontSize: 16, color: AppColors.lightPurple);
  static const TextStyle h2 = TextStyle(
      fontWeight: FontWeight.w500,fontFamily: FontFamily.qs, fontSize: 16, color: Colors.black);
  static const TextStyle h3 = TextStyle(
      fontFamily: FontFamily.qs, fontSize: 18, color: Colors.black);
  static const TextStyle h4 = TextStyle(
      fontWeight: FontWeight.w500, fontFamily: FontFamily.ns, fontSize: 24, color: AppColors.lightBlue);
  static const TextStyle h5 = TextStyle(
      fontFamily: FontFamily.lobster, fontSize: 32, color: Colors.pink);
  static const TextStyle h6 = TextStyle(
      fontFamily: FontFamily.qs, fontSize: 16, color: Colors.blueAccent);
  static const TextStyle h7 = TextStyle(
      fontWeight: FontWeight.bold, fontFamily: FontFamily.lb, fontSize: 14, color: Colors.black);
  static const TextStyle h8 = TextStyle(
      fontFamily: FontFamily.qs, fontSize: 14, color: Colors.grey);
  static const TextStyle h9 = TextStyle(
      fontFamily: FontFamily.qs, fontSize: 16, color: Colors.blueAccent);
  static const TextStyle h10 = TextStyle(
      fontFamily: FontFamily.roboto, fontSize: 18, color: AppColors.lightPurple);
  static const TextStyle h11 = TextStyle(
      fontWeight: FontWeight.w600,fontFamily: FontFamily.qs, fontSize: 18, color: Colors.green);
  static const TextStyle h12 = TextStyle(
      fontFamily: FontFamily.roboto, fontSize: 14, color: Colors.grey);
  static const TextStyle h13 = TextStyle(
      fontFamily: FontFamily.qs, fontSize: 14, color: Colors.black);
  static const TextStyle h14 = TextStyle(
      fontWeight: FontWeight.w500, fontFamily: FontFamily.ns, fontSize: 22, color: AppColors.lightPurple);
  static const TextStyle h15 = TextStyle(
      fontWeight: FontWeight.w500,fontFamily: FontFamily.qs, fontSize: 18, color: Colors.black);
}
