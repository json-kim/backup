import 'package:flutter/material.dart';
import 'package:flutter_widget_test/screens/tab_screen.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('drawer test'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('drawer head')),
            FlatButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => TabBarScreen())),
                child: Text('go to tab screen'))
          ],
        ),
      ),
    );
  }
}
