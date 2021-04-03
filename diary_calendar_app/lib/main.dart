import 'package:flutter/material.dart';

import './screens/week_overview_screen.dart';
import './screens/date_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Calendar',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme().copyWith(
            headline1: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
      debugShowCheckedModeBanner: false,
      home: WeekOverviewScreen(),
      routes: {
        DateDetailScreen.routeName: (ctx) => DateDetailScreen(),
      },
    );
  }
}
