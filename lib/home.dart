import 'package:flutter/material.dart';
import 'package:keep_notes/color.dart';
import 'package:keep_notes/sideMenuBar.dart';

// ignore: camel_case_types
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<home> {
  GlobalKey<ScaffoldState> _drawKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: true,
      key: _drawKey,
      drawer: SideMenu(),
      backgroundColor: bgcolor,
      body: SafeArea(
          child: Container(
        child: Column(
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
                  Row(
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
                      Container(
                        height: 55,
                        width: 200,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Search your notes",
                                style: TextStyle(
                                    color: white.withOpacity(0.5),
                                    fontSize: 16),
                              ),
                            ]),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
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
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
