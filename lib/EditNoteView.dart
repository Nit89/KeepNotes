import 'package:flutter/material.dart';
import 'package:keep_notes/color.dart';

class EditNoteView extends StatefulWidget {
  EditNoteView({Key? key}) : super(key: key);

  @override
  _EditNoteViewState createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
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
              icon: Icon(Icons.save_outlined)),
        ],
      ),
      body: Container(
        child: Column(
          children: [Text("data"), Text("df")],
        ),
      ),
    );
  }
}
