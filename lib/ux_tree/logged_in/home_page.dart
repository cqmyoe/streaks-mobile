import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streaks/state/providers/user_preferences.dart';
import 'meals/meal_screen.dart';
import 'insights/nutrition_data_load.dart';
import 'package:streaks/aspects/themes/themes.dart' as themes;

class MyHomePage extends StatelessWidget {
  MyHomePage() : super();

  @override
  Widget build(BuildContext context) {
    void _closeDrawer() {
      Navigator.of(context).pop();
    }

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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text('This is the Drawer'),
                ElevatedButton(
                  onPressed: _closeDrawer,
                  child: const Text('Close Drawer'),
                )
              ]),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text('Pick a Color Theme'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: themes.themeOf.entries.map((theme) {
                    return ElevatedButton(
                        child: Text(''),
                        onPressed: () {
                          context.read(themeProvider).state = theme.key;
                        },
                        style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            primary: theme.value.primaryColor));
                  }).toList(),
                )
              ])
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
            )
          ],
        ),
      ),
    );
  }
}
