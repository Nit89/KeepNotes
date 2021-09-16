import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

//OpenFile.open("/sdcard/example.txt", type: "text/plain", uti: "public.plain-text");
// ignore: camel_case_types
class excel extends StatefulWidget {
  excel({Key? key}) : super(key: key);

  @override
  _excelState createState() => _excelState();
}

// ignore: camel_case_types
class _excelState extends State<excel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: createExcel,
        child: Text('Open Excel'),
        style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
      ),
    );
  }

  Future<void> createExcel() async {
    final Workbook workbook = Workbook();
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();
    final String path = (await getApplicationDocumentsDirectory()).path;
    final String fileName = '$path/output.xlsx';
    final File file = File(fileName);
    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open(fileName);
  }
}
