import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      canvasColor: creamColor,
      buttonColor: darkBluishColor,
      accentColor: darkBluishColor,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        foregroundColor: darkBluishColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        // ignore: deprecated_member_use
        textTheme: Theme.of(context).textTheme,
      )
      //   primaryTextTheme: GoogleFonts.latoTextTheme(),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      cardColor: Colors.black,
      canvasColor: darkCreamColor,
      buttonColor: lightBluishColor,
      accentColor: darkBluishColor,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        foregroundColor: creamColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        // ignore: deprecated_member_use
      )

      //   primaryTextTheme: GoogleFonts.latoTextTheme(),
      );

  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkCreamColor = const Color(0xff0f151f);
  static Color darkBluishColor = const Color(0xff403b58);
  static Color lightBluishColor = Colors.indigo;
}
