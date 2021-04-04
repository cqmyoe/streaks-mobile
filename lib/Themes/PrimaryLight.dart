import 'package:google_fonts/google_fonts.dart';
import 'Colors.dart';
import 'package:flutter/material.dart' hide Colors;

final ThemeData themeData = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.GreyLighten30,
  accentColor: Colors.GreyDarken10,
  highlightColor: Colors.GreyDarken40,
  splashColor: Colors.BlueDarken40,
  backgroundColor: Colors.GreyLighten80,
  textTheme: GoogleFonts.nunitoSansTextTheme(),
);
