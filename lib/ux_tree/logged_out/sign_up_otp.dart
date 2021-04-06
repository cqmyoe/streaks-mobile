import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter_i18n/widgets/I18nText.dart';

class SignUpOTP extends StatefulWidget {
  @override
  _SignUpOTP createState() => _SignUpOTP();
}

class _SignUpOTP extends State<SignUpOTP> {
  final otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  Map userAttributes = {};

  @override
  Widget build(BuildContext context) {
    userAttributes =
        ((ModalRoute.of(context)?.settings.arguments ?? {}) as Map);
    print(userAttributes);

    return Scaffold(
      appBar: AppBar(
        title: I18nText('main.title'),
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
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
                color: Theme.of(context).accentColor,
                size: 100.0,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: Text(
                'Enter OTP',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              child: TextFormField(
                controller: otpController,
                decoration: InputDecoration(
                  labelText: '6 digit code',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
              child: Row(children: <Widget>[
                Expanded(
                  child: TextButton(
                    onPressed: () async {
                      try {
                        // ignore: unused_local_variable
                        SignUpResult res = await Amplify.Auth.confirmSignUp(
                          username: userAttributes['phone_number'],
                          confirmationCode: otpController.text,
                        );
                        Navigator.pushNamed(context, '/HomePage',
                            arguments: userAttributes);
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: I18nText('main.submit'),
                    style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColor),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
