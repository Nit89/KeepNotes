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
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            TextField(
              cursorColor: white,
              style: TextStyle(fontSize: 25, color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "TITLE",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.withOpacity(0.8),
                ),
              ),
            ),
            Container(
              height: 300,
              child: TextField(
                keyboardType: TextInputType.multiline,
                minLines: 50,
                maxLines: null,
                cursorColor: white,
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Note",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
