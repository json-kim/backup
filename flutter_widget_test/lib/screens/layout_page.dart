import 'package:flutter/material.dart';

class LayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.traffic),
        title: Text("My Cool App"),
      ),
      body: SafeArea(
          child: Center(
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RaisedButton(
                onPressed: () {},
                child: Text("A"),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("B"),
              ),
              Expanded(
                child: RaisedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("SuperLongButton"),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("D"),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
