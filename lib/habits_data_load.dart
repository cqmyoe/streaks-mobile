import 'package:flutter/material.dart';
import 'package:Streaks/habits_page.dart';
import 'package:hive/hive.dart';
import 'package:Streaks/Models/habit_data.dart';

class HabitsDataLoad extends StatefulWidget {
  @override
  _HabitsDataLoad createState() => _HabitsDataLoad();
}

class _HabitsDataLoad extends State<HabitsDataLoad> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: Hive.openBox<HabitData>('Habit'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError)
              return Text(snapshot.error.toString());
            else
              return HabitsPage();
          } else
            return Scaffold();
        },
      ),
    );
  }

  @override
  void dispose() {
    Hive.box<HabitData>('Habit').compact();
    Hive.box<HabitData>('Habit').close();
    super.dispose();
  }
}
