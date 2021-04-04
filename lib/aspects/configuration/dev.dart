import 'package:logger/logger.dart';
import 'default_config.dart';

class DevConfig extends DefaultConfig {
  final Level logLevel = Level.verbose;
  final bool isAccessRestricted = false;
}
