import 'package:flutter/material.dart';

class ColorCircle extends StatelessWidget {
  final Color color;
  final double radius;

  ColorCircle({this.color, this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
