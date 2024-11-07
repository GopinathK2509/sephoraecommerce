import 'package:flutter/material.dart';

class AppFontStyle {
  static const String fontfamily = "Roboto";
  static const String titlefontfamily = "RobotoMono";
  static const double contentsize = 14.0;
  static const double titlesize = 17.0;
  static const double subtitlesize = 15.0;
  static const double appbartitlesize = 18.0;
  static const double bigtextsize = 20.0;
  static const double pinScreensize = 24.0;

  static const TextStyle appbartitle = TextStyle(
      fontSize: appbartitlesize,
      fontWeight: FontWeight.bold,
      fontFamily: '$titlefontfamily');

  static const TextStyle titlestyle = TextStyle(
      fontSize: titlesize,
      fontFamily: '$fontfamily',
      fontWeight: FontWeight.w400);

  static const TextStyle titlestylebold = TextStyle(
      fontSize: titlesize,
      fontWeight: FontWeight.bold,
      fontFamily: '$fontfamily');

  static const TextStyle titlestylewhite = TextStyle(
      fontSize: titlesize, fontFamily: '$fontfamily', color: Colors.white);

  static const TextStyle titlestylewhitebold = TextStyle(
      fontSize: titlesize,
      fontWeight: FontWeight.bold,
      fontFamily: '$fontfamily',
      color: Colors.white);

  static const TextStyle titlestyleblue = TextStyle(
      color: Colors.blue, fontSize: titlesize, fontFamily: '$fontfamily');

  static const TextStyle titlestylebluebold = TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      fontSize: titlesize,
      fontFamily: '$fontfamily');

  static const TextStyle subtitlestyle =
      TextStyle(fontSize: subtitlesize, fontFamily: '$fontfamily');

  static const TextStyle subtitlestylebold = TextStyle(
      fontSize: subtitlesize,
      fontWeight: FontWeight.bold,
      fontFamily: '$fontfamily');

  static const TextStyle contentstyle = TextStyle(
      color: Colors.black, fontSize: contentsize, fontFamily: '$fontfamily');

  static const TextStyle contentstylebold = TextStyle(
      color: Colors.black,
      fontSize: contentsize,
      fontWeight: FontWeight.bold,
      fontFamily: '$fontfamily');

  static const TextStyle contentstylewhite = TextStyle(
      fontSize: contentsize, color: Colors.white, fontFamily: '$fontfamily');

  static const TextStyle contentstylewhitebold = TextStyle(
      fontSize: contentsize,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontFamily: '$fontfamily');

  static const TextStyle contentstyleblue = TextStyle(
      fontSize: contentsize, color: Colors.blue, fontFamily: '$fontfamily');

  static const TextStyle contentstylebluebold = TextStyle(
      fontSize: contentsize,
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      fontFamily: '$fontfamily');

  static const TextStyle contentstylered = TextStyle(
      fontSize: contentsize, color: Colors.red, fontFamily: '$fontfamily');

  static const TextStyle contentstyleredbold = TextStyle(
      fontSize: contentsize,
      color: Colors.red,
      fontWeight: FontWeight.bold,
      fontFamily: '$fontfamily');

  static const TextStyle contentstylegreen = TextStyle(
      fontSize: contentsize, color: Colors.green, fontFamily: '$fontfamily');

  static const TextStyle contentstylegreenbold = TextStyle(
      fontSize: contentsize,
      color: Colors.green,
      fontWeight: FontWeight.bold,
      fontFamily: '$fontfamily');

  static const TextStyle unAvailableText = TextStyle(
    color: Colors.red,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    fontFamily:  '$fontfamily',
  );
}
