// @dart=2.9
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'aspects/configuration/amplify_configuration.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'aspects/themes/themes.dart' as themes;
import 'ux_tree/logged_out/sign_up_phone_no.dart';
import 'ux_tree/logged_out/login_or_signup.dart';
import 'ux_tree/logged_out/sign_up_otp.dart';
import 'ux_tree/logged_in/home_page.dart';
import 'ux_tree/logged_out/login.dart';
import 'ux_tree/auth_check.dart';
import 'state/repository/device/habit_data.dart';
import 'state/repository/device/nutrition_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDir.path);
  Hive.registerAdapter(HabitDataAdapter());
  Hive.registerAdapter(NutritionDataAdapter());
  Amplify.addPlugin(AmplifyAuthCognito());
  Amplify.configure(amplifyconfig);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  final String theme = 'Blue';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themes.themeOf[theme],
      routes: {
        '/FirstPage': (context) => FirstPage(),
        '/': (context) => AuthCheck(),
        '/SignUpPhoneNo': (context) => SignUpPhoneNo(),
        '/SignUpOTP': (context) => SignUpOTP(),
        '/HomePage': (context) => MyHomePage(),
        '/LogIn': (context) => Login(),
      },
    );
  }
}
