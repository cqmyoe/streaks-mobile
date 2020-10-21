import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Nutrition extends StatefulWidget {
  @override
  _Nutrition createState() => _Nutrition();
}

class _Nutrition extends State<Nutrition> {
  final inputTextController = TextEditingController();

  @override
  void dispose() {
    inputTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nutrition'),
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Calories'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InputText(),
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
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Net Carbs'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InputText(),
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
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Proteins'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InputText(),
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
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Pure Fats'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InputText(),
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
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Green juice'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InputText(),
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
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Green intake'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InputText(),
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
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Lemon'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InputText(),
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
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('ACV'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InputText(),
                          Text('/ 1 spoon'),
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
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Intermittent Fasting'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InputText(),
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
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Salt awareness'),
                      ),
                    ),
                    Expanded(
                      child: CheckBox(),
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Yog/Walk/Stairs'),
                      ),
                    ),
                    Expanded(
                      child: CheckBox(),
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Sleep of 7-8 hours'),
                      ),
                    ),
                    Expanded(
                      child: CheckBox(),
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Kaizen 1% improvement'),
                      ),
                    ),
                    Expanded(
                      child: CheckBox(),
                    ),
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Soaked nuts'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InputText(),
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
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Seeds'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InputText(),
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
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Sugar'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InputText(),
                          Text('/ 1 table spoon'),
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
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Sunlight'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InputText(),
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
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Breathing'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InputText(),
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
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: Text('Ready for tomorrow'),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InputText(),
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
                            width: 100,
                            height: 20,
                            child: TextField(
                              controller: inputTextController,
                              keyboardType: TextInputType.number,
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

class InputText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InputText();
}

class _InputText extends State<InputText> {
  final inputTextController = TextEditingController();

  @override
  void dispose() {
    inputTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 20,
      child: TextField(
        controller: inputTextController,
        keyboardType: TextInputType.number,
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
    return IconButton(
      icon: Icon(
        _checked ? Icons.clear : Icons.check,
      ),
      color: _checked ? Colors.red : Colors.green,
      onPressed: () {
        setState(() {
          _checked = !_checked;
        });
      },
    );
  }
}

/*Expanded(
    child: ListView.builder(
      itemCount: nutritionTemplate.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.fromLTRB(2, 1, 2, 1),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: ListTile(
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  onTap: () {},
                  title: Text(
                    nutritionTemplate[index].toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InputText(),
                    Text('/2000'),
                  ],
                ),
              )
            ],
          ),
        );
      },
    ),
  ),*/
