import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;

class FirstPage extends StatefulWidget {
  @override
  _FirstPage createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {
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
                color: Colors.lightBlue[300],
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
                color: Colors.red[300],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<String>(
          future: randomNumber(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final number = snapshot.data;

              return Text(number);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

Future<String> randomNumber() async {
  final url =
      //"https://j40vylacg1.execute-api.ap-southeast-1.amazonaws.com/default/randomNumberFunction";
      "https://h1fd24ivzc.execute-api.ap-southeast-1.amazonaws.com/prod/ReadMessage";
  final response = await http.get(url);

  if (response.statusCode == 200) {
    //int num = int.parse(response.body);
    //String str = response.body;
    String str = DateTime.now()..toString();
    return str;
  } else {
    throw Exception();
  }
}*/
