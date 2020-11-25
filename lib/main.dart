import 'package:flutter/material.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'amplifyconfiguration.dart';

import 'package:Streaks/sign_up_phone_no.dart';
import 'package:Streaks/first_page.dart';
import 'package:Streaks/sign_up_otp.dart';
import 'package:Streaks/home_page.dart';
import 'package:Streaks/habits_page.dart';
import 'package:Streaks/Login.dart';
import 'package:Streaks/Nutrition_page.dart';
import 'package:Streaks/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool amplifyConfigured = false;

  // Instantiate Amplify
  Amplify amplifyInstance = Amplify();

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    if (!mounted) return;

    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    amplifyInstance.addPlugin(authPlugins: [authPlugin]);

    await amplifyInstance.configure(amplifyconfig);

    try {
      setState(() {
        amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/First': (context) => FirstPage(),
        '/': (context) => SplashScreen(),
        '/HabitsPage': (context) => HabitsPage(),
        '/SignUpPhoneNo': (context) => SignUpPhoneNo(),
        '/SignUpOTP': (context) => SignUpOTP(),
        '/Home': (context) => MyHomePage(title: 'Streaks'),
        '/LogIn': (context) => Login(),
        '/NutritionPage': (context) => Nutrition(),
      },
    );
  }
}
