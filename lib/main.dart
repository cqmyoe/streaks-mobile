import 'package:flutter/material.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'amplifyconfiguration.dart';

import 'package:Streaks/sign_up_phone_no.dart';
import 'package:Streaks/splash_screen.dart';
import 'package:Streaks/sign_up_otp.dart';
import 'package:Streaks/home_page.dart';
import 'package:Streaks/habits_page.dart';
import 'package:Streaks/login.dart';
import 'package:Streaks/Nutrition_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: unused_field
  bool _amplifyConfigured = false;

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
        _amplifyConfigured = true;
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
        '/': (context) => SplashScreen(),
        '/HabitsPage': (context) => HabitsPage(),
        '/SignUpPhoneNo': (context) => SignUpPhoneNo(),
        '/SignUpOTP': (context) => SignUpOTP(),
        '/Home': (context) => MyHomePage(title: 'Streaks'),
        '/LogIn': (context) => login(),
        '/Nutrition': (context) => Nutrition(),
        //'/': (context) => login(),
      },
    );
  }
}
