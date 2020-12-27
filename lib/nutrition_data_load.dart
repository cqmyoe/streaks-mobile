import 'package:Streaks/Models/date_time.dart';
import 'package:Streaks/Models/nutrition_data.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
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
        future: Hive.openBox<NutritionData>('NutritionDB'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError)
              return Text(snapshot.error.toString());
            else {
              final nutritionDB = Hive.box<NutritionData>('NutritionDB');
              if (!nutritionDB.containsKey(day0)) {
                List<String> temp = new List(30);
                NutritionData temp1 = new NutritionData(temp);
                nutritionDB.put(day0, temp1);
              }
              if (!nutritionDB.containsKey(day1)) {
                List<String> temp = new List(30);
                NutritionData temp1 = new NutritionData(temp);
                nutritionDB.put(day1, temp1);
              }
              if (!nutritionDB.containsKey(day2)) {
                List<String> temp = new List(30);
                NutritionData temp1 = new NutritionData(temp);
                nutritionDB.put(day2, temp1);
              }
              if (!nutritionDB.containsKey(day3)) {
                List<String> temp = new List(30);
                NutritionData temp1 = new NutritionData(temp);
                nutritionDB.put(day3, temp1);
              }
              return Nutrition();
            }
          } else
            return Scaffold();
        },
      ),
    );
  }

  /*@override
  void dispose() {
    Hive.box<NutritionData>('NutritionDB').compact();
    Hive.box<NutritionData>('NutritionDB').close();
    super.dispose();
  }*/
}
