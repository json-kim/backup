import 'package:flutter/material.dart';

class ColorValueChanger extends StatefulWidget {
  final Function colorChangeHadler;
  final String colorProperty;

  ColorValueChanger({this.colorChangeHadler, this.colorProperty});

  @override
  _ColorValueChangerState createState() => _ColorValueChangerState();
}

class _ColorValueChangerState extends State<ColorValueChanger> {
  int _value = 0;

  _onChanged(double value) {
    setState(() => _value = value.round());
    widget.colorChangeHadler(widget.colorProperty, value.round());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(widget.colorProperty),
          Slider(
              label: widget.colorProperty,
              min: 0,
              max: 255,
              value: _value.toDouble(),
              onChanged: _onChanged)
        ],
      ),
    );
  }
}
