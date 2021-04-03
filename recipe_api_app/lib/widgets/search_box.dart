import 'package:flutter/material.dart';

import '../constants.dart';

class SearchBox extends StatelessWidget {
  final Key key;
  final Function onValueChanged;

  SearchBox({this.key, this.onValueChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(
          vertical: defaultPadding / 2, horizontal: defaultPadding),
      padding: EdgeInsets.only(top: 5, bottom: 2.5, left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.4),
      ),
      child: Center(
        child: TextField(
          onChanged: onValueChanged,
          cursorColor: Colors.white,
          style: TextStyle(fontSize: 16),
          textAlignVertical: TextAlignVertical.center,
          maxLines: 1,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '검색..',
            hintStyle: TextStyle(color: Colors.white, fontSize: 16),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
