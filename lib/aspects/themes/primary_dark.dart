import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'package:flutter/material.dart' hide Colors;

final ThemeData themeData = ThemeData(
  primarySwatch: createMaterialColor(Colors.GreyDarken50),
  textTheme: GoogleFonts.nunitoSansTextTheme(),
);
