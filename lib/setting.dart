import 'package:flutter/material.dart';
import 'package:keep_notes/color.dart';
import 'package:keep_notes/service/login_info.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late bool value;

  getSyncSet() async {
    LocalDataSaver.getSyncSet().then((valueFromDb) {
      setState(() {
        value = valueFromDb!;
      });
    });
  }

  @override
  @override
  void initState() {
    getSyncSet();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0.0,
        title: Text("Settings"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
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
                      onChanged: (switchvalue) {
                        setState(() {
                          this.value = switchvalue;
                          LocalDataSaver.saveSyncSet(switchvalue);
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
