import 'package:google_fonts/google_fonts.dart';
import 'Colors.dart';
import 'package:flutter/material.dart' hide Colors;

final ThemeData themeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.GreyDarken50,
  accentColor: Colors.GreyDarken20,
  highlightColor: Colors.GreyLighten40,
  splashColor: Colors.BlueDarken40,
  backgroundColor: Colors.GreyDarken80,
  textTheme: GoogleFonts.nunitoSansTextTheme(),
);
