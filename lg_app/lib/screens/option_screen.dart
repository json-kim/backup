import 'package:flutter/material.dart';

class OptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEC068D),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
        title: Text('방 선택'),
        actions: [
          IconButton(
            icon: Icon(Icons.redeem),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: Container(
              width: _size.width,
              height: 150,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CircleAvatar(
                    radius: 65,
                    backgroundImage: AssetImage('asset/image/room.jpg'),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            '시그니처 룸',
                            style: TextStyle(fontSize: 20),
                          ),
                          Spacer(),
                          CircleAvatar(
                            backgroundColor: Color(0xFFEC068D),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Text(
                        'Signature Room',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '200,000 원',
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ),
          Container(
            height: 350,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '옵션 선택',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    width: _size.width,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xFFEC068D),
                          radius: 15,
                          child: Center(
                            child: CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                        Text('LG Wing 스마트폰')
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    width: _size.width,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xFFEC068D),
                          radius: 15,
                          child: Center(
                            child: CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                        Text('LG gram 15')
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    width: _size.width,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xFFEC068D),
                          radius: 15,
                          child: Center(
                            child: CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                        Text('LG 시네마 빔')
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    width: _size.width,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xFFEC068D),
                          radius: 15,
                          child: Center(
                            child: CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                        Text('LG 톤 프리')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            height: 50,
            width: _size.height,
            color: Color(0xFFEC068D),
            child: Center(
                child: Text(
              '예약하기',
              style: TextStyle(color: Colors.white, fontSize: 17),
            )),
          )
        ],
      ),
    );
  }
}
