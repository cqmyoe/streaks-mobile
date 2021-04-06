import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:streaks/aspects/configuration/config_provider.dart';

import 'log_printer.dart';
import 'log_output.dart';

Logger streaksLogger({required Reader read, required String className}) {
  Level level = read(logLevelProvider).state;
  Logger.level = level;
  return Logger(printer: StreaksPrinter(className: className, level: level), output: StreaksOutput());
}

final logProvider = Provider.autoDispose.family<Logger, String>((ref, className) {
  return streaksLogger(read: ref.read, className: className);
}, name: 'logger');
