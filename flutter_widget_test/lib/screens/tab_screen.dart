import 'package:flutter/material.dart';

class TabBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('TabBar'),
          ),
          bottomNavigationBar: Material(
            color: Theme.of(context).colorScheme.primary,
            child: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.looks_one),
                child: Text('Show A'),
              ),
              Tab(
                icon: Icon(Icons.looks_two),
                child: Text('Show B'),
              ),
              Tab(
                icon: Icon(Icons.looks_3),
                child: Text('Show C'),
              ),
            ]),
          ),
          body: TabBarView(children: [
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text("Tab A"),
                  RaisedButton(
                      onPressed: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Text('alert dialog'),
                              actions: [
                                FlatButton(
                                  child: Text('OK'),
                                  onPressed: () => Navigator.of(context).pop(),
                                )
                              ],
                            );
                          }))
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text("Tab B"),
            ),
            Container(
              alignment: Alignment.center,
              child: Text("Tab C"),
            ),
          ]),
        ));
  }
}
