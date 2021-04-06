import 'package:flutter/material.dart';

import 'primary_red.dart' as PrimaryRed;
import 'primary_blue.dart' as PrimaryBlue;
import 'primary_dark.dart' as PrimaryDark;
import 'primary_light.dart' as PrimaryLight;

Map<String, ThemeData> themeOf = {
  'red': PrimaryRed.themeData,
  'blue': PrimaryBlue.themeData,
  'dark': PrimaryDark.themeData,
  'light': PrimaryLight.themeData
};
