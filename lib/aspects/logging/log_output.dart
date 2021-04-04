import 'package:logger/logger.dart';

class StreaksOutput extends LogOutput {
  StreaksOutput();

  @override
  void output(OutputEvent event) {
    for (var line in event.lines) {
      print(line);
    }
  }
}