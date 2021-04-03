import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SearchType _searchType;
  SearchType _searchType2 = SearchType.anywhere;
  double _value = 0;
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('widget test'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _key,
              autovalidate: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(),
                child: Column(
                  children: [
                    TextFormField(
                      decoration:
                          InputDecoration(prefixIcon: Icon(Icons.message)),
                      onSaved: (val) {},
                      validator: (val) {
                        if (val == null) {
                          return '유효한 값을 입력해주세요';
                        }
                        return null;
                      },
                    )
                  ],
                ),
              ),
            ),
            DropdownButton<SearchType>(
                value: _searchType2,
                items: [
                  DropdownMenuItem(
                    child: Text('anywhere'),
                    value: SearchType.anywhere,
                  ),
                  DropdownMenuItem(
                    child: Text('text'),
                    value: SearchType.text,
                  ),
                  DropdownMenuItem(
                    child: Text('title'),
                    value: SearchType.title,
                  ),
                ],
                onChanged: (SearchType val) {
                  setState(() {
                    _searchType2 = val;
                  });
                }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('${_value.toInt().toString()}%'),
                  Expanded(
                    child: Slider(
                        label: _value.toInt().toString(),
                        divisions: 100,
                        min: 0,
                        max: 100,
                        value: _value,
                        onChanged: (double value) {
                          setState(() {
                            _value = value;
                          });
                        }),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<SearchType>(
                    value: SearchType.anywhere,
                    groupValue: _searchType,
                    onChanged: (SearchType val) {
                      print('$val');
                      setState(() {
                        _searchType = val;
                      });
                    }),
                Text('anywhere'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<SearchType>(
                    value: SearchType.text,
                    groupValue: _searchType,
                    onChanged: (SearchType val) {
                      print('$val');
                      setState(() {
                        _searchType = val;
                      });
                    }),
                Text('text'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<SearchType>(
                    value: SearchType.title,
                    groupValue: _searchType,
                    onChanged: (SearchType val) {
                      print('$val');
                      setState(() {
                        _searchType = val;
                      });
                    }),
                Text('title'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum SearchType {
  anywhere,
  text,
  title,
}
