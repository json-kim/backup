import 'package:flutter/material.dart';

import '../screens/date_detail_screen.dart';

class WeekDateBox extends StatelessWidget {
  final DateTime date;
  final width;
  final Key key;

  WeekDateBox(this.date, this.width, {this.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(DateDetailScreen.routeName, arguments: date);
        },
        child: Container(
          width: width,
          height: width,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            border: Border.all(width: 1, color: Colors.black87),
          ),
        ),
      ),
    );
  }
}
