import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime now = DateTime.now();

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
          actions: <Widget>[
            SizedBox(
              width: 40.0,
              child: FlatButton(
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
                child: FlatButton(
                  child: Text('U2'),
                  color: const Color(0xFF42A5A5),
                  padding: EdgeInsets.all(0.0),
                  shape: CircleBorder(),
                  onPressed: () {},
                )),
            SizedBox(width: 5),
            SizedBox(
                width: 40.0,
                child: FlatButton(
                  child: Text('U1'),
                  color: const Color(0xBB42A5F5),
                  padding: EdgeInsets.all(0.0),
                  shape: CircleBorder(),
                  onPressed: () {},
                )),
            SizedBox(width: 15)
          ]),
      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('This is the Drawer'),
              RaisedButton(
                onPressed: _closeDrawer,
                child: const Text('Close Drawer'),
              ),
            ],
          ),
        ),
      ),
      // Disable opening the drawer with a swipe gesture.
      drawerEnableOpenDragGesture: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: now,
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                ).then(
                  (date) => {
                    if (date != null)
                      {
                        setState(() {
                          now = date;
                        })
                      }
                  },
                );
              },
              child: Text(
                DateFormat('dd-MMM').format(now),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                color: Colors.grey[300],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                'CqMyOE via Yog',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(DateFormat('E').format(
                                      now.subtract(new Duration(days: 7)))),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(DateFormat('E').format(
                                      now.subtract(new Duration(days: 6)))),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(DateFormat('E').format(
                                      now.subtract(new Duration(days: 5)))),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(DateFormat('E').format(
                                      now.subtract(new Duration(days: 4)))),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(DateFormat('E').format(
                                      now.subtract(new Duration(days: 3)))),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(DateFormat('E').format(
                                      now.subtract(new Duration(days: 2)))),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(DateFormat('E').format(
                                      now.subtract(new Duration(days: 1)))),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: CheckBox(),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                color: Colors.grey[300],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                'CqMyOE via Dhyaan',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(DateFormat('E').format(
                                      now.subtract(new Duration(days: 7)))),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(DateFormat('E').format(
                                      now.subtract(new Duration(days: 6)))),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(DateFormat('E').format(
                                      now.subtract(new Duration(days: 5)))),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(DateFormat('E').format(
                                      now.subtract(new Duration(days: 4)))),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(DateFormat('E').format(
                                      now.subtract(new Duration(days: 3)))),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(DateFormat('E').format(
                                      now.subtract(new Duration(days: 2)))),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(DateFormat('E').format(
                                      now.subtract(new Duration(days: 1)))),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Counter(),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                color: Colors.grey[300],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: Text(
                                'CqMyOE via Habits',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(DateFormat('E').format(
                                      now.subtract(new Duration(days: 7)))),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(DateFormat('E').format(
                                      now.subtract(new Duration(days: 6)))),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(DateFormat('E').format(
                                      now.subtract(new Duration(days: 5)))),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(DateFormat('E').format(
                                      now.subtract(new Duration(days: 4)))),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(DateFormat('E').format(
                                      now.subtract(new Duration(days: 3)))),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(DateFormat('E').format(
                                      now.subtract(new Duration(days: 2)))),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(DateFormat('E').format(
                                      now.subtract(new Duration(days: 1)))),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return IconButton(
                            icon: Icon(
                              Icons.fast_forward,
                              color: Colors.blue,
                            ),
                            iconSize: constraints.biggest.height,
                            onPressed: () {
                              Navigator.pushNamed(context, '/HabitsPage');
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                color: Colors.grey[300],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: Text(
                                'CqMyOE via Nutrition',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(DateFormat('E').format(
                                      now.subtract(new Duration(days: 7)))),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(DateFormat('E').format(
                                      now.subtract(new Duration(days: 6)))),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(DateFormat('E').format(
                                      now.subtract(new Duration(days: 5)))),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(DateFormat('E').format(
                                      now.subtract(new Duration(days: 4)))),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(DateFormat('E').format(
                                      now.subtract(new Duration(days: 3)))),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(DateFormat('E').format(
                                      now.subtract(new Duration(days: 2)))),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(DateFormat('E').format(
                                      now.subtract(new Duration(days: 1)))),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return IconButton(
                            icon: Icon(
                              Icons.fast_forward,
                              color: Colors.blue,
                            ),
                            iconSize: constraints.biggest.height,
                            onPressed: () {
                              Navigator.pushNamed(context, '/NutritionPage');
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text('Completed a CqMyOE program. Can\'t see attendance?'),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                'Click Here',
                style: TextStyle(
                  color: Colors.blue[600],
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
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
    return LayoutBuilder(
      builder: (context, constraint) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return IconButton(
              icon: Icon(
                _checked ? Icons.clear : Icons.check,
              ),
              color: _checked ? Colors.red : Colors.green,
              iconSize: constraint.biggest.height,
              onPressed: () {
                setState(() {
                  _checked = !_checked;
                });
              },
            );
          },
        );
      },
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove_circle),
          color: Colors.red,
          onPressed: () {
            if (i > 0) {
              i--;
              setState(() {
                i = i;
              });
            }
          },
        ),
        Text(
          i.toString(),
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: Icon(Icons.add_circle),
          color: Colors.green,
          onPressed: () {
            if (i < 9) {
              i++;
              setState(() {
                i = i;
              });
            }
          },
        ),
      ],
    );
  }
}
