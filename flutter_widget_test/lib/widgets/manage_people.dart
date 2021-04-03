import 'package:flutter/material.dart';

class ManagePeople extends StatefulWidget {
  @override
  _ManagePeopleState createState() => _ManagePeopleState();
}

class _ManagePeopleState extends State<ManagePeople> {
  List<Map> _peopleObject = [
    {"first": "Jim", "last": "Halpert", "key": 1},
    {"first": "Jim", "last": "Halpert", "key": 2},
    {"first": "Jim", "last": "Halpert", "key": 3},
    {"first": "Jim", "last": "Halpert", "key": 4},
    {"first": "Jim", "last": "Halpert", "key": 5},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _peopleObject.map((person) {
        double _swipeStartX;
        String _swipeDirection;
        return GestureDetector(
            onHorizontalDragStart: (e) {
              _swipeStartX = e.globalPosition.dx;
            },
            onHorizontalDragUpdate: (e) {
              _swipeDirection =
                  (e.globalPosition.dx > _swipeStartX) ? "Right" : "Left";
            },
            onHorizontalDragEnd: (e) {
              if (_swipeDirection == "Right")
                print("right");
              else
                print("left");
            },
            onLongPress: () {
              setState(() {
                _peopleObject.remove(person);
              });
              print('remove ${person["first"]}');
            },
            onScaleUpdate: (e) {
              if (e.scale > 2.0) print('add');
            },
            child: Person(
              first: person["first"],
              last: person["last"],
              key: ValueKey(person["key"]),
            ));
      }).toList(),
    );
  }
}

class Person extends StatelessWidget {
  final String first;
  final String last;
  final Key key;
  Person({this.first, this.last, this.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      alignment: Alignment.center,
      child: Text('$first, $last'),
    );
  }
}
