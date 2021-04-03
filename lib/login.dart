import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

String generateRandomString(int len) {
  var r = Random();
  return String.fromCharCodes(
      List.generate(len, (index) => r.nextInt(33) + 89));
}

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  final phoneNumController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    phoneNumController.dispose();
    super.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Streaks',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Streaks'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                    child: Text(
                      'Welcome to CqMyOE streaks',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ]),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                alignment: AlignmentDirectional.center,
                child: Icon(
                  Icons.account_box,
                  color: Colors.blueAccent,
                  size: 100.0,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                child: TextFormField(
                  controller: phoneNumController,
                  decoration: InputDecoration(
                    labelText: 'User name',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                child: PasswordField(
                  controller: passwordController,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                child: Row(children: <Widget>[
                  Expanded(
                    child: TextButton(
                      onPressed: () async {
                        try {
                          SignInResult res = await Amplify.Auth.signIn(
                            username:
                                '+91' + phoneNumController.text.toString(),
                            password: passwordController.text.toString(),
                          );

                          if (res.isSignedIn) {
                            SharedPreferences pref =
                                await SharedPreferences.getInstance();
                            pref.setString('phoneNo',
                                '+91' + phoneNumController.text.toString());

                            Navigator.pushReplacementNamed(
                                context, '/HomePage');
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Text('Sign In'),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordField({
    key,
    required this.controller,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PasswordField();
}

class _PasswordField extends State<PasswordField> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _showPassword = !_showPassword;
            });
          },
          child: Icon(
            _showPassword ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
      obscureText: !_showPassword,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        } else
          return 'All good';
      },
    );
  }
}
