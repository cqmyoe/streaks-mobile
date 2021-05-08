import 'package:flutter/material.dart';
import 'package:streaks/ux_tree/logged_in/meals/new_meal/portion_size.dart';

import '../meal_screen.dart';

class NameSearch extends SearchDelegate<String> {
  final List<foodClass> names;
  String result = '';
  NameSearch(this.names);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, result);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestions = names.where(
        (name) => name.foodName.toLowerCase().contains(query.toLowerCase()));

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            suggestions.elementAt(index).foodName,
          ),
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PortionSize()),
            );
            result = suggestions.elementAt(index).foodName;
            close(context, result);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = names.where(
        (name) => name.foodName.toLowerCase().contains(query.toLowerCase()));

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            suggestions.elementAt(index).foodName,
          ),
          onTap: () {
            query = suggestions.elementAt(index).foodName;
          },
        );
      },
    );
  }
}
