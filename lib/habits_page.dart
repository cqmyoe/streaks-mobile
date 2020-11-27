import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:async';
import 'package:intl/intl.dart';

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

  DateTime now = new DateTime.now();
  final habitsList = Hive.box('Habits');

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
                  //_resetstate(value);
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
  @override
  State<StatefulWidget> createState() => _CheckBox();
}

class _CheckBox extends State<CheckBox> {
  bool _checked = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
          icon: Icon(
            _checked ? Icons.clear : Icons.check,
          ),
          color: _checked ? Colors.red : Colors.green,
          onPressed: () {
            setState(() {
              _checked = !_checked;
            });
          }),
    );
  }
}

void addHabit(String newHabit) {
  Hive.box('Habits').add(newHabit);
}

Widget _buildListView() {
  return WatchBoxBuilder(
    box: Hive.box('Habits'),
    builder: (context, habitsList) {
      return ListView.builder(
        itemCount: habitsList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.fromLTRB(2, 1, 2, 1),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: ListTile(
                    contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    onTap: () {},
                    title: Text(
                      habitsList.getAt(index).toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CheckBox(),
                ),
                Expanded(
                  flex: 1,
                  child: CheckBox(),
                ),
                Expanded(
                  flex: 1,
                  child: CheckBox(),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      habitsList.deleteAt(index);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
