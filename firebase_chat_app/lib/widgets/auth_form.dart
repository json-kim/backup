import 'dart:io';

import 'package:flutter/material.dart';

import './user_image_picker.dart';

class AuthForm extends StatefulWidget {
  final void Function(String email, String password, String username,
      File image, bool isLogin, BuildContext ctx) submitFn;
  final bool isLoading;

  AuthForm(this.submitFn, this.isLoading);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  File _userImageFile;

  void _pickedImage(File image) {
    _userImageFile = image;
  }

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (_userImageFile == null && !_isLogin) {
      Scaffold.of(context).hideCurrentSnackBar();
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Please pick an image'),
        backgroundColor: Theme.of(context).errorColor,
      ));
      return;
    }

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(
        _userEmail.trim(),
        _userPassword.trim(),
        _userName.trim(),
        _userImageFile,
        _isLogin,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    if (!_isLogin) UserImagePicker(_pickedImage),
                    TextFormField(
                      key: ValueKey('email'),
                      validator: (value) {
                        if (value.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _userEmail = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email address',
                      ),
                    ),
                    if (!_isLogin)
                      TextFormField(
                        key: ValueKey('username'),
                        validator: (value) {
                          if (value.isEmpty || value.length < 4) {
                            return 'Please enter at least 4 characters long.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _userName = value;
                        },
                        decoration: InputDecoration(labelText: 'User name'),
                      ),
                    TextFormField(
                      key: ValueKey('password'),
                      validator: (value) {
                        if (value.isEmpty || value.length < 7) {
                          return 'Please must be at least 7 characters long.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _userPassword = value;
                      },
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true, // 텍스트 입력 감춤
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    if (widget.isLoading)
                      CircularProgressIndicator(
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    if (!widget.isLoading)
                      RaisedButton(
                        child: Text(_isLogin ? 'Login' : 'Singup'),
                        onPressed: _trySubmit,
                      ),
                    if (!widget.isLoading)
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            _isLogin = !_isLogin;
                          });
                        },
                        child: Text(_isLogin
                            ? 'Create new account'
                            : 'I already have an account'),
                        textColor: Theme.of(context).primaryColor,
                      ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
