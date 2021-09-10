import 'package:flutter/material.dart';
import 'package:keep_notes/color.dart';

// ignore: camel_case_types
class searchPage extends StatefulWidget {
  searchPage({Key? key}) : super(key: key);

  @override
  _searchPageState createState() => _searchPageState();
}

// ignore: camel_case_types
class _searchPageState extends State<searchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: TextField(
                style: TextStyle(color: Colors.white),
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
