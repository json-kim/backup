import 'package:flutter/cupertino.dart';

import '../models/date.dart';

class DatesProvider with ChangeNotifier {
  Map<String, Date> dates = {};

  void inputDate(Date inputDate) {
    final String key = inputDate.date.toIso8601String();
    dates[key] = inputDate;
    print(inputDate);
    notifyListeners();
  }

  Date getDateWithString(String dateString) {
    if (!dates.containsKey(dateString)) {
      return null;
    }
    return dates['key'];
  }

  List<Date> getWeekDates() {
    final today =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    final weekList = List<Date>.generate(7, (idx) {
      final key = today.subtract(Duration(days: 6 - idx)).toIso8601String();
      if (dates.containsKey(key)) {
        return dates[key];
      }
      return null;
    });
    return weekList;
  }
}
