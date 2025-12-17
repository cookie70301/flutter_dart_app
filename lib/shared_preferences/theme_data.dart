// theme_data.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// --- 💡 明亮主題 (Light Theme) ---
ThemeData lightTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor:Color(0xFF00CACA),
      brightness: Brightness.light,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor:Color(0xFF00CACA),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: Color(0xFF00CACA)
    ),
    scaffoldBackgroundColor: Color(0xFF00CACA),
    textTheme: TextTheme(
    titleLarge:GoogleFonts.amarante(
      fontSize: 30,
    ),
    displayMedium: GoogleFonts.notoSans(
      fontSize: 25,
    ),
    bodyMedium: GoogleFonts.notoSans(
      fontSize: 30,
    ),
    )
  );
}

// --- 🌙 黑暗主題 (Dark Theme) ---
ThemeData darkTheme() {
  return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor:Color(0xFF011717),
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
      textTheme: TextTheme(
        titleLarge:GoogleFonts.amarante(
          fontSize: 30,
        ),
        displayMedium: GoogleFonts.notoSans(
          fontSize: 25,
        ),
        bodyMedium: GoogleFonts.notoSans(
          fontSize: 30,
        ),
      )
  );
}