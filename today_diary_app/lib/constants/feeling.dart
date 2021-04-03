import 'package:flutter/material.dart';

enum Feeling {
  verygood,
  good,
  regular,
  bad,
  verybad,
}

List<String> feelings = ['very good', 'good', 'regular', 'bad', 'very bad'];

Map<String, Color> feelColor = {
  feelings[0]: Colors.purpleAccent,
  feelings[1]: Colors.lightBlueAccent,
  feelings[2]: Colors.greenAccent,
  feelings[3]: Colors.yellowAccent,
  feelings[4]: Colors.redAccent,
};

Map<Feeling, String> feelText = {
  Feeling.verygood: 'very good',
  Feeling.good: 'good',
  Feeling.regular: 'regular',
  Feeling.bad: 'bad',
  Feeling.verybad: 'very bad',
};
