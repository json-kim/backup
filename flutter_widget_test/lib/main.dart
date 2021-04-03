import 'package:flutter/material.dart';

import './screens/home_page.dart';
import './screens/layout_page.dart';
import './screens/gesture_page.dart';
import './screens/container_screen.dart';
import './screens/drawer_screen.dart';
import './screens/tab_screen.dart';
import './screens/color_screen.dart';
import './screens/json_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black))),
      home: JsonScreen(),
    );
  }
}
