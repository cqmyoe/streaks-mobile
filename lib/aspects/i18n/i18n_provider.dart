import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/loaders/decoders/json_decode_strategy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:streaks/aspects/logging/log_provider.dart';
import 'package:streaks/state/providers/user_preferences.dart';

FlutterI18nDelegate streaksI18nDelegate({required Reader read}) {
  String locale = read(localeProvider).state;
  Logger logger = read(logProvider('i18n'));
  return FlutterI18nDelegate(
    translationLoader: NamespaceFileTranslationLoader(
      decodeStrategies: [JsonDecodeStrategy()],
      namespaces: [
        "auth",
        "drj_rules",
        "foods",
        "main",
        "portions",
        "user_preferences"
      ],
      useCountryCode: false,
      fallbackDir: 'en',
      basePath: 'assets/locales',
      forcedLocale: Locale(locale),
    ),
    missingTranslationHandler: (key, locale) {
      logger.w("Missing Key: $key, languageCode: ${locale?.languageCode}");
    },
  );
}

final i18nProvider = Provider.autoDispose<FlutterI18nDelegate>((ref) {
  return streaksI18nDelegate(read: ref.read);
}, name: 'i18n');
