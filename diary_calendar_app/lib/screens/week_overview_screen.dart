import 'package:flutter/material.dart';

import '../widgets/week_date.dart';

class WeekOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('주간 일기'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<WeekDateBox>.generate(
            7,
            (idx) => WeekDateBox(
                DateTime.now().subtract(Duration(days: 6 - idx)),
                (size.width - 30) / 7,
                key: ValueKey('weekdatebox$idx'))),
      ),
    );
  }
}
