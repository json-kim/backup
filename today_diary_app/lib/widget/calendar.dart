import 'package:flutter/material.dart';

import '../constants/style.dart';
import './date_builder.dart';

//Provider.of<DiaryProvider>(context, listen: false).plusMinusYear(false)

class Calendar extends StatelessWidget {
  final int year;

  Calendar({@required this.year});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width / 13 / 2),
          child: Row(
            children: List<int>.generate(13, (int idx) => idx)
                .map((e) => Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: Container(
                        color: bgColor,
                        height: MediaQuery.of(context).size.width / 13,
                        alignment: Alignment.center,
                        child: Text('${e == 0 ? '' : e}'),
                      ),
                    ))
                .toList(),
          ),
        ),
        Expanded(
          child: DateBuilder(
            today: DateTime(year),
          ),
        ),
      ],
    );
  }
}

class Box1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
    );
  }
}

class Box2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.grey,
    );
  }
}
