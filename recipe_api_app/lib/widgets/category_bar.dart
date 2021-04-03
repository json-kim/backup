import 'package:flutter/material.dart';

import '../constants.dart';

class CategoryBar extends StatefulWidget {
  @override
  _CategoryBarState createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  int _selectedIndex = 0;
  List categories = ['전체', '좋아요', '끓이기', '튀기기', '볶기', '찜요리', '졸이기'];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: defaultPadding / 2),
      height: 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (ctx, idx) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = idx;
                });
              },
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: idx == _selectedIndex
                          ? Colors.white.withOpacity(0.4)
                          : Colors.transparent),
                  margin: EdgeInsets.only(
                      left: defaultPadding,
                      right: idx == categories.length - 1 ? defaultPadding : 0),
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Text(
                    categories[idx],
                    style: TextStyle(color: Colors.white),
                  )),
            );
          }),
    );
  }
}
