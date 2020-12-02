DateTime now = DateTime.now().toLocal();
String today =
    now.year.toString() + '-' + now.month.toString() + '-' + now.day.toString();

String yesterday = now.year.toString() +
    '-' +
    now.month.toString() +
    '-' +
    now.subtract(new Duration(days: 1)).day.toString();
