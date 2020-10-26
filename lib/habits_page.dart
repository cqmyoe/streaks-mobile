import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:intl/intl.dart';

List<String> num = ['wake up at 10'];

class HabitsPage extends StatefulWidget {
  @override
  _HabitsPage createState() => _HabitsPage();
}

class _HabitsPage extends State<HabitsPage> {
  void _resetstate(String text) {
    num.add(text);
    setState(() {});
  }

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
                  _resetstate(value);
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
              child: ListView.builder(
                itemCount: num.length,
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
                              num[index].toString(),
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
                          child: CheckBox(),
                        ),
                      ],
                    ),
                  );
                },
              ),
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
