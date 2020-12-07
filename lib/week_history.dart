import 'package:Streaks/Models/date_time.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeekHistory extends StatefulWidget {
  @override
  _WeekHistoryState createState() => _WeekHistoryState();
}

class _WeekHistoryState extends State<WeekHistory> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(DateFormat('E')
                .format(DateTime.parse(day0).subtract(new Duration(days: 6)))),
            SizedBox(
              height: 3,
            ),
            Icon(
              Icons.check_box,
              color: Colors.green,
            ),
          ],
        ),
        Column(
          children: [
            Text(DateFormat('E')
                .format(DateTime.parse(day0).subtract(new Duration(days: 6)))),
            SizedBox(
              height: 3,
            ),
            Icon(
              Icons.check_box,
              color: Colors.green,
            ),
          ],
        ),
        Column(
          children: [
            Text(DateFormat('E')
                .format(DateTime.parse(day0).subtract(new Duration(days: 5)))),
            SizedBox(
              height: 3,
            ),
            Icon(
              Icons.check_box,
              color: Colors.green,
            ),
          ],
        ),
        Column(
          children: [
            Text(DateFormat('E')
                .format(DateTime.parse(day0).subtract(new Duration(days: 4)))),
            SizedBox(
              height: 3,
            ),
            Icon(
              Icons.check_box,
              color: Colors.green,
            ),
          ],
        ),
        Column(
          children: [
            Text(DateFormat('E')
                .format(DateTime.parse(day0).subtract(new Duration(days: 3)))),
            SizedBox(
              height: 3,
            ),
            Icon(
              Icons.check_box,
              color: Colors.green,
            ),
          ],
        ),
        Column(
          children: [
            Text(DateFormat('E')
                .format(DateTime.parse(day0).subtract(new Duration(days: 2)))),
            SizedBox(
              height: 3,
            ),
            Icon(
              Icons.check_box,
              color: Colors.green,
            ),
          ],
        ),
        Column(
          children: [
            Text(DateFormat('E')
                .format(DateTime.parse(day0).subtract(new Duration(days: 1)))),
            SizedBox(
              height: 3,
            ),
            Icon(
              Icons.check_box,
              color: Colors.green,
            ),
          ],
        ),
      ],
    );
  }
}
