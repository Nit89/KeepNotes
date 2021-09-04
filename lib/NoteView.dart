import 'package:flutter/material.dart';
import 'package:keep_notes/EditNoteView.dart';
import 'package:keep_notes/color.dart';

class NoteView extends StatefulWidget {
  NoteView({Key? key}) : super(key: key);

  @override
  _NoteViewState createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  String note =
      "THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: bgcolor,
        elevation: 0.0,
        actions: [
          IconButton(
              splashColor: Colors.blue,
              splashRadius: 20,
              onPressed: () {},
              icon: Icon(Icons.push_pin_outlined)),
          IconButton(
              splashColor: Colors.blue,
              splashRadius: 20,
              onPressed: () {},
              icon: Icon(Icons.archive_outlined)),
          IconButton(
              splashColor: Colors.blue,
              splashRadius: 20,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditNoteView()));
              },
              icon: Icon(Icons.edit_outlined)),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Heading",
            style: TextStyle(
                color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            note,
            style: TextStyle(color: Colors.white),
          ),
        ]),
      ),
    );
  }
}
