import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Streaks/Models/date_time.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var db = await Hive.openBox<bool>('test');
    if (!db.containsKey(day0)) {
      db.put(day0, false);
    }

    var db1 = await Hive.openBox<int>('test1');
    if (!db1.containsKey(day0)) {
      db1.put(day0, 0);
    }

    String phoneNo = pref.getString('phoneNo');
    if (phoneNo != null) {
      Timer(Duration(seconds: 0),
          () => Navigator.pushReplacementNamed(context, '/MyHomePage'));
    } else {
      Timer(Duration(seconds: 0),
          () => Navigator.pushReplacementNamed(context, '/FirstPage'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Wait'),
      ),
    );
  }
}
