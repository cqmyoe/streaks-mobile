import 'package:Streaks/Models/nutrition_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'Models/date_time.dart';

class Nutrition extends StatefulWidget {
  @override
  _Nutrition createState() => _Nutrition();
}

class _Nutrition extends State<Nutrition> {
  final nutritionDB = Hive.box<NutritionData>('NutritionDB');
  DateTime now = DateTime.now().toLocal();
  int k = 0;

  Future<String> createAlertDialog(BuildContext context) {
    TextEditingController myController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter value'),
          content: TextField(
            controller: myController,
            keyboardType: TextInputType.number,
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

  Future<String> createAlertDialog1(BuildContext context) {
    TextEditingController myController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter value'),
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
        title: Text('CqMyOE via Nutrition'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
              Card(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Calories'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width * 0.45 - 50,
                            child: FlatButton(
                              child: Text(nutritionDB
                                  .get(curDate)
                                  .record[0]
                                  .toString()),
                              onPressed: () {
                                createAlertDialog(context).then((value) {
                                  if (value != "" && value != null) {
                                    List<String> temp =
                                        nutritionDB.get(curDate).record;
                                    temp[0] = value;
                                    NutritionData temp1 =
                                        new NutritionData(temp);
                                    nutritionDB.put(curDate, temp1);
                                    setState(() {});
                                  }
                                });
                              },
                              color: Colors.grey[200],
                            ),
                          ),
                          Text('/ 2000'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Net Carbs'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width * 0.45 - 50,
                            child: FlatButton(
                              child: Text(nutritionDB
                                  .get(curDate)
                                  .record[1]
                                  .toString()),
                              onPressed: () {
                                createAlertDialog(context).then((value) {
                                  if (value != "" && value != null) {
                                    List<String> temp =
                                        nutritionDB.get(curDate).record;
                                    temp[1] = value;
                                    NutritionData temp1 =
                                        new NutritionData(temp);
                                    nutritionDB.put(curDate, temp1);
                                    setState(() {});
                                  }
                                });
                              },
                              color: Colors.grey[200],
                            ),
                          ),
                          Text('/ 350g'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Proteins'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width * 0.45 - 50,
                            child: FlatButton(
                              child: Text(nutritionDB
                                  .get(curDate)
                                  .record[3]
                                  .toString()),
                              onPressed: () {
                                createAlertDialog(context).then((value) {
                                  if (value != "" && value != null) {
                                    List<String> temp =
                                        nutritionDB.get(curDate).record;
                                    temp[3] = value;
                                    NutritionData temp1 =
                                        new NutritionData(temp);
                                    nutritionDB.put(curDate, temp1);
                                    setState(() {});
                                  }
                                });
                              },
                              color: Colors.grey[200],
                            ),
                          ),
                          Text('/ 60g'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Pure Fats'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width * 0.45 - 50,
                            child: FlatButton(
                              child: Text(nutritionDB
                                  .get(curDate)
                                  .record[4]
                                  .toString()),
                              onPressed: () {
                                createAlertDialog(context).then((value) {
                                  if (value != "" && value != null) {
                                    List<String> temp =
                                        nutritionDB.get(curDate).record;
                                    temp[4] = value;
                                    NutritionData temp1 =
                                        new NutritionData(temp);
                                    nutritionDB.put(curDate, temp1);
                                    setState(() {});
                                  }
                                });
                              },
                              color: Colors.grey[200],
                            ),
                          ),
                          Text('/ 60g'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Green juice (in glass)'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width * 0.45 - 50,
                            child: FlatButton(
                              child: Text(nutritionDB
                                  .get(curDate)
                                  .record[5]
                                  .toString()),
                              onPressed: () {
                                createAlertDialog(context).then((value) {
                                  if (value != "" && value != null) {
                                    List<String> temp =
                                        nutritionDB.get(curDate).record;
                                    temp[5] = value;
                                    NutritionData temp1 =
                                        new NutritionData(temp);
                                    nutritionDB.put(curDate, temp1);
                                    setState(() {});
                                  }
                                });
                              },
                              color: Colors.grey[200],
                            ),
                          ),
                          Text('/ 1 glass'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Green intake (in cups)'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width * 0.45 - 50,
                            child: FlatButton(
                              child: Text(nutritionDB
                                  .get(curDate)
                                  .record[6]
                                  .toString()),
                              onPressed: () {
                                createAlertDialog(context).then((value) {
                                  if (value != "" && value != null) {
                                    List<String> temp =
                                        nutritionDB.get(curDate).record;
                                    temp[6] = value;
                                    NutritionData temp1 =
                                        new NutritionData(temp);
                                    nutritionDB.put(curDate, temp1);
                                    setState(() {});
                                  }
                                });
                              },
                              color: Colors.grey[200],
                            ),
                          ),
                          Text('/ 5 cups'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Lemon'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width * 0.45 - 50,
                            child: FlatButton(
                              child: Text(nutritionDB
                                  .get(curDate)
                                  .record[7]
                                  .toString()),
                              onPressed: () {
                                createAlertDialog(context).then((value) {
                                  if (value != "" && value != null) {
                                    List<String> temp =
                                        nutritionDB.get(curDate).record;
                                    temp[7] = value;
                                    NutritionData temp1 =
                                        new NutritionData(temp);
                                    nutritionDB.put(curDate, temp1);
                                    setState(() {});
                                  }
                                });
                              },
                              color: Colors.grey[200],
                            ),
                          ),
                          Text('/ 2'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('ACV (in tea spoons)'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width * 0.45 - 50,
                            child: FlatButton(
                              child: Text(nutritionDB
                                  .get(curDate)
                                  .record[8]
                                  .toString()),
                              onPressed: () {
                                createAlertDialog(context).then((value) {
                                  if (value != "" && value != null) {
                                    List<String> temp =
                                        nutritionDB.get(curDate).record;
                                    temp[8] = value;
                                    NutritionData temp1 =
                                        new NutritionData(temp);
                                    nutritionDB.put(curDate, temp1);
                                    setState(() {});
                                  }
                                });
                              },
                              color: Colors.grey[200],
                            ),
                          ),
                          Text('/ 1'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Intermittent Fasting'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width * 0.45 - 50,
                            child: FlatButton(
                              child: Text(nutritionDB
                                  .get(curDate)
                                  .record[9]
                                  .toString()),
                              onPressed: () {
                                createAlertDialog(context).then((value) {
                                  if (value != "" && value != null) {
                                    List<String> temp =
                                        nutritionDB.get(curDate).record;
                                    temp[9] = value;
                                    NutritionData temp1 =
                                        new NutritionData(temp);
                                    nutritionDB.put(curDate, temp1);
                                    setState(() {});
                                  }
                                });
                              },
                              color: Colors.grey[200],
                            ),
                          ),
                          Text('/ 10 hrs'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Salt awareness' + k.toString()),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          CheckBox(
                            10,
                            nutritionDB.get(curDate).record[10] ?? '0',
                            k,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Yog/Walk/Stairs'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          CheckBox(
                            11,
                            nutritionDB.get(curDate).record[11] ?? '0',
                            k,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Sleep of 7-8 hours'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          CheckBox(
                            12,
                            nutritionDB.get(curDate).record[12] ?? '0',
                            k,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Kaizen 1% improvement'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          CheckBox(
                            13,
                            nutritionDB.get(curDate).record[13] ?? '0',
                            k,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Soaked nuts'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width * 0.45 - 50,
                            child: FlatButton(
                              child: Text(nutritionDB
                                  .get(curDate)
                                  .record[14]
                                  .toString()),
                              onPressed: () {
                                createAlertDialog(context).then((value) {
                                  if (value != "" && value != null) {
                                    List<String> temp =
                                        nutritionDB.get(curDate).record;
                                    temp[14] = value;
                                    NutritionData temp1 =
                                        new NutritionData(temp);
                                    nutritionDB.put(curDate, temp1);
                                    setState(() {});
                                  }
                                });
                              },
                              color: Colors.grey[200],
                            ),
                          ),
                          Text('/ 5'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Seeds'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width * 0.45 - 50,
                            child: FlatButton(
                              child: Text(nutritionDB
                                  .get(curDate)
                                  .record[15]
                                  .toString()),
                              onPressed: () {
                                createAlertDialog(context).then((value) {
                                  if (value != "" && value != null) {
                                    List<String> temp =
                                        nutritionDB.get(curDate).record;
                                    temp[15] = value;
                                    NutritionData temp1 =
                                        new NutritionData(temp);
                                    nutritionDB.put(curDate, temp1);
                                    setState(() {});
                                  }
                                });
                              },
                              color: Colors.grey[200],
                            ),
                          ),
                          Text('/ 5'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Sugar (in table spoons)'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width * 0.45 - 50,
                            child: FlatButton(
                              child: Text(nutritionDB
                                  .get(curDate)
                                  .record[16]
                                  .toString()),
                              onPressed: () {
                                createAlertDialog(context).then((value) {
                                  if (value != "" && value != null) {
                                    List<String> temp =
                                        nutritionDB.get(curDate).record;
                                    temp[16] = value;
                                    NutritionData temp1 =
                                        new NutritionData(temp);
                                    nutritionDB.put(curDate, temp1);
                                    setState(() {});
                                  }
                                });
                              },
                              color: Colors.grey[200],
                            ),
                          ),
                          Text('/ 1'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Sunlight'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width * 0.45 - 50,
                            child: FlatButton(
                              child: Text(nutritionDB
                                  .get(curDate)
                                  .record[17]
                                  .toString()),
                              onPressed: () {
                                createAlertDialog(context).then((value) {
                                  if (value != "" && value != null) {
                                    List<String> temp =
                                        nutritionDB.get(curDate).record;
                                    temp[17] = value;
                                    NutritionData temp1 =
                                        new NutritionData(temp);
                                    nutritionDB.put(curDate, temp1);
                                    setState(() {});
                                  }
                                });
                              },
                              color: Colors.grey[200],
                            ),
                          ),
                          Text('/ 10 min'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Breathing'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width * 0.45 - 50,
                            child: FlatButton(
                              child: Text(nutritionDB
                                  .get(curDate)
                                  .record[18]
                                  .toString()),
                              onPressed: () {
                                createAlertDialog(context).then((value) {
                                  if (value != "" && value != null) {
                                    List<String> temp =
                                        nutritionDB.get(curDate).record;
                                    temp[18] = value;
                                    NutritionData temp1 =
                                        new NutritionData(temp);
                                    nutritionDB.put(curDate, temp1);
                                    setState(() {});
                                  }
                                });
                              },
                              color: Colors.grey[200],
                            ),
                          ),
                          Text('/ 2 min'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Ready for tomorrow'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width * 0.45 - 50,
                            child: FlatButton(
                              child: Text(nutritionDB
                                  .get(curDate)
                                  .record[19]
                                  .toString()),
                              onPressed: () {
                                createAlertDialog(context).then((value) {
                                  if (value != "" && value != null) {
                                    List<String> temp =
                                        nutritionDB.get(curDate).record;
                                    temp[19] = value;
                                    NutritionData temp1 =
                                        new NutritionData(temp);
                                    nutritionDB.put(curDate, temp1);
                                    setState(() {});
                                  }
                                });
                              },
                              color: Colors.grey[200],
                            ),
                          ),
                          Text('/ 3'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Sources of Fat'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: FlatButton(
                              child: Text(nutritionDB
                                  .get(curDate)
                                  .record[20]
                                  .toString()),
                              onPressed: () {
                                createAlertDialog1(context).then((value) {
                                  if (value != "" && value != null) {
                                    List<String> temp =
                                        nutritionDB.get(curDate).record;
                                    temp[20] = value;
                                    NutritionData temp1 =
                                        new NutritionData(temp);
                                    nutritionDB.put(curDate, temp1);
                                    setState(() {});
                                  }
                                });
                              },
                              color: Colors.grey[200],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckBox extends StatefulWidget {
  final int index;
  final String value;
  final int k;
  CheckBox(this.index, this.value, this.k);
  @override
  State<StatefulWidget> createState() => _CheckBox(index, value, k);
}

class _CheckBox extends State<CheckBox> {
  int index;
  String value;
  int k;
  _CheckBox(this.index, this.value, this.k);

  @override
  void didUpdateWidget(covariant CheckBox oldWidget) {
    if (oldWidget.k != widget.k) {
      k = widget.k;
      value = widget.value;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    bool checked = value == '1' ? true : false;
    return IconButton(
      icon: Icon(
        checked ? Icons.check : Icons.clear,
      ),
      color: checked ? Colors.green : Colors.red,
      onPressed: () {
        final nutritionDB = Hive.box<NutritionData>('NutritionDB');
        String date;
        if (k == 0)
          date = day0;
        else if (k == 1)
          date = day1;
        else if (k == 2)
          date = day2;
        else if (k == 3) date = day3;

        List<String> temp = nutritionDB.get(date).record;
        temp[index] = !checked ? '1' : '0';
        NutritionData temp1 = new NutritionData(temp);
        nutritionDB.put(date, temp1);
        setState(() {
          value = temp[index];
        });
      },
    );
  }
}
