import 'package:flutter/material.dart';

import 'PrimaryRed.dart' as PrimaryRed;
import 'PrimaryBlue.dart' as PrimaryBlue;
import 'PrimaryDark.dart' as PrimaryDark;
import 'PrimaryLight.dart' as PrimaryLight;

Map<String, ThemeData> themeOf = {
  'Red': PrimaryRed.themeData,
  'Blue': PrimaryBlue.themeData,
  'Dark': PrimaryDark.themeData,
  'Light': PrimaryLight.themeData
};
