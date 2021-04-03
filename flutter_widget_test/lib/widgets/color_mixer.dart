import 'package:flutter/material.dart';

import '../widgets/color_circle.dart';
import '../widgets/color_value_changer.dart';

class ColorMixer extends StatefulWidget {
  @override
  _ColorMixerState createState() => _ColorMixerState();
}

class _ColorMixerState extends State<ColorMixer> {
  int _red = 0;
  int _blue = 0;
  int _green = 0;

  void _setColor(String property, int value) {
    setState(() {
      _red = (property == "red") ? value : _red;
      _blue = (property == "blue") ? value : _blue;
      _green = (property == "green") ? value : _green;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ColorCircle(
            color: Color.fromRGBO(_red, _blue, _green, 1),
            radius: 200,
          ),
          ColorValueChanger(
            colorProperty: "red",
            colorChangeHadler: _setColor,
          ),
          ColorValueChanger(
            colorProperty: "blue",
            colorChangeHadler: _setColor,
          ),
          ColorValueChanger(
            colorProperty: "green",
            colorChangeHadler: _setColor,
          ),
        ],
      ),
    );
  }
}
