import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

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
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Habits'),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            onPressed: () {
              createAlertDialog(context).then((value) {
                if (value != '') {
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
                    child: Text(
                      '7',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Text(
                      '6',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Text(
                      '5',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Text(
                      '4',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
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
