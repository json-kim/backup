import 'package:flutter/material.dart';

Map<int, String> weekdayKOR = {
  DateTime.monday: '월',
  DateTime.tuesday: '화',
  DateTime.wednesday: '수',
  DateTime.thursday: '목',
  DateTime.friday: '금',
  DateTime.saturday: '토',
  DateTime.sunday: '일',
};

class DateHelper {
  static DateTime minTime = DateTime(2019);
  static DateTime maxTime = DateTime(DateTime.now().year + 2, 12, 31);
  List<List<DateTime>> _weeks;

  DateHelper() {
    _setDefaultWeeks();
  }

  static int get thisYear => DateTime.now().year;

  static int get thisMonth => DateTime.now().month;

  static int get thisDay => DateTime.now().day;

  /*
  디폴트 값으로 2019년도부터 1년뒤 12월 31일까지의 날짜를
  List<List<DateTime>>형식으로 리턴한다. 
  안의 List는 한 주에 대한 List이다.
  */
  _setDefaultWeeks({DateTime startTime, DateTime endTime}) {
    final start = startTime ?? minTime;
    final end = endTime ?? maxTime;
    final List<List<DateTime>> weeks = [];
    for (int i = 0;
        end.difference(start.add(Duration(days: i * 7))).inDays >= 0;
        i++) {
      final week = getWeeksWithDate(start.add(Duration(days: i)));
      if (week != null) weeks.add(week);
    }
    _weeks = weeks;
    print("<<< set Default date helper >>>");
  }

  static bool dateCompare(DateTime date1, DateTime date2) {
    if (date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day)
      return true;
    else
      return false;
  }

  static String dateToString(DateTime date) =>
      'y${date.year}m${date.month}d${date.day}';

  /*
  인자로 주어진 날짜가 들어있는 주의 마지막 날을 리턴한다.
  */
  static DateTime firstDayOfWeek(DateTime date) {
    date.timeZoneOffset;
    return date.subtract(Duration(days: date.weekday % 7));
  }

  /*
  인자로 주어진 날짜가 들어있는 주의 첫번째 날을 리턴한다.
  */
  static DateTime lastDayOfWeek(DateTime date) {
    return date.add(Duration(days: 7 - date.weekday % 7));
  }

  /*
  해당 연 & 월에 몇일이 해당하는지 int값을 리턴한다.
  */
  static int numOfMonth(DateTime date) {
    final int numOfDates = getMonthWithDate(date).length;
    return numOfDates;
  }

  /*
  인자로 주어진 날짜를 가지고 있는 주의 모든 날짜를 DateTime리스트 형식으로 리턴한다.
  */
  List<DateTime> getWeeksWithDate(DateTime date) {
    final start = firstDayOfWeek(date);
    final end = lastDayOfWeek(date);
    return List<DateTime>.generate(end.difference(start).inDays,
        (index) => start.add(Duration(days: index)));
  }

  /*
  월(month)을 가지고 달에 해당하는 모든 날짜의 DateTime리스트를 리턴한다.
  */
  static List<DateTime> getMonthWithDate(DateTime date) {
    final start = DateTime(date.year, date.month, 1, 12, 0, 0);
    final List<DateTime> month = [];

    for (int i = 0;
        start.add(Duration(days: i)).month == start.month &&
            maxTime.difference(start.add(Duration(days: i))).inDays >= 0;
        i++) {
      month.add(start.add(Duration(days: i)));
    }

    return month;
  }

  /*
  년(year)을 가지고 년도에 해당하는 모든 날짜의 DateTime리스트를 리턴한다.
  */
  static List<DateTime> getYearWithDate(DateTime date) {
    final start = DateTime(date.year, 1, 1, 12, 0, 0);
    final List<DateTime> year = [];

    for (int i = 0;
        start.add(Duration(days: i)).year == start.year &&
            maxTime.difference(start.add(Duration(days: i))).inDays >= 0;
        i++) {
      year.add(start.add(Duration(days: i)));
    }

    return year;
  }
}
