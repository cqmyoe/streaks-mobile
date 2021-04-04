import 'package:logger/logger.dart';

class StreaksPrinter extends LogPrinter {
  final String className;
  final Level level;

  StreaksPrinter({required this.className, required this.level});

  @override
  List<String> log(LogEvent event) {
    var color = PrettyPrinter.levelColors[level];
    var emoji = PrettyPrinter.levelEmojis[level];
    var lines = [emoji, className, event.message]
        .map((line) => line.toString())
        .toList();
    return color != null
        ? lines.map<String>((line) => color('$line')).toList()
        : lines;
  }
}
