import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextButton.icon(
              onPressed: () {},
              label: Text(
                'Track All',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.greenAccent,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.fromLTRB(16, 0, 8, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[300],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter a search term',
                      ),
                    ),
                  ),
                  IconButton(icon: Icon(Icons.search), onPressed: () {})
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
                children: [
                  Expanded(child: Text('data')),
                  IconButton(icon: Icon(Icons.close), onPressed: () {})
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
                children: [
                  Expanded(child: Text('data')),
                  IconButton(icon: Icon(Icons.close), onPressed: () {})
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
                children: [
                  Expanded(child: Text('data')),
                  IconButton(icon: Icon(Icons.close), onPressed: () {})
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
