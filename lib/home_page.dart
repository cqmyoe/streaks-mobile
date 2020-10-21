import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
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
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Text('Calendar'),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(4, 4, 4, 4),
                        child: Expanded(
                          child: Icon(
                            Icons.check_box,
                            size: 100,
                          ),
                        ),
                      )),
                  Expanded(child: Container()),
                ],
              ),
            )),
            Expanded(
                child: Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              color: Colors.blue,
            )),
            Expanded(
                child: Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              color: Colors.amber,
              child: Center(
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/HabitsPage');
                  },
                  title: Text(
                    'My Habits',
                  ),
                ),
              ),
            )),
            Expanded(
                child: Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              color: Colors.greenAccent,
              child: Center(
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/Nutrition');
                  },
                  title: Text(
                    'Nutrition',
                  ),
                ),
              ),
            )),
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text('Completed a CqMyOE program. Can\'t see attendance?'),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: FlatButton(
                onPressed: () {},
                child: Text('Click Here'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
