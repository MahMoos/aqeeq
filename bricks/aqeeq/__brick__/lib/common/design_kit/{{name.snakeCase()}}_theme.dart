import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class {{name.pascalCase()}}Theme {
  static TextTheme lightTextTheme({String font = 'Tajawal'}) {
    return TextTheme(
      bodyLarge: GoogleFonts.getFont(
        font,
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
      ),
      bodyMedium: GoogleFonts.getFont(
        font,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.black87,
      ),
      bodySmall: GoogleFonts.getFont(
        font,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.black26,
      ),
      titleMedium: GoogleFonts.getFont(
        font,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.black87,
      ),
      labelLarge: GoogleFonts.getFont(
        font,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.black87,
      ),
      displayLarge: GoogleFonts.getFont(
        font,
        fontSize: 30,
        fontWeight: FontWeight.normal,
        color: Colors.black87,
        decorationColor: Colors.white,
      ),
      displayMedium: GoogleFonts.getFont(
        font,
        fontSize: 19,
        fontWeight: FontWeight.normal,
        color: Colors.black87,
        decorationColor: Colors.white,
      ),
      displaySmall: GoogleFonts.getFont(
        font,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
      headlineLarge: GoogleFonts.getFont(
        font,
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
      ),
      headlineMedium: GoogleFonts.getFont(
        font,
        fontSize: 24,
        fontWeight: FontWeight.normal,
        color: Colors.black87,
      ),
      headlineSmall: GoogleFonts.getFont(
        font,
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: Colors.black87,
      ),
      titleLarge: GoogleFonts.getFont(
        font,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }

  static TextTheme darkTextTheme({String font = 'Tajawal'}) {
    return TextTheme(
      bodyLarge: GoogleFonts.getFont(
        font,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      bodyMedium: GoogleFonts.getFont(
        font,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      bodySmall: GoogleFonts.getFont(
        font,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.white38,
      ),
      titleMedium: GoogleFonts.getFont(
        font,
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Colors.white70,
      ),
      labelLarge: GoogleFonts.getFont(
        font,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.white70,
      ),
      displayLarge: GoogleFonts.getFont(
        font,
        fontSize: 30,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        decorationColor: Colors.black,
      ),
      displayMedium: GoogleFonts.getFont(
        font,
        fontSize: 19,
        fontWeight: FontWeight.normal,
        color: Colors.white,
        decorationColor: Colors.black,
      ),
      displaySmall: GoogleFonts.getFont(
        font,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      headlineLarge: GoogleFonts.getFont(
        font,
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      headlineMedium: GoogleFonts.getFont(
        font,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      headlineSmall: GoogleFonts.getFont(
        font,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      titleLarge: GoogleFonts.getFont(
        font,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    );
  }

  static ThemeData light() {
    const primaryColor = Color(0xff25c3ce);
    return ThemeData(
      colorSchemeSeed: primaryColor,
      brightness: Brightness.light,
      textTheme: lightTextTheme(),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(foregroundColor: Colors.white),
    );
  }

  static ThemeData dark() {
    const primaryColor = Color(0xff25c3ce);
    return ThemeData(
      colorSchemeSeed: primaryColor,
      brightness: Brightness.dark,
      textTheme: darkTextTheme(),
    );
  }
}
