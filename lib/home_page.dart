import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:Streaks/Models/date_time.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime now = DateTime.now();
  int k = 0;
  final yogList = Hive.box<bool>('YogDB');
  final dhyaanList = Hive.box<int>('DhyaanDB');

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    String curDate;
    if (k == 0)
      curDate = day0;
    else if (k == 1)
      curDate = day1;
    else if (k == 2)
      curDate = day2;
    else if (k == 3) curDate = day3;
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
      drawerEnableOpenDragGesture: true,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: max(MediaQuery.of(context).size.height - 100, 700),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          k = 0;
                        });
                      },
                      child: Text(
                        DateFormat('dd-MMM').format(now),
                      ),
                      color: (k == 0) ? Colors.greenAccent : Colors.grey,
                    ),
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          k = 1;
                        });
                      },
                      child: Text(
                        DateFormat('dd-MMM')
                            .format(now.subtract(new Duration(days: 1))),
                      ),
                      color: (k == 1) ? Colors.greenAccent : Colors.grey,
                    ),
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          k = 2;
                        });
                      },
                      child: Text(
                        DateFormat('dd-MMM')
                            .format(now.subtract(new Duration(days: 2))),
                      ),
                      color: (k == 2) ? Colors.greenAccent : Colors.grey,
                    ),
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          k = 3;
                        });
                      },
                      child: Text(
                        DateFormat('dd-MMM')
                            .format(now.subtract(new Duration(days: 3))),
                      ),
                      color: (k == 3) ? Colors.greenAccent : Colors.grey,
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 40, 10, 20),
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
                              // WeekHistory(),
                            ],
                          ),
                        ),
                        Expanded(
                          child: CheckBox(k, yogList.get(curDate)),
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
                            ],
                          ),
                        ),
                        Expanded(
                          child: Counter(
                            dhyaanList.get(curDate),
                            k,
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
                                    'CqMyOE via Habits',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
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
                                  Navigator.pushNamed(
                                      context, '/HabitsDataLoad');
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
                              // WeekHistory(),
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
                                  Navigator.pushNamed(
                                      context, '/NutritionDataLoad');
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
                  child: Text(
                      'Completed a CqMyOE program. Can\'t see attendance?'),
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
        ),
      ),
    );
  }
}

class CheckBox extends StatefulWidget {
  final int k;
  final bool checked;
  CheckBox(this.k, this.checked);
  @override
  State<StatefulWidget> createState() => _CheckBox(k, checked);
}

class _CheckBox extends State<CheckBox> {
  bool checked;
  int k;
  _CheckBox(this.k, this.checked);

  @override
  void didUpdateWidget(covariant CheckBox oldWidget) {
    if (oldWidget.k != widget.k) {
      k = widget.k;
      checked = widget.checked;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return IconButton(
          icon: Icon(
            checked ? Icons.check : Icons.clear,
          ),
          color: checked ? Colors.green : Colors.red,
          iconSize: constraint.biggest.height,
          onPressed: () {
            final yogList = Hive.box<bool>('YogDB');
            String date;
            if (k == 0)
              date = day0;
            else if (k == 1)
              date = day1;
            else if (k == 2)
              date = day2;
            else if (k == 3) date = day3;
            yogList.put(date, !checked);
            setState(() {
              checked = !checked;
            });
          },
        );
      },
    );
  }
}

class Counter extends StatefulWidget {
  final int count;
  final int k;
  Counter(this.count, this.k);
  @override
  _CounterState createState() => _CounterState(count, k);
}

class _CounterState extends State<Counter> {
  int count;
  int k;
  _CounterState(this.count, this.k);

  @override
  void didUpdateWidget(covariant Counter oldWidget) {
    if (oldWidget.k != widget.k) {
      k = widget.k;
      count = widget.count;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.remove_circle),
          color: Colors.red,
          onPressed: () {
            print(k);
            String date;
            if (k == 0)
              date = day0;
            else if (k == 1)
              date = day1;
            else if (k == 2)
              date = day2;
            else if (k == 3) date = day3;

            if (count > 0) {
              count--;
              final dhyaanList = Hive.box<int>('DhyaanDB');
              dhyaanList.put(date, count);
              setState(() {
                count = count;
              });
            }
          },
        ),
        Text(
          count.toString(),
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: Icon(Icons.add_circle),
          color: Colors.green,
          onPressed: () {
            print(k);
            String date;
            if (k == 0)
              date = day0;
            else if (k == 1)
              date = day1;
            else if (k == 2)
              date = day2;
            else if (k == 3) date = day3;
            if (count < 9) {
              count++;
              final dhyaanList = Hive.box<int>('DhyaanDB');
              dhyaanList.put(date, count);
              setState(() {
                count = count;
              });
            }
          },
        ),
      ],
    );
  }
}
