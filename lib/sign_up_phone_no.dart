import 'package:flutter/material.dart';

class SignUpPhoneNo extends StatelessWidget {
  // This widget is the root of your application.
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
                'Create a neww account',
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
                decoration: InputDecoration.collapsed(hintText: 'Enter phone number'),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
              child: Row(
                  children: <Widget> [
                    Expanded(
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/SignUpOTP');
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
