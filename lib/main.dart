// @dart=2.9
import 'amplifyconfiguration.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'themes/themes.dart' as themes;
import 'sign_up_phone_no.dart';
import 'first_page.dart';
import 'sign_up_otp.dart';
import 'home_page.dart';
import 'Login.dart';
import 'AuthCheck.dart';
import 'state/repository/device/habit_data.dart';
import 'state/repository/device/nutrition_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDir.path);
  Hive.registerAdapter(HabitDataAdapter());
  Hive.registerAdapter(NutritionDataAdapter());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String theme = 'Blue';

  @override
  void initState()  {
    super.initState();
    if (!mounted) return;
    Amplify.addPlugin(AmplifyAuthCognito());
    Amplify.configure(amplifyconfig);
  }

  void setTheme(theme) {
    setState(() {
      this.theme = theme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themes.themeOf[theme],
      routes: {
        '/FirstPage': (context) => FirstPage(key: 'LoggedOut', setTheme: setTheme),
        '/': (context) => AuthCheck(),
        '/SignUpPhoneNo': (context) => SignUpPhoneNo(),
        '/SignUpOTP': (context) => SignUpOTP(),
        '/HomePage': (context) => MyHomePage(title: 'Streak'),
        '/LogIn': (context) => Login(),
      },
    );
  }
}
