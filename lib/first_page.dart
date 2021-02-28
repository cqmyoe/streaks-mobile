import 'package:Streaks/Themes/Colors.dart';
import 'package:flutter/material.dart' hide Colors;

class FirstPage extends StatefulWidget {
  FirstPage({Key key, this.setTheme}) : super(key: key);
  final Function setTheme;

  @override
  _FirstPage createState() => _FirstPage(setTheme: setTheme);
}

class _FirstPage extends State<FirstPage> {
  _FirstPage({Key key, this.setTheme});

  final Function setTheme;
  final themes = [
    {'name': 'Red', 'color': Colors.PrimaryRed},
    {'name': 'Blue', 'color': Colors.PrimaryBlue},
    {'name': 'Dark', 'color': Colors.PrimaryBlack},
    {'name': 'Light', 'color': Colors.GreyLighten50}
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('STREAKS'),
          centerTitle: true,
        ),
        body: Container(
            color: Theme.of(context).backgroundColor,
            child: Column(
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
                      style: Theme.of(context).primaryTextTheme.headline5,
                    ),
                    color: Theme.of(context).accentColor,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 100),
                  child: FlatButton(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    onPressed: () {
                      Navigator.pushNamed(context, '/LogIn');
                    },
                    child: Text(
                      'Log In',
                      style: Theme.of(context).primaryTextTheme.headline5,
                    ),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: this
                      .themes
                      .map((theme) => RaisedButton(
                          onPressed: () {
                            this.setTheme(theme['name']);
                          },
                          shape: CircleBorder(),
                          color: theme['color']))
                      .toList(),
                )
              ],
            )),
      ),
    );
  }
}
