import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/widgets/I18nText.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streaks/state/providers/preferences.dart';
import 'meals/meal_screen.dart';
import 'insights/nutrition_data_load.dart';
import 'package:streaks/aspects/themes/themes.dart' as themes;

class MyHomePage extends StatelessWidget {
  MyHomePage() : super();

  @override
  Widget build(BuildContext context) {
    void _closeDrawer() {
      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(
        title: I18nText('main.home'),
        automaticallyImplyLeading: true,
        titleSpacing: 0.0,
      ),
      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                I18nText('main.drawer'),
                ElevatedButton(
                  onPressed: _closeDrawer,
                  child: I18nText('main.close_drawer'),
                )
              ]),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                I18nText('main.theme_picker'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: themes.themeOf.entries.map((theme) {
                    return ElevatedButton(
                        child: Text(''),
                        onPressed: () {
                          context.read(themeProvider).state = theme.key;
                        },
                        style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            primary: theme.value.primaryColor));
                  }).toList(),
                )
              ])
            ],
          ),
        ),
      ),
      drawerEnableOpenDragGesture: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MealPage()),
                );
              },
              child: I18nText('main.show_meals'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NutritionDataLoad()),
                );
              },
              child: I18nText('main.how_am_i_doing'),
            )
          ],
        ),
      ),
    );
  }
}
