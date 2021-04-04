import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'default_config.dart';
import 'dev.dart';
import 'production.dart';

enum Env { Unspecified, Dev, Production }

Config getConfig(Reader read) {
  var env = read(envProvider).state;

  if (env == Env.Production) {
    return ProductionConfig();
  }

  if (env == Env.Dev) {
    return DevConfig();
  }

  return DefaultConfig();
}

final envProvider = StateProvider<Env>((ref) => Env.Unspecified);

final logLevelProvider = StateProvider<Level>((ref) {
  var config = getConfig(ref.read);
  return config.logLevel;
});

final isAccessRestrictedProvider = StateProvider<bool>((ref) {
  var config = getConfig(ref.read);
  return config.isAccessRestricted;
});
