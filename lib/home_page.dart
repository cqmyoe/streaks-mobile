import 'package:flutter/material.dart';
import 'meal_screen.dart';
import 'nutrition_data_load.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        automaticallyImplyLeading: true,
        titleSpacing: 0.0,
        /*actions: <Widget>[
            SizedBox(
              width: 40.0,
              child: TextButton(
                child: Text('U3'),
                color: const Color(0xFFCCA5F5),
                padding: EdgeInsets.all(0.0),
                shape: CircleBorder(),
                onPressed: () {},
              ),
            ),
            SizedBox(width: 5),
            SizedBox(
                width: 40.0,
                child: TextButton(
                  child: Text('U2'),
                  color: const Color(0xFF42A5A5),
                  padding: EdgeInsets.all(0.0),
                  shape: CircleBorder(),
                  onPressed: () {},
                )),
            SizedBox(width: 5),
            SizedBox(
                width: 40.0,
                child: TextButton(
                  child: Text('U1'),
                  color: const Color(0xBB42A5F5),
                  padding: EdgeInsets.all(0.0),
                  shape: CircleBorder(),
                  onPressed: () {},
                )),
            SizedBox(width: 15)
          ]*/
      ),
      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('This is the Drawer'),
              ElevatedButton(
                onPressed: _closeDrawer,
                child: const Text('Close Drawer'),
              ),
            ],
          ),
        ),
      ),
      drawerEnableOpenDragGesture: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MealPage()),
                );
              },
              child: Text("Enter Meals"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NutritionDataLoad()),
                );
              },
              child: Text("Insight"),
            ),
          ],
        ),
      ),
    );
  }
}
