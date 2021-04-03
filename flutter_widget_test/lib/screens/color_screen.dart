import 'package:flutter/material.dart';

import '../widgets/color_mixer.dart';

class ColorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('color stateful widget'),
      ),
      body: Center(
        child: ColorMixer(),
      ),
    );
  }
}
