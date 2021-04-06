// @dart=2.9
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:streaks/aspects/i18n/i18n_provider.dart';
import 'aspects/configuration/amplify_configuration.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'aspects/configuration/config_provider.dart';
import 'aspects/logging/log_provider.dart';
import 'aspects/themes/themes.dart' as themes;
import 'state/providers/change_logger.dart';
import 'state/providers/preferences.dart';
import 'ux_tree/logged_out/sign_up_phone_no.dart';
import 'ux_tree/logged_out/login_or_signup.dart';
import 'ux_tree/logged_out/sign_up_otp.dart';
import 'ux_tree/logged_in/home_page.dart';
import 'ux_tree/logged_out/login.dart';
import 'ux_tree/auth_check.dart';
import 'state/repository/device/habit_data.dart';
import 'state/repository/device/nutrition_data.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final providers = ProviderContainer();
  providers.read(envProvider).state = Env.Dev;

  final locale = providers.read(localeProvider).state;
  final i18nDelegate = providers.read(i18nProvider);
  await i18nDelegate.load(Locale(locale));
  
  final logger = providers.read(logProvider('main'));
  final isVerbose = Logger.level == Level.verbose;

  runApp(ProviderScope(
      observers: isVerbose ? [ChangeLogger(logger: logger)] : [],
      child: MyApp(i18nDelegate: i18nDelegate, logger: logger)));
}

class MyApp extends ConsumerWidget {
  const MyApp({this.i18nDelegate, this.logger});
  final FlutterI18nDelegate i18nDelegate;
  final Logger logger;

  @override
  createState() {
    _configureAmplify();
    _initDeviceRepository();
    return super.createState();
  }

  void _configureAmplify() {
    if (!Amplify.isConfigured) {
      Amplify.addPlugin(AmplifyAuthCognito());
      Amplify.configure(amplifyconfig);
    }
  }

  Future _initDeviceRepository() async {
    final appDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDir.path);
    Hive.registerAdapter(HabitDataAdapter());
    Hive.registerAdapter(NutritionDataAdapter());
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final themeColor = watch(themeProvider).state;
    this.logger.i('Initialising the app now with "$themeColor" theme');

    return MaterialApp(
      title: 'Flutter Demo',
      theme: themes.themeOf[themeColor],
      localizationsDelegates: [
        this.i18nDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('hi') // Hindi
      ],
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
