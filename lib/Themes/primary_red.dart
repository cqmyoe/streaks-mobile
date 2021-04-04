import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'package:flutter/material.dart' hide Colors;

ThemeData themeData = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.PrimaryRed,
  accentColor: Colors.PrimaryBlue,
  highlightColor: Colors.RedLighten40,
  splashColor: Colors.BlueDarken40,
  backgroundColor: Colors.RedLighten80,
  textTheme: GoogleFonts.nunitoSansTextTheme(),
);
