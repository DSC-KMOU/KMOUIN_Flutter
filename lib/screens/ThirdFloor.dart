import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Dart:ui';

class ThirdFloor extends StatefulWidget {
  @override
  _ThirdFloorState createState() => _ThirdFloorState();
}

class _ThirdFloorState extends State<ThirdFloor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: <Widget>[
            FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: Row(
                children: <Widget>[
                  Icon(
                    CupertinoIcons.back,
                    color: Color(0xffeb577c),
                  ),
                  Text(
                    "학식 정보",
                    style: TextStyle(
                      color:  Color(0xffeb577c),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 18.0,
                      wordSpacing: 0.0,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
        titleSpacing: -1.8,
        elevation: 1.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                //점 3개 + '3층학식'
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 98,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 9,
                            height: 9,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xffec5871)),
                          ),
                          SizedBox(
                            width: 106,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            '3층 학식',
                            style: const TextStyle(
                                color: const Color(0xffeb577c),
                                fontWeight: FontWeight.w500,
                                fontFamily: "NotoSansKR",
                                fontStyle: FontStyle.normal,
                                fontSize: 32.0),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 28,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 201,
                              ),
                              SizedBox(
                                width: 84,
                              ),
                              Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color(0xfffe6396)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 19,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 9,
                                height: 9,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color(0xffef5b55)),
                              ),
                              SizedBox(
                                width: 73,
                              ),
                              SizedBox(
                                width: 111,
                              ),
                              SizedBox(
                                width: 82,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //'오늘은 이걸 먹어볼까?' + 나머지내용
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 167,
                      ),
                      Text("오늘은 이걸 먹어볼까?",
                          style: const TextStyle(
                              color: const Color(0xfff05c53),
                              fontWeight: FontWeight.w300,
                              fontFamily: "NotoSansKR",
                              fontStyle: FontStyle.normal,
                              fontSize: 20.0),
                          textAlign: TextAlign.center),
                      SizedBox(
                        height: 28,
                      ),
                      //천원의 아침
                      Container(
                        padding: EdgeInsets.all(16),
                        width: 355,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x80cacaca),
                              offset: Offset(0, -1),
                              blurRadius: 16,
                              spreadRadius: 2,
                            )
                          ],
                          color: const Color(0xffffffff),
                        ),
                        child: Column(
                          children: <Widget>[
                            Text("천원의 아침",
                                style: const TextStyle(
                                    color: const Color(0xff131415),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "NotoSansKR",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 24.0),
                                textAlign: TextAlign.center),
                            SizedBox(
                              height: 7,
                            ),
                            Container(
                              width: 319,
                              height: 1,
                              decoration: BoxDecoration(
                                color: const Color(0xffc53786),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text("숯불제육덮밥",
                                style: const TextStyle(
                                    color: const Color(0xff131415),
                                    fontWeight: FontWeight.w300,
                                    fontFamily: "NotoSansKR",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                                textAlign: TextAlign.center),
                            SizedBox(
                              height: 12,
                            ),
                            Text("치즈라면 + 공기밥",
                                style: const TextStyle(
                                    color: const Color(0xff131415),
                                    fontWeight: FontWeight.w300,
                                    fontFamily: "NotoSansKR",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                                textAlign: TextAlign.center),
                            SizedBox(
                              height: 12,
                            ),
                            Text("치즈라면",
                                style: const TextStyle(
                                    color: const Color(0xff131415),
                                    fontWeight: FontWeight.w300,
                                    fontFamily: "NotoSansKR",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                                textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 52,
                      ),
                      //고정 코너
                      Column(
                        children: <Widget>[
                          //양식코너
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("양식코너",
                                              style: const TextStyle(
                                                  color:
                                                      const Color(0xff131415),
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "NotoSansKR",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 24.0),
                                              textAlign: TextAlign.center),
                                          SizedBox(
                                            width: 238,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Container(
                                        width: 329,
                                        height: 1,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffc53786)),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text("숯불제육덮밥",
                                                  style: const TextStyle(
                                                      color: const Color(
                                                          0xff131415),
                                                      fontWeight:
                                                      FontWeight.w300,
                                                      fontFamily: "NotoSansKR",
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: 16.0),
                                                  textAlign: TextAlign.center),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text("치즈라면 + 공기밥",
                                                  style: const TextStyle(
                                                      color: const Color(
                                                          0xff131415),
                                                      fontWeight:
                                                      FontWeight.w300,
                                                      fontFamily: "NotoSansKR",
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: 16.0),
                                                  textAlign: TextAlign.center),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text("치즈라면",
                                                  style: const TextStyle(
                                                      color: const Color(
                                                          0xff131415),
                                                      fontWeight:
                                                      FontWeight.w300,
                                                      fontFamily: "NotoSansKR",
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: 16.0),
                                                  textAlign: TextAlign.center),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text("치즈라면",
                                                  style: const TextStyle(
                                                      color: const Color(
                                                          0xff131415),
                                                      fontWeight:
                                                      FontWeight.w300,
                                                      fontFamily: "NotoSansKR",
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: 16.0),
                                                  textAlign: TextAlign.center),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("양식코너",
                                              style: const TextStyle(
                                                  color:
                                                      const Color(0xff131415),
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "NotoSansKR",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 24.0),
                                              textAlign: TextAlign.center),
                                          SizedBox(
                                            width: 238,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Container(
                                        width: 329,
                                        height: 1,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffc53786)),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text("￦ 5,000",
                                              style: const TextStyle(
                                                  color:
                                                      const Color(0xff131415),
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: "NotoSansKR",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16.0),
                                              textAlign: TextAlign.center),
                                          SizedBox(
                                            width: 8,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text("￦ 5,000",
                                              style: const TextStyle(
                                                  color:
                                                      const Color(0xff131415),
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: "NotoSansKR",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16.0),
                                              textAlign: TextAlign.center),
                                          SizedBox(
                                            width: 8,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text("￦ 5,000",
                                              style: const TextStyle(
                                                  color:
                                                      const Color(0xff131415),
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: "NotoSansKR",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16.0),
                                              textAlign: TextAlign.center),
                                          SizedBox(
                                            width: 8,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text("￦ 5,000",
                                              style: const TextStyle(
                                                  color:
                                                      const Color(0xff131415),
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: "NotoSansKR",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16.0),
                                              textAlign: TextAlign.center),
                                          SizedBox(
                                            width: 8,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 54,
                          ),
                          //라면코너
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("라면코너",
                                              style: const TextStyle(
                                                  color:
                                                  const Color(0xff131415),
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "NotoSansKR",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 24.0),
                                              textAlign: TextAlign.center),
                                          SizedBox(
                                            width: 238,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Container(
                                        width: 329,
                                        height: 1,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffc53786)),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text("숯불제육덮밥",
                                                  style: const TextStyle(
                                                      color: const Color(
                                                          0xff131415),
                                                      fontWeight:
                                                      FontWeight.w300,
                                                      fontFamily: "NotoSansKR",
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: 16.0),
                                                  textAlign: TextAlign.center),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text("치즈라면 + 공기밥",
                                                  style: const TextStyle(
                                                      color: const Color(
                                                          0xff131415),
                                                      fontWeight:
                                                      FontWeight.w300,
                                                      fontFamily: "NotoSansKR",
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: 16.0),
                                                  textAlign: TextAlign.center),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text("치즈라면",
                                                  style: const TextStyle(
                                                      color: const Color(
                                                          0xff131415),
                                                      fontWeight:
                                                      FontWeight.w300,
                                                      fontFamily: "NotoSansKR",
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: 16.0),
                                                  textAlign: TextAlign.center),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text("치즈라면",
                                                  style: const TextStyle(
                                                      color: const Color(
                                                          0xff131415),
                                                      fontWeight:
                                                      FontWeight.w300,
                                                      fontFamily: "NotoSansKR",
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: 16.0),
                                                  textAlign: TextAlign.center),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("라면코너",
                                              style: const TextStyle(
                                                  color:
                                                  const Color(0xff131415),
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "NotoSansKR",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 24.0),
                                              textAlign: TextAlign.center),
                                          SizedBox(
                                            width: 238,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Container(
                                        width: 329,
                                        height: 1,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffc53786)),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text("￦ 5,000",
                                              style: const TextStyle(
                                                  color:
                                                  const Color(0xff131415),
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: "NotoSansKR",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16.0),
                                              textAlign: TextAlign.center),
                                          SizedBox(
                                            width: 8,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text("￦ 5,000",
                                              style: const TextStyle(
                                                  color:
                                                  const Color(0xff131415),
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: "NotoSansKR",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16.0),
                                              textAlign: TextAlign.center),
                                          SizedBox(
                                            width: 8,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text("￦ 5,000",
                                              style: const TextStyle(
                                                  color:
                                                  const Color(0xff131415),
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: "NotoSansKR",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16.0),
                                              textAlign: TextAlign.center),
                                          SizedBox(
                                            width: 8,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text("￦ 5,000",
                                              style: const TextStyle(
                                                  color:
                                                  const Color(0xff131415),
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: "NotoSansKR",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16.0),
                                              textAlign: TextAlign.center),
                                          SizedBox(
                                            width: 8,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 54,
                          ),
                          //분식코너
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("분식코너",
                                              style: const TextStyle(
                                                  color:
                                                  const Color(0xff131415),
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "NotoSansKR",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 24.0),
                                              textAlign: TextAlign.center),
                                          SizedBox(
                                            width: 238,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Container(
                                        width: 329,
                                        height: 1,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffc53786)),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text("숯불제육덮밥",
                                                  style: const TextStyle(
                                                      color: const Color(
                                                          0xff131415),
                                                      fontWeight:
                                                      FontWeight.w300,
                                                      fontFamily: "NotoSansKR",
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: 16.0),
                                                  textAlign: TextAlign.center),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text("치즈라면 + 공기밥",
                                                  style: const TextStyle(
                                                      color: const Color(
                                                          0xff131415),
                                                      fontWeight:
                                                      FontWeight.w300,
                                                      fontFamily: "NotoSansKR",
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: 16.0),
                                                  textAlign: TextAlign.center),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text("치즈라면",
                                                  style: const TextStyle(
                                                      color: const Color(
                                                          0xff131415),
                                                      fontWeight:
                                                      FontWeight.w300,
                                                      fontFamily: "NotoSansKR",
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: 16.0),
                                                  textAlign: TextAlign.center),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text("치즈라면",
                                                  style: const TextStyle(
                                                      color: const Color(
                                                          0xff131415),
                                                      fontWeight:
                                                      FontWeight.w300,
                                                      fontFamily: "NotoSansKR",
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: 16.0),
                                                  textAlign: TextAlign.center),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("분식코너",
                                              style: const TextStyle(
                                                  color:
                                                  const Color(0xff131415),
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "NotoSansKR",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 24.0),
                                              textAlign: TextAlign.center),
                                          SizedBox(
                                            width: 238,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Container(
                                        width: 329,
                                        height: 1,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffc53786)),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text("￦ 5,000",
                                              style: const TextStyle(
                                                  color:
                                                  const Color(0xff131415),
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: "NotoSansKR",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16.0),
                                              textAlign: TextAlign.center),
                                          SizedBox(
                                            width: 8,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text("￦ 5,000",
                                              style: const TextStyle(
                                                  color:
                                                  const Color(0xff131415),
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: "NotoSansKR",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16.0),
                                              textAlign: TextAlign.center),
                                          SizedBox(
                                            width: 8,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text("￦ 5,000",
                                              style: const TextStyle(
                                                  color:
                                                  const Color(0xff131415),
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: "NotoSansKR",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16.0),
                                              textAlign: TextAlign.center),
                                          SizedBox(
                                            width: 8,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text("￦ 5,000",
                                              style: const TextStyle(
                                                  color:
                                                  const Color(0xff131415),
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: "NotoSansKR",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16.0),
                                              textAlign: TextAlign.center),
                                          SizedBox(
                                            width: 8,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 54,
                          ),
                          //덮밥코너
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("덮밥코너",
                                              style: const TextStyle(
                                                  color:
                                                  const Color(0xff131415),
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "NotoSansKR",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 24.0),
                                              textAlign: TextAlign.center),
                                          SizedBox(
                                            width: 238,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Container(
                                        width: 329,
                                        height: 1,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffc53786)),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text("숯불제육덮밥",
                                                  style: const TextStyle(
                                                      color: const Color(
                                                          0xff131415),
                                                      fontWeight:
                                                      FontWeight.w300,
                                                      fontFamily: "NotoSansKR",
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: 16.0),
                                                  textAlign: TextAlign.center),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text("치즈라면 + 공기밥",
                                                  style: const TextStyle(
                                                      color: const Color(
                                                          0xff131415),
                                                      fontWeight:
                                                      FontWeight.w300,
                                                      fontFamily: "NotoSansKR",
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: 16.0),
                                                  textAlign: TextAlign.center),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text("치즈라면",
                                                  style: const TextStyle(
                                                      color: const Color(
                                                          0xff131415),
                                                      fontWeight:
                                                      FontWeight.w300,
                                                      fontFamily: "NotoSansKR",
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: 16.0),
                                                  textAlign: TextAlign.center),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text("치즈라면",
                                                  style: const TextStyle(
                                                      color: const Color(
                                                          0xff131415),
                                                      fontWeight:
                                                      FontWeight.w300,
                                                      fontFamily: "NotoSansKR",
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: 16.0),
                                                  textAlign: TextAlign.center),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("덮밥코너",
                                              style: const TextStyle(
                                                  color:
                                                  const Color(0xff131415),
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "NotoSansKR",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 24.0),
                                              textAlign: TextAlign.center),
                                          SizedBox(
                                            width: 238,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Container(
                                        width: 329,
                                        height: 1,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffc53786)),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text("￦ 5,000",
                                              style: const TextStyle(
                                                  color:
                                                  const Color(0xff131415),
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: "NotoSansKR",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16.0),
                                              textAlign: TextAlign.center),
                                          SizedBox(
                                            width: 8,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text("￦ 5,000",
                                              style: const TextStyle(
                                                  color:
                                                  const Color(0xff131415),
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: "NotoSansKR",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16.0),
                                              textAlign: TextAlign.center),
                                          SizedBox(
                                            width: 8,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text("￦ 5,000",
                                              style: const TextStyle(
                                                  color:
                                                  const Color(0xff131415),
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: "NotoSansKR",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16.0),
                                              textAlign: TextAlign.center),
                                          SizedBox(
                                            width: 8,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text("￦ 5,000",
                                              style: const TextStyle(
                                                  color:
                                                  const Color(0xff131415),
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: "NotoSansKR",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16.0),
                                              textAlign: TextAlign.center),
                                          SizedBox(
                                            width: 8,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 55,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
