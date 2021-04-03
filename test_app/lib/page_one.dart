import 'package:flutter/material.dart';

import 'page_two.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FlatButton(
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
        ],
      ),
    );
  }
}
