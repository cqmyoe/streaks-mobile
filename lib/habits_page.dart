import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:Streaks/Models/habit_data.dart';
import 'package:Streaks/Models/date_time.dart';

class HabitsPage extends StatefulWidget {
  @override
  _HabitsPage createState() => _HabitsPage();
}

class _HabitsPage extends State<HabitsPage> {
  Future<String> createAlertDialog(BuildContext context) {
    TextEditingController myController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('New Habit'),
          content: TextField(
            controller: myController,
          ),
          actions: [
            FlatButton(
              child: Text('Submit'),
              onPressed: () {
                Navigator.of(context).pop(myController.text.toString());
              },
            ),
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(null);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CqMyOE via Habits'),
        actions: [
          IconButton(
            onPressed: () {
              createAlertDialog(context).then((value) {
                if (value != '' && value != null) {
                  addHabit(value);
                }
              });
            },
            icon: Icon(Icons.add_box),
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Column(
                      children: [
                        Text(
                          DateFormat('E').format(now),
                        ),
                        Text(
                          DateFormat('d').format(now),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Column(
                      children: [
                        Text(
                          DateFormat('E').format(
                            now.subtract(new Duration(days: 1)),
                          ),
                        ),
                        Text(
                          DateFormat('d').format(
                            now.subtract(new Duration(days: 1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Column(
                      children: [
                        Text(
                          DateFormat('E').format(
                            now.subtract(new Duration(days: 2)),
                          ),
                        ),
                        Text(
                          DateFormat('d').format(
                            now.subtract(new Duration(days: 2)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Column(
                      children: [
                        Text(
                          DateFormat('E').format(
                            now.subtract(new Duration(days: 3)),
                          ),
                        ),
                        Text(
                          DateFormat('d').format(
                            now.subtract(new Duration(days: 3)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: _buildListView(),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckBox extends StatefulWidget {
  final bool value;
  final int index;
  final String date;
  CheckBox(this.value, this.index, this.date);
  @override
  State<StatefulWidget> createState() => _CheckBox(value, index, date);
}

class _CheckBox extends State<CheckBox> {
  bool checked;
  int index;
  String date;
  _CheckBox(this.checked, this.index, this.date);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
          icon: Icon(
            checked ? Icons.check : Icons.clear,
          ),
          color: checked ? Colors.green : Colors.red,
          onPressed: () {
            final habitsList = Hive.box<HabitData>('HabitDB');
            Map<String, bool> tempMap = habitsList.getAt(index).record;
            tempMap[date] = !tempMap[date];
            HabitData temp1 =
                new HabitData(habitsList.getAt(index).name, tempMap);
            habitsList.putAt(index, temp1);
            setState(() {
              checked = !checked;
            });
          }),
    );
  }
}

void addHabit(String newHabit) {
  Map<String, bool> tempMap = Map();
  tempMap[day0] = false;
  tempMap[day1] = false;
  tempMap[day2] = false;
  tempMap[day3] = false;
  HabitData temp = new HabitData(newHabit, tempMap);
  Hive.box<HabitData>('HabitDB').add(temp);
}

Widget _buildListView() {
  final habitsList = Hive.box<HabitData>('HabitDB');

  Future<String> changeHabitName(BuildContext context, int index) {
    TextEditingController myController = TextEditingController();
    TextEditingValue(text: 'lalit');

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Change Habit'),
          content: TextField(
            controller: myController,
          ),
          actions: [
            FlatButton(
              child: Text(
                'Delete',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                habitsList.deleteAt(index);
                Navigator.of(context).pop(null);
              },
            ),
            SizedBox(
              width: 50,
            ),
            FlatButton(
              child: Text('Update'),
              onPressed: () {
                String newName = myController.text;
                if (newName != '' && newName != null) {
                  HabitData temp1 =
                      new HabitData(newName, habitsList.getAt(index).record);
                  habitsList.putAt(index, temp1);
                }
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(null);
              },
            ),
          ],
        );
      },
    );
  }

  return WatchBoxBuilder(
    box: Hive.box<HabitData>('HabitDB'),
    builder: (context, habitsList) {
      return ListView.builder(
        itemCount: habitsList.length,
        itemBuilder: (context, index) {
          if (habitsList.getAt(index).record[day0] == null) {
            Map<String, bool> tempMap = habitsList.getAt(index).record;
            tempMap[day0] = false;
            if (tempMap[day1] == null) tempMap[day1] = false;
            if (tempMap[day2] == null) tempMap[day2] = false;
            if (tempMap[day3] == null) tempMap[day3] = false;
            HabitData temp1 =
                new HabitData(habitsList.getAt(index).name, tempMap);
            habitsList.putAt(index, temp1);
          }
          return Card(
            margin: EdgeInsets.fromLTRB(2, 1, 2, 1),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: ListTile(
                    contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    onTap: () {},
                    onLongPress: () {
                      changeHabitName(context, index);
                    },
                    title: Text(
                      habitsList.getAt(index).name.toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CheckBox(
                      habitsList.getAt(index).record[day0], index, day0),
                ),
                Expanded(
                  flex: 1,
                  child: CheckBox(
                      habitsList.getAt(index).record[day1], index, day1),
                ),
                Expanded(
                  flex: 1,
                  child: CheckBox(
                      habitsList.getAt(index).record[day2], index, day2),
                ),
                Expanded(
                  flex: 1,
                  child: CheckBox(
                      habitsList.getAt(index).record[day3], index, day3),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
