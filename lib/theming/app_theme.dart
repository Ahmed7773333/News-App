import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/theming/colors.dart';

class AppTheme {
  static ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: lightBackground,
    indicatorColor: Colors.black,
    focusColor: Colors.white,
    cardColor: Colors.blue,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xff39A552),
    ),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.poppins(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 30,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: lightBottomBar),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: lighFloating),
  );
  static ThemeData dartMode = ThemeData(
    indicatorColor: Colors.white,
    cardColor: const Color(0xFF363636),
    focusColor: Colors.grey,
    scaffoldBackgroundColor: darkBackground,
    appBarTheme: const AppBarTheme(
        centerTitle: true, color: Colors.transparent, elevation: 0),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.lato(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: GoogleFonts.lato(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: GoogleFonts.lato(
        fontSize: 30,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: dartBottomBar),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: darkFloating),
  );
}
