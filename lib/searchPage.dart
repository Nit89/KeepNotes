import 'package:flutter/material.dart';
import 'package:keep_notes/color.dart';

class searchPage extends StatefulWidget {
  searchPage({Key? key}) : super(key: key);

  @override
  _searchPageState createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Search Your Notes",
                  hintStyle:
                      TextStyle(color: white.withOpacity(0.5), fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
