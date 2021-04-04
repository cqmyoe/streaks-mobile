import 'package:logger/logger.dart';
import 'default_config.dart';

class ProductionConfig extends DefaultConfig {
  final Level logLevel = Level.warning;
  final bool isAccessRestricted = true;
}
