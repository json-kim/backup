import 'package:flutter/material.dart';

import '../screen/auth_screen.dart';

class DrawerChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(Icons.login),
            title: Text('로그인'),
            onTap: () => _login(context),
          ),
          ListTile(
            leading: Icon(Icons.save_alt),
            title: Text('데이터 저장하기'),
            onTap: _save,
          ),
          ListTile(
            leading: Icon(Icons.file_download),
            title: Text('데이터 불러오기'),
            onTap: _load,
          ),
          ListTile(
            leading: Icon(Icons.restore_page),
            title: Text('데이터 초기화'),
            onTap: _reset,
          ),
        ],
      ),
    );
  }

  void _login(BuildContext context) {
    print('로그인');
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => AuthScreen(),
    ));
  }

  void _save() {
    print('저장');
  }

  void _load() {
    print('불러오기');
  }

  void _reset() {
    print('초기화');
  }
}
