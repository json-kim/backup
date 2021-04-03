import 'package:flutter/material.dart';
import 'package:today_diary_app/constants/style.dart';

import '../helper/date_helper.dart';
import './date_box.dart';

class DateBuilder extends StatelessWidget {
  final DateTime today;

  DateBuilder({this.today});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
          top: 5,
          bottom: 30,
          right: MediaQuery.of(context).size.width / 13 / 2),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(13, (idx) => idx)
              .map((month) => Expanded(
                      child: Container(
                          child: Column(
                    children: List.generate(
                            month == 0
                                ? 31
                                : DateHelper.numOfMonth(
                                    DateTime(today.year, month)),
                            (idx) => idx + 1)
                        .map((day) => Container(
                              height: MediaQuery.of(context).size.width / 14,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.3, color: Colors.white),
                                  color: month == 0 ? bgColor : bgColor),
                              child: month == 0
                                  ? Text('$day')
                                  : DateBox(
                                      date: DateTime(today.year, month, day),
                                    ),
                            ))
                        .toList(),
                  ))))
              .toList(),
        )
      ],
    );
  }
}
