import 'package:flutter/material.dart';

class PhysicalModelPage extends StatelessWidget {
  Color color1 = Color(0xFF000000);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Physical Model'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PhysicalModel(
            child: BlueBox('none'),
            elevation: 30,
            color: Colors.black,
            shadowColor: Colors.pink,
            borderRadius: BorderRadius.circular(50),
            shape: BoxShape.rectangle,
            clipBehavior: Clip.none,
          ),
          PhysicalModel(
            child: BlueBox('hardEdge'),
            elevation: 30,
            color: Colors.black,
            shadowColor: Colors.pink,
            borderRadius: BorderRadius.circular(20),
            shape: BoxShape.rectangle,
            clipBehavior: Clip.hardEdge,
          ),
          PhysicalModel(
            child: BlueBox('antiAlias'),
            elevation: 30,
            color: Colors.black,
            shadowColor: Colors.pink,
            borderRadius: BorderRadius.circular(20),
            shape: BoxShape.rectangle,
            clipBehavior: Clip.antiAlias,
          ),
          PhysicalModel(
            child: BlueBox('antiAlisWithSaveLayer'),
            elevation: 30,
            color: Colors.black,
            shadowColor: Colors.pink,
            borderRadius: BorderRadius.circular(20),
            shape: BoxShape.rectangle,
            clipBehavior: Clip.antiAliasWithSaveLayer,
          ),
          SizedBox(
            width: double.infinity,
          )
        ],
      ),
    );
  }
}

class BlueBox extends StatelessWidget {
  String tt;
  BlueBox(this.tt);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.blue.withOpacity(1),
      child: Center(child: Text(tt)),
    );
  }
}
