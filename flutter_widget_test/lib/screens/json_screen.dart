import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JsonScreen extends StatefulWidget {
  @override
  _JsonScreenState createState() => _JsonScreenState();
}

class _JsonScreenState extends State<JsonScreen> {
  String _name = "no name";
  String _fileName = "jsonTest.txt";

  Future<void> storeSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs
      ..setString('organizationName', 'js corpor')
      ..setBool('isGood', true);
  }

  Future<String> readSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String corpor = prefs.getString('organizationName');
    return corpor;
  }

  Future<String> getJson() async {
    try {
      String name = await rootBundle.loadStructuredData('assets/test.json',
          (String key) async {
        return jsonDecode(key)['people'][0]["firstName"];
      });
      return name;
    } catch (e) {
      debugPrint(e);
    }
  }

  Future<void> storeData() async {
    // 디렉터리 획득
    Directory documents = await getApplicationDocumentsDirectory();
    Map<String, dynamic> jsonMap = {
      "id": "5639df",
      "firstName": "Kim",
      "lastName": "Jaeseung",
      "occupation": "Programmer",
    };

    //파일 만들기
    try {
      File file = File('${documents.path}/$_fileName');
      String jsonString = json.encode(jsonMap);
      await file.writeAsString(jsonString);
    } catch (e) {
      debugPrint(e);
    }
  }

  Future<String> readData() async {
    // 디렉터리 획득
    Directory documents = await getApplicationDocumentsDirectory();

    //파일 만들기
    try {
      File file = File('${documents.path}/$_fileName');
      String reading = await file.readAsString();
      return reading;
    } catch (e) {
      debugPrint(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_name),
            SizedBox(
              height: 20,
            ),
            FlatButton(
                onPressed: () async {
                  _name = await getJson();
                  setState(() {});
                },
                child: Text('read Json')),
            FlatButton(onPressed: storeData, child: Text('write on file')),
            FlatButton(
              onPressed: () async {
                _name = await readData();
                setState(() {});
              },
              child: Text('read from file'),
            ),
            FlatButton(
                onPressed: storeSP, child: Text('write on shared preference')),
            FlatButton(
                onPressed: () async {
                  _name = await readSP();
                  setState(() {});
                },
                child: Text('read from shared preference')),
          ],
        ),
      ),
    );
  }
}
