import 'package:flutter/material.dart';

class Date {
  final DateTime date;
  final String text;
  ColorSwatch color;

  Date({this.date, this.text, this.color});

  @override
  String toString() {
    return '$date, $text, $color';
  }
}
