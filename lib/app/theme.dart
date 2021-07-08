import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = const Color(0xFF40B861);
const primaryColorDark = const Color(0xFF1F6D35);
const primaryColorLight = const Color(0xFFB7FFCB);
const bgColor = const Color(0xFFFFFFFF);

final greenAppTheme = ThemeData(
  textTheme: GoogleFonts.openSansTextTheme().apply(
      bodyColor: const Color(0xff14142B),
      displayColor: const Color(0xFF37474F)),
  primaryColorDark: primaryColorDark,
  primaryColorLight: primaryColorLight,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: bgColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: primaryColor,
      minimumSize: const Size(250, 60),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(40.0)),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      onSurface: Colors.white,
      primary: Colors.white,
      backgroundColor: primaryColor,
      textStyle: const TextStyle(
        color: Colors.white,
      ),
      minimumSize: const Size(250, 60),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(40.0)),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: const TextStyle(
      color: Color(0xFFA0A3BD),
    ),
    hintStyle: const TextStyle(
      color: Color(0xFFA0A3BD),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide: BorderSide.none,
    ),
    fillColor: const Color(0xFFEFF0F6),
    filled: true,
    focusedErrorBorder: kOutlineBorderStyle,
    focusedBorder: kOutlineBorderStyle,
    floatingLabelBehavior: FloatingLabelBehavior.never,
  ),
);

final kOutlineBorderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(16.0),
  borderSide: const BorderSide(color: primaryColor, width: 1.5),
);
