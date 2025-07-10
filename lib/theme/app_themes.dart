import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  // ── Original themes ───────────────────────────────────────────────
  static final ThemeData dreamyPastels = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF8F5FF),
    primaryColor: const Color(0xFFCDB4DB),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFFFC8DD)),
    textTheme: GoogleFonts.poppinsTextTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFBDE0FE)),
    ),
  );

  static final ThemeData earthyWarm = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFFFF8F2),
    primaryColor: const Color(0xFFECB8A5),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFE49AB0)),
    textTheme: GoogleFonts.robotoTextTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF957D95)),
    ),
  );

  static final ThemeData mysticDeep = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121212),
    primaryColor: const Color(0xFFBB86FC),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF1F1B24)),
    textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF03DAC6)),
    ),
  );

  // ── New themes ────────────────────────────────────────────────────
  static final ThemeData blushBloom = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFFFF0F5),
    primaryColor: const Color(0xFFFFC1CC),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFFC1CC),
      foregroundColor: Colors.black,
    ),
    textTheme: GoogleFonts.quicksandTextTheme().copyWith(
      bodyLarge: const TextStyle(color: Colors.black87),
      bodyMedium: const TextStyle(color: Colors.black87),
    ),
    cardColor: const Color(0xFFFFE4E1),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFF4978E),
        foregroundColor: Colors.white,
      ),
    ),
  );

  static final ThemeData forestCalm = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFE6EFE9),
    primaryColor: const Color(0xFF4E944F),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF4E944F),
      foregroundColor: Colors.white,
    ),
    textTheme: GoogleFonts.merriweatherTextTheme().copyWith(
      bodyLarge: const TextStyle(color: Colors.black87),
      bodyMedium: const TextStyle(color: Colors.black87),
    ),
    cardColor: const Color(0xFFD6E5E3),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF88AB8E),
        foregroundColor: Colors.white,
      ),
    ),
  );

  static final ThemeData cyberNight = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF0F111A),
    primaryColor: const Color(0xFF4DD0E1),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1A1C2C),
      foregroundColor: Colors.white,
    ),
    textTheme:
    GoogleFonts.robotoMonoTextTheme(ThemeData.dark().textTheme).copyWith(
      bodyLarge: const TextStyle(color: Color(0xFFB2EBF2)),
      bodyMedium: const TextStyle(color: Color(0xFFB2EBF2)),
    ),
    cardColor: const Color(0xFF1A1C2C),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF4DD0E1),
        foregroundColor: Colors.black,
      ),
    ),
  );
}
