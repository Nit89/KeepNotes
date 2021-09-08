import 'package:flutter/material.dart';
import 'package:keep_notes/color.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgcolor,
        elevation: 0.0,
        title: Text("Settings"),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text("Sync",
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                Spacer(),
                Transform.scale(
                  scale: 1.3,
                  child: Switch.adaptive(
                      value: value,
                      onChanged: (value) {
                        setState(() {
                          this.value = value;
                        });
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
