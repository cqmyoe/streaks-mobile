import 'package:flutter/material.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'dart:math';

String generateRandomString(int len) {
  var r = Random();
  return String.fromCharCodes(
      List.generate(len, (index) => r.nextInt(33) + 89));
}

class SignUpPhoneNo extends StatefulWidget {
  @override
  _SignUpPhoneNo createState() => _SignUpPhoneNo();
}

class _SignUpPhoneNo extends State<SignUpPhoneNo> {
  final phoneNumController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    phoneNumController.dispose();
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
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: Text(
                  'Create a new account',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                child: TextFormField(
                  controller: phoneNumController,
                  decoration: InputDecoration(
                    labelText: 'Phone number with +91',
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
                    child: FlatButton(
                      onPressed: () async {
                        try {
                          String randomId =
                              generateRandomString(15) + '256UPPERCASE';
                          Map<String, dynamic> userAttributes = {
                            "name": randomId + "@domain.com",
                            "family_name": randomId + " sirname",
                            "gender": "Male",
                            "birthdate": "1991-09-14",
                            "phone_number":
                                '+91' + phoneNumController.text.toString(),
                            "updated_at":
                                (new DateTime.now().millisecondsSinceEpoch /
                                        1000)
                                    .floor()
                                    .toString(),
                          };
                          print(userAttributes['phone_number']);
                          // ignore: unused_local_variable
                          SignUpResult res = await Amplify.Auth.signUp(
                              username: userAttributes['phone_number'],
                              password: passwordController.text.toString(),
                              options: CognitoSignUpOptions(
                                  userAttributes: userAttributes));
                          if (res.isSignUpComplete)
                            Navigator.pushNamed(context, '/SignUpOTP',
                                arguments: userAttributes);
                        } on AuthError catch (e) {
                          print(e);
                        }
                      },
                      child: Text('Verify phone number'),
                      color: Colors.amber,
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
    Key key,
    @required this.controller,
  })  : assert(controller != null),
        super(key: key);

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
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter your password';
        }
      },
    );
  }
}
