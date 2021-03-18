import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:Streaks/Models/date_time.dart';

class AuthCheck extends StatefulWidget {
  @override
  _AuthCheck createState() => _AuthCheck();
}

class _AuthCheck extends State<AuthCheck> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var db = await Hive.openBox<bool>('YogDB');
    if (!db.containsKey(day0)) {
      db.put(day0, false);
    }
    if (!db.containsKey(day1)) {
      db.put(day1, false);
    }
    if (!db.containsKey(day2)) {
      db.put(day2, false);
    }
    if (!db.containsKey(day3)) {
      db.put(day3, false);
    }

    var db1 = await Hive.openBox<int>('DhyaanDB');
    if (!db1.containsKey(day0)) {
      db1.put(day0, 0);
    }
    if (!db1.containsKey(day1)) {
      db1.put(day1, 0);
    }
    if (!db1.containsKey(day2)) {
      db1.put(day2, 0);
    }
    if (!db1.containsKey(day2)) {
      db1.put(day2, 0);
    }

    SharedPreferences pref = await SharedPreferences.getInstance();
    String phoneNo = pref.getString('phoneNo');
    String route = '/FirstPage';
    if (phoneNo != null) {
      route = '/HomePage';
    }
    Timer(Duration(seconds: 1),
        () => Navigator.pushReplacementNamed(context, route));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).splashColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
                width: 150,
                height: 150,
                image: AssetImage('assets/images/logo_splash.png')),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Logging In',
                style: Theme.of(context).textTheme.headline5,
              ),
              SpinKitThreeBounce(
                color: Theme.of(context).textTheme.headline5.color,
                size: Theme.of(context).textTheme.headline5.fontSize,
              ),
            ])
          ],
        ));
  }
}
