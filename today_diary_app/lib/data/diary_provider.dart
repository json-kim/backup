import 'package:flutter/material.dart';

import './diary.dart';
import '../helper/date_helper.dart';
import '../helper/sqflite_helper.dart';

class DiaryProvider with ChangeNotifier {
  DateHelper _dateHelper;
  SqfliteHelper _sqlHelper;
  Map<String, Diary> diaries = {};
  int _year;
  int _month;
  int _day;

  int get year => _year;
  int get month => _month;
  int get day => _day;
  int get numOfDiaries => diaries.length;

  DiaryProvider() {
    _dateHelper = DateHelper();
    _year = DateHelper.thisYear;
    _month = DateHelper.thisMonth;
    _day = DateHelper.thisDay;
    _sqlHelper = SqfliteHelper();
    //_initDB();
    getFromDevice();
    print("<<< Diary Providr >>>");
  }

  bool setYear(DateTime date) {
    if (date.year > DateHelper.maxTime.year ||
        date.year < DateHelper.minTime.year) return false;
    _year = date.year;
    notifyListeners();
  }

  bool plusMinusYear(bool pm) {
    if (pm) {
      if (_year == DateHelper.maxTime.year) return false;
      _year++;
    } else {
      if (_year == DateHelper.minTime.year) return false;
      _year--;
    }
    notifyListeners();
  }

  bool setMonth(DateTime date) {
    if (date.year > DateHelper.maxTime.year ||
        date.year < DateHelper.minTime.year) return false;
    _month = date.month;
    notifyListeners();
  }

  bool setDay(DateTime date) {
    if (date.year > DateHelper.maxTime.year ||
        date.year < DateHelper.minTime.year) return false;
    _day = date.day;
  }

  bool isInDiaries(DateTime date) {
    return diaries.containsKey(DateHelper.dateToString(date));
  }

  Diary getDiaryWithDate(DateTime date) {
    return diaries[DateHelper.dateToString(date)];
  }

  Future<void> saveDiary(Diary diary) {
    try {
      // sql 저장 후 반영
      _sqlHelper.insertDiary(diary).then((_) {
        diaries.update(
          diary.key,
          (_) => diary,
          ifAbsent: () => diary,
        );
        notifyListeners();
      });
    } catch (e) {}
  }

  Future<void> getFromFirestore() {}

  Future<void> getFromDevice() async {
    try {
      _sqlHelper.loadDB().then((_) async {
        final loadDiaries = await _sqlHelper.getDiaries();
        if (loadDiaries != null) diaries = loadDiaries;
        notifyListeners();
      });
    } catch (e) {}
  }

  Future<void> getFromSharedPref() {}

  Future<void> removeFromFirestore() {}

  Future<void> removeFromDevice(Diary diary) {
    if (diary == null) return null;

    try {
      _sqlHelper.deleteDiary(diary).then((_) {
        diaries.remove(diary.key);
        notifyListeners();
      });
    } catch (e) {}
  }

  Future<void> removeFromSharedPref() {}
}
