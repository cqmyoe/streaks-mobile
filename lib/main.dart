import 'amplifyconfiguration.dart';
import 'package:flutter/material.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:Streaks/Themes/Themes.dart' as themes;
import 'package:Streaks/sign_up_phone_no.dart';
import 'package:Streaks/first_page.dart';
import 'package:Streaks/sign_up_otp.dart';
import 'package:Streaks/home_page.dart';
import 'package:Streaks/Login.dart';
import 'package:Streaks/AuthCheck.dart';
import 'package:Streaks/Models/habit_data.dart';
import 'package:Streaks/Models/nutrition_data.dart';

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
  bool amplifyConfigured = false;
  String theme = 'Blue';

  // Instantiate Amplify
  Amplify amplifyInstance = Amplify();

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  void setTheme(theme) {
    setState(() {
      this.theme = theme;
    });
  }

  void _configureAmplify() async {
    if (!mounted) return;

    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    amplifyInstance.addPlugin(authPlugins: [authPlugin]);

    await amplifyInstance.configure(amplifyconfig);

    try {
      setState(() {
        this.amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themes.themeOf[theme],
      routes: {
        '/FirstPage': (context) => FirstPage(setTheme: setTheme),
        '/': (context) => AuthCheck(),
        '/SignUpPhoneNo': (context) => SignUpPhoneNo(),
        '/SignUpOTP': (context) => SignUpOTP(),
        '/HomePage': (context) => MyHomePage(title: 'Streak'),
        '/LogIn': (context) => Login(),
      },
    );
  }
}
