import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../data/diary.dart';

class SqfliteHelper {
  Database _diaryDB;

  SqfliteHelper() {
    print('<<< SQL Helper >>>');
  }

  Future<void> loadDB() async {
    await _openDB();
    print('<<< load DB >>>');
  }

  Future<void> _openDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'diary.db');
    //await deleteDatabase(path);
    Database db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Diary (id TEXT PRIMARY KEY, year INTEGER, month INTEGER, day INTEGER, feel INTEGER, message TEXT)');
    });

    _diaryDB = db;
    print('<<< open DB >>>');
  }

  Future<Map<String, Diary>> getDiaries() async {
    final List<Map<String, dynamic>> maps = await _diaryDB?.query('Diary');
    if (maps == null) return null;

    Map<String, Diary> diaries = {};
    maps.forEach((date) {
      final diary = Diary(
        color: date['feel'],
        dateTime: DateTime(date['year'], date['month'], date['day']),
        text: date['message'],
      );
      diaries[diary.key] = diary;
    });
    print('<<< get Diaries >>>');
    return diaries;
  }

  Future<void> insertDiary(Diary diary) async {
    await _diaryDB?.insert('Diary', diary.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> updateDiary(Diary diary) async {
    await _diaryDB?.update('Diary', diary.toJson(),
        where: 'id = ?', whereArgs: [diary.key]);
  }

  Future<void> deleteDiary(Diary diary) async {
    await _diaryDB?.delete('Diary', where: 'id = ?', whereArgs: [diary.key]);
  }
}
