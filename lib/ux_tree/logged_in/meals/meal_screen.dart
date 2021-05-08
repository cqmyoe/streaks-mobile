import 'package:flutter_i18n/widgets/I18nText.dart';

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
        title: I18nText('main.meals'),
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
                              delegate: NameSearch(foods),
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
                              delegate: NameSearch(foods),
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
                              delegate: NameSearch(foods),
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
                              delegate: NameSearch(foods),
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
                              delegate: NameSearch(foods),
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

var foods = [
  foodClass('Wheat Roti', [2, 0, 17, 0, 0, 2, 67, 12, 85],
      [portion('Roti', 1), portion('grams', 1 / 35)]),
  foodClass('Chicken Soup', [16.8, 9.1, 0, 0, 2, 2.3, 32, 1.1, 130],
      [portion('Bowl', 1), portion('grams', 1 / 350)]),
  foodClass('Papad', [2.1, 0, 6, 1.6, 0, 1.6, 49, 1.3, 46],
      [portion('Piece', 1), portion('grams', 1 / 12)]),
  foodClass('Cabbage Sabzi', [1.5, 5.7, 0, 0, 4.2, 2.6, 45, 0.9, 62],
      [portion('Katori', 1), portion('grams', 1 / 100)]),
];

class foodClass {
  String foodName;
  List<double> valueList;
  List<portion> portionList;
  foodClass(this.foodName, this.valueList, this.portionList);
}

class portion {
  String type;
  double multiplier;
  portion(this.type, this.multiplier);
}
