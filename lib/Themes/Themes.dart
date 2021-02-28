import 'package:flutter/material.dart';

import 'package:Streaks/Themes/PrimaryRed.dart' as PrimaryRed;
import 'package:Streaks/Themes/PrimaryBlue.dart' as PrimaryBlue;
import 'package:Streaks/Themes/PrimaryDark.dart' as PrimaryDark;
import 'package:Streaks/Themes/PrimaryLight.dart' as PrimaryLight;

Map<String, ThemeData> themeOf = {
  'Red': PrimaryRed.themeData,
  'Blue': PrimaryBlue.themeData,
  'Dark': PrimaryDark.themeData,
  'Light': PrimaryLight.themeData
};
