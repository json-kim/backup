import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  var _enterMessage = '';
  final _controller = TextEditingController();

  void _sendMessage() async {
    FocusScope.of(context).unfocus();

    final user = await FirebaseAuth.instance.currentUser();
    final userData =
        await Firestore.instance.collection('users').document(user.uid).get();

    Firestore.instance.collection('chat').add({
      'text': _enterMessage,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
      'username': userData['username'],
      'userImage': userData['image_url'],
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
              child: TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: 'Send a messge...'),
            onChanged: (value) {
              setState(() {
                _enterMessage = value;
              });
            },
          )),
          IconButton(
              icon: Icon(Icons.send),
              color: Theme.of(context).primaryColor,
              onPressed: _enterMessage.trim().isEmpty ? null : _sendMessage)
        ],
      ),
    );
  }
}
