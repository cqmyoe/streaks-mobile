import 'package:logger/logger.dart';

abstract class Config {
  final Level logLevel = Level.nothing;
  final bool isAccessRestricted = true;
}

class DefaultConfig extends Config {
  final Level logLevel = Level.nothing;
  final bool isAccessRestricted = true;
}
