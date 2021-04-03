import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFEC068D),
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          title: Text('LG U+ 홈페스트'),
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
        backgroundColor: Colors.white.withOpacity(0.9),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                      height: 250,
                      child: Image.asset('asset/image/homefest.jpg')),
                  Positioned(
                      top: 210,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Color(0xFFEC068D),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Color(0xFFEC068D),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Color(0xFFEC068D),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Color(0xFFEC068D),
                          ),
                        ],
                      ))
                ],
              ),
              Container(
                color: Colors.white,
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: double.infinity,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: 100,
                            width: _size.width / 2,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.home,
                                    color: Color(0xFFEC068D),
                                  ),
                                  Text('숙소'),
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 100,
                            width: _size.width / 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.map,
                                  color: Colors.grey,
                                ),
                                Text('지도'),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '안녕하세요, LG U+ 고객님',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: Color(0xFFEC068D)),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.search),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(child: Text('여행지 입력')),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: Color(0xFFEC068D)),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.calendar_today),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(child: Text('9월 1일 (화)~9월 2일 (수)')),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: Color(0xFFEC068D)),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.perm_identity),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Text('시그니처룸 1개-성인 2명, 아동 1명')),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 11,
              ),
              Container(
                color: Colors.white,
                height: 400,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '오늘의 테마',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
