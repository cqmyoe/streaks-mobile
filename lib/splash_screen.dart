import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Streaks'),
          centerTitle: true,
        ),
        body: Center(
          child: FlatButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/SignUpPhoneNo');
              },
              icon: Icon(Icons.arrow_forward_ios),
              label: Text('Continue'),
              color: Colors.amber,
          ),
        ),
      ),
    );
  }
}

//Text('cqMyOE Streaks logo')