import 'package:flutter/material.dart';

class ScheduleBox extends StatelessWidget {
  final String title;
  final int color;

  ScheduleBox({this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 80,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1.0),
        color: Color(color),
      ),
      alignment: Alignment.center,
      child: Text(title),
    );
  }
}
