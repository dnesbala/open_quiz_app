import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme() {
  const Color primaryTextColor = Color(0xffe9ecef);
  const Color secondaryTextColor = Color(0xff3f4238);

  return ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Color(0xff023e8a),
      secondary: Color(0xff00b4d8),
    ),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: GoogleFonts.lato().fontFamily,
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        color: primaryTextColor,
      ),
      headline2: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: primaryTextColor,
      ),
      headline3: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: primaryTextColor,
      ),
      headline4: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: primaryTextColor,
      ),
      headline5: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: primaryTextColor,
      ),
      headline6: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: primaryTextColor,
      ),
      bodyText1: TextStyle(
        fontSize: 20,
        color: primaryTextColor,
      ),
      bodyText2: TextStyle(
        fontSize: 16,
        color: primaryTextColor,
      ),
      caption: TextStyle(
        fontSize: 16,
        color: primaryTextColor,
        fontStyle: FontStyle.italic,
      ),
    ),
  );
}
