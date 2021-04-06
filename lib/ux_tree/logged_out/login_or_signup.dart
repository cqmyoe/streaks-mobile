import 'package:flutter/material.dart' hide Colors;

class FirstPage extends StatelessWidget {
  FirstPage() : super();

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
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Theme.of(context).accentColor,
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/SignUpPhoneNo');
                    },
                    child: Text(
                      'Sign Up',
                      style: Theme.of(context).primaryTextTheme.headline5,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 100),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/LogIn');
                    },
                    child: Text(
                      'Log In',
                      style: Theme.of(context).primaryTextTheme.headline5,
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
