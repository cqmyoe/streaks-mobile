import 'package:flutter/material.dart';
import 'package:Streaks/sign_up_phone_no.dart';
import 'package:Streaks/splash_screen.dart';
import 'package:Streaks/sign_up_otp.dart';
import 'package:Streaks/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => SplashScreen(),
        '/SignUpPhoneNo': (context) => SignUpPhoneNo(),
        '/SignUpOTP' : (context) => SignUpOTP(),
        '/Home' : (context) => MyHomePage(title: 'Streaks'),
      },
    );
  }
}
