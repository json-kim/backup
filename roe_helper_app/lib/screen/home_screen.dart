import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String route = '/home';

  Widget _buildAppBar() {
    return AppBar(
      title: Text('시간별 군비쟁탈전'),
    );
  }

  Widget _buildBody() {
    return ListView(
      children: _buildList(),
    );
  }

  List<Widget> _buildList() {
    return [Text('roe')];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }
}
