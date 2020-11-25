import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    String phoneNo = pref.getString('phoneNo');
    if (phoneNo != null) {
      Timer(Duration(seconds: 0),
          () => Navigator.pushReplacementNamed(context, '/Home'));
    } else {
      Timer(Duration(seconds: 0),
          () => Navigator.pushReplacementNamed(context, '/First'));
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
