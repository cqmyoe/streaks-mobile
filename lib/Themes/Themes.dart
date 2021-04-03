import 'package:flutter/material.dart';

import 'package:streaks/Themes/PrimaryRed.dart' as PrimaryRed;
import 'package:streaks/Themes/PrimaryBlue.dart' as PrimaryBlue;
import 'package:streaks/Themes/PrimaryDark.dart' as PrimaryDark;
import 'package:streaks/Themes/PrimaryLight.dart' as PrimaryLight;

Map<String, ThemeData> themeOf = {
  'Red': PrimaryRed.themeData,
  'Blue': PrimaryBlue.themeData,
  'Dark': PrimaryDark.themeData,
  'Light': PrimaryLight.themeData
};
