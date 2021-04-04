import 'new_meal/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealPage extends StatefulWidget {
  @override
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  var meal1List = [];
  var meal2List = [];
  var meal3List = [];
  var meal4List = [];
  var meal5List = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(8, 16, 8, 16),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                // color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Meal 1',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Colors.blue,
                            size: 32,
                          ),
                          onPressed: () async {
                            final result = await showSearch<String>(
                              context: context,
                              delegate: NameSearch(names),
                            );
                            setState(() {
                              meal1List.add(result);
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: meal1List.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                          meal1List.elementAt(index),
                        ),
                        onTap: () {},
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(8, 16, 8, 16),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                // color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Meal 2',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Colors.blue,
                            size: 32,
                          ),
                          onPressed: () async {
                            final result = await showSearch<String>(
                              context: context,
                              delegate: NameSearch(names),
                            );
                            setState(() {
                              meal2List.add(result);
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: meal2List.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                          meal2List.elementAt(index),
                        ),
                        onTap: () {},
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(8, 16, 8, 16),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                // color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Meal 3',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Colors.blue,
                            size: 32,
                          ),
                          onPressed: () async {
                            final result = await showSearch<String>(
                              context: context,
                              delegate: NameSearch(names),
                            );
                            setState(() {
                              meal3List.add(result);
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: meal3List.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                          meal3List.elementAt(index),
                        ),
                        onTap: () {},
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(8, 16, 8, 16),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                // color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Meal 4',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Colors.blue,
                            size: 32,
                          ),
                          onPressed: () async {
                            final result = await showSearch<String>(
                              context: context,
                              delegate: NameSearch(names),
                            );
                            setState(() {
                              meal4List.add(result);
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: meal4List.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                          meal4List.elementAt(index),
                        ),
                        onTap: () {},
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(8, 16, 8, 16),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                // color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Meal 5',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Colors.blue,
                            size: 32,
                          ),
                          onPressed: () async {
                            final result = await showSearch<String>(
                              context: context,
                              delegate: NameSearch(names),
                            );
                            setState(() {
                              meal5List.add(result);
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: meal5List.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                          meal5List.elementAt(index),
                        ),
                        onTap: () {},
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const names = [
  'Roti',
  'Rice',
  'Tur Dal',
  'Bread',
  'Tea',
  'Dosa',
  'Idly',
  'Sambar',
  'Curry',
];
