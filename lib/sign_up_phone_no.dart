import 'package:flutter/material.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'dart:math';

String generateRandomString(int len) {
  var r = Random();
  return String.fromCharCodes(List.generate(len, (index) => r.nextInt(33) + 89));
}

class SignUpPhoneNo extends StatefulWidget {
  @override
  _SignUpPhoneNo createState() => _SignUpPhoneNo();
}

class _SignUpPhoneNo extends State<SignUpPhoneNo> {
  final phoneNumController = TextEditingController();

  @override
  void dispose() {
    phoneNumController.dispose();
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Row(
                children: <Widget> [
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
                ]
            ),
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
              padding: EdgeInsets.symmetric(vertical:5.0, horizontal: 5.0),
              margin: EdgeInsets.symmetric(vertical:5.0, horizontal: 20.0),
              color: Colors.grey[300],
              child: TextField(
                controller: phoneNumController,
                decoration: InputDecoration.collapsed(hintText: 'Enter phone number'),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
              child: Row(
                  children: <Widget> [
                    Expanded(
                      child: FlatButton(
                        onPressed: () async {
                          try {
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
                            print(res);
                            Navigator.pushNamed(context, '/SignUpOTP');
                          } on AuthError catch (e) {
                            print(e);
                          }
                        },
                        child: Text('Verify phone number'),
                        color: Colors.amber,
                      ),
                    ),
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
