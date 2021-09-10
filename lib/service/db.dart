// ignore: unused_import
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();
  static Database? _database;
  NotesDatabase._init();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initializeDB('Notes.db');
    return _database;
  }

  Future<Database> _initializeDB(String filepath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filepath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE Notes(
      id INTEGER PRIMARY KEY AUTOINCREMENT;
      Pin BOOLEAN NOT NULL,
      title TEXT NOT NULL,
      content TEXT NOT NULL,
      createdTime TEXT NOT NULL,
      
    )
    
    ''');
  }

  Future<bool?> insertEntry() async {
    final db = await instance.database;
    await db!.insert("Notes", {
      "pin": 0,
      "title": " this",
      "content": "this is content",
      "createdTime": "12 aug"
    });
  }

  Future<String> readAllNotes() async {
    final db = await instance.database;
    final orderBy = 'createdTime ASC';
    final query_result = await db!.query("NOTES");
    print(query_result);
    return "SUCESS";
  }

  Future<String> readOneNote(int id) async {
    final db = await instance.database;
    final map = await db!.query(NotesImpNames.TableName,
        columns: NotesImpNames.values,
        where: '${NotesImpNames.id} = ?',
        whereArgs: [id]);
    if (map.isNotEmpty) {
      return Note.fromJson(map.first);
    } else {
      return null;
    }
  }

  Future updateNote(Note note) async {
    final db = await instance.database;

    await db!.update(NotesImpNames.TableName, note.toJson(),
        where: '${NotesImpNames.id} = ?', whereArgs: [note.id]);
  }

  Future delteNote(Note note) async {
    final db = await instance.database;

    await db!.delete(NotesImpNames.TableName,
        where: '${NotesImpNames.id}= ?', whereArgs: [note.id]);
  }
}
