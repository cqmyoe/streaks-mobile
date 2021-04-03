import 'package:google_fonts/google_fonts.dart';
import 'package:streaks/Themes/Colors.dart';
import 'package:flutter/material.dart' hide Colors;

final ThemeData themeData = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.PrimaryBlue,
  accentColor: Colors.PrimaryRed,
  highlightColor: Colors.BlueLighten40,
  splashColor: Colors.BlueDarken40,
  backgroundColor: Colors.BlueLighten70,
  textTheme: GoogleFonts.nunitoSansTextTheme(),
);
