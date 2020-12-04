import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:Streaks/Models/habit_data.dart';
import 'Nutrition_page.dart';

class NutritionDataLoad extends StatefulWidget {
  @override
  _NutritionDataLoad createState() => _NutritionDataLoad();
}

class _NutritionDataLoad extends State<NutritionDataLoad> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: Hive.openBox<HabitData>('NutritionDB'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError)
              return Text(snapshot.error.toString());
            else
              return Nutrition();
          } else
            return Scaffold();
        },
      ),
    );
  }

  @override
  void dispose() {
    Hive.box<HabitData>('NutritionDB').compact();
    Hive.box<HabitData>('NutritionDB').close();
    super.dispose();
  }
}
