import 'package:flutter/material.dart';
import 'page_one.dart';
import 'page_two.dart';
import 'page_three.dart';

class AnotherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
            onPressed: () {},
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: 200,
                  color: Colors.red,
                ),
                Text('data'),
              ],
            )),
      ),
    );
  }
}
