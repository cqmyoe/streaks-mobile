import 'package:flutter_riverpod/flutter_riverpod.dart';

final localeProvider = StateProvider.autoDispose<String>((ref) => "en", name: 'locale');

final themeProvider = StateProvider.autoDispose<String>((ref) => "blue", name: 'theme');
