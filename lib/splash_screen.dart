import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Streaks'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: FlatButton(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                onPressed: () {
                  Navigator.pushNamed(context, '/SignUpPhoneNo');
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Colors.amberAccent,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: FlatButton(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                onPressed: () {
                  Navigator.pushNamed(context, '/LogIn');
                },
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Colors.pinkAccent,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: FlatButton(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                onPressed: () {
                  Navigator.pushNamed(context, '/Home');
                },
                child: Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Colors.greenAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
