import 'package:logger/logger.dart';

class StreaksPrinter extends LogPrinter {
  final String className;
  final Level level;

  StreaksPrinter({required this.className, required this.level});

  @override
  List<String> log(LogEvent event) {
    var color = PrettyPrinter.levelColors[event.level];
    var emoji = PrettyPrinter.levelEmojis[event.level];
    var line = [className, event.message, event.error, event.stackTrace]
        .where((line) => line != null)
        .map((line) => line.toString())
        .toList()
        .join(" >> ");
    return color != null ? [color('$emoji $line')] : ['$emoji $line'];
  }
}
