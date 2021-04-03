import 'package:flutter/material.dart';

import '../constants/style.dart';
import '../constants/feeling.dart';

class FeelingColumn extends StatefulWidget {
  Feeling feeling;

  FeelingColumn({this.feeling = Feeling.verygood});

  @override
  _FeelingColumnState createState() => _FeelingColumnState();
}

class _FeelingColumnState extends State<FeelingColumn> {
  var currentFeeling;
  var isSelect = false;

  @override
  void initState() {
    currentFeeling = widget.feeling;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Column(
        children: [
          //_buildDefaultColumn(currentFeeling),
          DropdownButton(items: [
            DropdownMenuItem(
              child: _buildDefaultColumn(Feeling.verygood, size),
            ),
            DropdownMenuItem(
              child: _buildDefaultColumn(Feeling.good, size),
            ),
            DropdownMenuItem(
              child: _buildDefaultColumn(Feeling.regular, size),
            ),
            DropdownMenuItem(
              child: _buildDefaultColumn(Feeling.bad, size),
            ),
            DropdownMenuItem(
              child: _buildDefaultColumn(Feeling.verybad, size),
            ),
          ], onChanged: (value) {})
        ],
      ),
    );
  }

  Widget _buildDefaultColumn(Feeling feeling, Size size) {
    return Container(
      width: size.width - 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 20),
            height: 15,
            width: 15,
            color: feelColor[feeling],
          ),
          Expanded(
              child: Text(
            '${feelText[feeling]}',
            style: feelingColumnText,
          )),
          //IconButton(icon: Icon(Icons.keyboard_arrow_down), onPressed: () {})
        ],
      ),
    );
  }
}
