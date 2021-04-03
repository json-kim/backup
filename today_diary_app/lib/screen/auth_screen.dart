import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class AuthScreen extends StatelessWidget {
  static String route = '/auth';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SignInButton(
            Buttons.Google,
            onPressed: () => _loginWithGoogle(context),
            text: '구글 로그인',
          ),
          SignInButton(
            Buttons.Facebook,
            onPressed: () => _loginWithFaceBook(context),
            text: '페이스북 로그인',
          ),
          SignInButton(
            Buttons.Email,
            onPressed: () => _loginWithEmail(context),
            text: '이메일 로그인',
          ),
        ],
      ),
    );
  }

  void _loginWithGoogle(BuildContext context) {}

  void _loginWithFaceBook(BuildContext context) {}

  void _loginWithEmail(BuildContext context) {}
}
