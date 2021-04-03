import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final GlobalKey<InnerDrawerState> _innerDrawer =
      GlobalKey<InnerDrawerState>();

  @override
  Widget build(BuildContext context) {
    return InnerDrawer(
        key: _innerDrawer,
        // leftChild: Container(
        //   child: Text('left child'),
        // ),
        tapScaffoldEnabled: false,
        swipe: false,
        onTapClose: true,
        proportionalChildArea: true,
        rightChild: Scaffold(
          appBar: AppBar(),
          body: Container(
            child: Text('right child'),
          ),
        ),
        offset: IDOffset.horizontal(0.5),
        duration: Duration(milliseconds: 300),
        velocity: 3,
        scaffold: Scaffold(
          appBar: AppBar(
            title: Text('test'),
            leading: IconButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
                onPressed: toggle),
          ),
          body: Center(
            child: Text('inner drawer screen'),
          ),
        ));
  }

  void toggle() {
    _innerDrawer.currentState.toggle();
  }
}
