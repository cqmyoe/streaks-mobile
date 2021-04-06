// import 'dart:async';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    SharedPreferences pref = await SharedPreferences.getInstance();
    String route = '/HomePage';
    try {
      String? phoneNo = pref.getString('phoneNo');
      if (phoneNo == '') {
        route = '/FirstPage';
      }
    } catch (e) {
      print({'err': e, 'msg': 'Unable to read phoneNo'});
      route = '/FirstPage';
    }
    Timer(Duration(seconds: 1),
        () => Navigator.pushReplacementNamed(context, route));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
                width: 150,
                height: 150,
                image: AssetImage('assets/images/logo_splash_new.png')),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Logging In',
                style: Theme.of(context).textTheme.headline5,
              ),
              SpinKitThreeBounce(
                color:
                    Theme.of(context).primaryColor,
                size: Theme.of(context).textTheme.bodyText1?.fontSize ?? 16,
              ),
            ])
          ],
        ));
  }
}
