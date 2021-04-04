import 'package:flutter/material.dart';

import 'primary_red.dart' as PrimaryRed;
import 'primary_blue.dart' as PrimaryBlue;
import 'primary_dark.dart' as PrimaryDark;
import 'primary_light.dart' as PrimaryLight;

Map<String, ThemeData> themeOf = {
  'Red': PrimaryRed.themeData,
  'Blue': PrimaryBlue.themeData,
  'Dark': PrimaryDark.themeData,
  'Light': PrimaryLight.themeData
};
