import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// ignore: unused_import
import 'package:keep_notes/EditNoteView.dart';
import 'package:keep_notes/NoteView.dart';
import 'package:keep_notes/color.dart';
import 'package:keep_notes/createNoteview.dart';
import 'package:keep_notes/sideMenuBar.dart';

// ignore: camel_case_types
class Archive extends StatefulWidget {
  const Archive({Key? key}) : super(key: key);

  @override
  _ArchiveState createState() => _ArchiveState();
}

// ignore: camel_case_types
class _ArchiveState extends State<Archive> {
  GlobalKey<ScaffoldState> _drawKey = GlobalKey();
  String note = "ARCHIVE ARCHIVE ARCHIVE";
  String note1 = "ARCHIVE ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        splashColor: bgcolor,
        child: Icon(Icons.add, size: 45.0),
        backgroundColor: cardcolor,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => createNoteView()));
        },
      ),
      endDrawerEnableOpenDragGesture: true,
      key: _drawKey,
      drawer: SideMenu(),
      backgroundColor: bgcolor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: MediaQuery.of(context).size.width,
                height: 55,
                decoration: BoxDecoration(
                    color: cardcolor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 3)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              _drawKey.currentState!.openDrawer();
                            },
                            icon: Icon(
                              Icons.menu,
                              color: white,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Container(
                              height: 55,
                              width: 200,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Search your Archive notes ",
                                      style: TextStyle(
                                          color: white.withOpacity(0.5),
                                          fontSize: 16),
                                    ),
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Expanded(
                        child: Row(
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                  overlayColor: MaterialStateColor.resolveWith(
                                      (states) => white.withOpacity(0.1)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0)))),
                              onPressed: () {},
                              child: Icon(
                                Icons.grid_view,
                                color: white,
                              ),
                            ),
                            SizedBox(width: 16),
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Column(
                  children: [
                    Text(
                      "ALL",
                      style: TextStyle(
                          color: white.withOpacity(0.5),
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                height: MediaQuery.of(context).size.height,
                child: StaggeredGridView.countBuilder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  crossAxisCount: 4,
                  staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NoteView()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: index.isEven ? Colors.green[900] : Colors.blue,
                          border: Border.all(
                              color: index.isEven
                                  ? Colors.green.withOpacity(0.4)
                                  : Colors.blue.withOpacity(0.4)),
                          borderRadius: BorderRadius.circular(7)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            " heading",
                            style: TextStyle(
                                color: white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                              index.isEven
                                  ? note.length > 250
                                      ? "${note.substring(0, 250)}..."
                                      : note
                                  : note1,
                              style: TextStyle(color: white))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
