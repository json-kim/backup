import 'dart:math' as math;

import 'package:flutter/material.dart';

class ContainerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 300,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.purple, boxShadow: [
                BoxShadow(
                    offset: Offset.fromDirection(-0.5 * math.pi, 10),
                    blurRadius: 30)
              ]),
              child: Text(
                'container test',
                style: TextStyle(fontSize: 35),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: CustomPaint(
                size: Size(150, 150),
                painter: SupermanPainter(),
              ),
              foregroundDecoration:
                  BoxDecoration(color: Colors.red.withOpacity(0.5)),
            )
          ],
        ),
      ),
    );
  }
}

class SupermanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(
        Path()
          ..moveTo(25, 0)
          ..lineTo(125, 0)
          ..lineTo(150, 25)
          ..lineTo(75, 125)
          ..lineTo(0, 25)
          ..lineTo(25, 0),
        Paint()
          ..style = PaintingStyle.fill
          ..color = Colors.red);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
    throw UnimplementedError();
  }
}
