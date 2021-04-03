import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screen/calendar_screen.dart';
import './screen/diary_screen.dart';
import './screen/test.dart';
import './constants/style.dart';
import './data/diary_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DiaryProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            backgroundColor: bgColor,
            appBarTheme: AppBarTheme(
                elevation: 0,
                color: Colors.white,
                iconTheme: IconThemeData(color: Colors.black),
                textTheme: TextTheme(
                  headline6: TextStyle(color: Colors.black),
                )),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: mainTextTheme),
        home: CalendarScreen(),
        routes: {
          CalendarScreen.route: (ctx) => CalendarScreen(),
          DiaryScreen.route: (ctx) => DiaryScreen(),
        },
      ),
    );
  }
}
