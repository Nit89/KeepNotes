import 'package:flutter/material.dart';
import 'package:keep_notes/color.dart';

class SideMenu extends StatefulWidget {
  SideMenu({Key? key}) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          decoration: BoxDecoration(color: bgcolor),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Text(
                    "Google Keep",
                    style: TextStyle(
                        color: white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(
                  color: white.withOpacity(0.3),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                ),
                TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.orangeAccent.withOpacity(0.3)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(50),
                                        bottomRight: Radius.circular(50))))),
                    onPressed: () {},
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.lightbulb_outline,
                            size: 25,
                            color: white.withOpacity(0.7),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Notes",
                            style: TextStyle(
                              color: white.withOpacity(0.7),
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}
