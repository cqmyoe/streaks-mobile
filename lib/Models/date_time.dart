DateTime now = DateTime.now().toLocal();
String day0 =
    now.year.toString() + '-' + now.month.toString() + '-' + now.day.toString();

String day1 = now.year.toString() +
    '-' +
    now.month.toString() +
    '-' +
    now.subtract(new Duration(days: 1)).day.toString();

String day2 = now.year.toString() +
    '-' +
    now.month.toString() +
    '-' +
    now.subtract(new Duration(days: 2)).day.toString();

String day3 = now.year.toString() +
    '-' +
    now.month.toString() +
    '-' +
    now.subtract(new Duration(days: 3)).day.toString();
