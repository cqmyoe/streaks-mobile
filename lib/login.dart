import 'package:flutter/material.dart';
import 'dart:math';

String generateRandomString(int len) {
  var r = Random();
  return String.fromCharCodes(
      List.generate(len, (index) => r.nextInt(33) + 89));
}

// ignore: camel_case_types
class login extends StatefulWidget {
  @override
  _login createState() => _login();
}

// ignore: camel_case_types
class _login extends State<login> {
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
                //color: Colors.grey[300],
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
                        /*try {
                              String randomId = generateRandomString(15) + '256UPPERCASE';
                              Map<String, dynamic> userAttributes = {
                                "name": randomId + "@domain.com",
                                "family_name": randomId + " sirname",
                                "gender": "Male",
                                "birthdate": "1991-09-14",
                                "phone_number": phoneNumController.text,
                                "updated_at": (new DateTime.now().millisecondsSinceEpoch/1000).floor().toString(),
                              };
                              SignUpResult res = await Amplify.Auth.signUp(
                                  username: userAttributes['phone_number'],
                                  password: randomId,
                                  options: CognitoSignUpOptions(
                                      userAttributes: userAttributes
                                  )
                              );
                              Navigator.pushNamed(context, '/Home',arguments: userAttributes);
                            } on AuthError catch (e) {
                              print(e);
                            }*/
                        Navigator.pushNamed(context, '/Home');
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
