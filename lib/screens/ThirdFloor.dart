import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kmouin/widgets/MenuCard.dart';
import 'package:kmouin/widgets/MenuInfo.dart';
import 'package:kmouin/widgets/MenuData.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Dart:ui';
import 'package:flutter_statusbar_text_color/flutter_statusbar_text_color.dart';

class ThirdFloor extends StatefulWidget {
  @override
  _ThirdFloorState createState() => _ThirdFloorState();
}

class _ThirdFloorState extends State<ThirdFloor> {
  Future<MenuData> menuData;

  Future<MenuData> _fetch1() async {
    try {
      print("future 실행!");
      http.Response response = await http.get(
          "https://asia-northeast1-kmouin-62d7f.cloudfunctions.net/api/menu");
      if (response.statusCode == 200) {
        print(response.body);
        return MenuData.fromJson(json.decode(response.body));
      } else {
        throw Exception("Failed to load data");
      }
    } catch (err) {
      print("error!");
      return MenuData.fromJson({
        "status": "error",
        "result": {
          "f2l": ["식단 정보 없음"],
          "f2d": ["식단 정보 없음"],
          "f2s": ["식단 정보 없음"],
          "f3b": ["식단 정보 없음"],
          "f5l": ["식단 정보 없음"],
          "f5s": ["식단 정보 없음"],
        }
      });
    }
  }

  void initState() {
    super.initState();
    menuData = _fetch1();
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarTextColor.setTextColor(FlutterStatusbarTextColor.dark);
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
                      buildFutureBuilder(),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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

  FutureBuilder<MenuData> buildFutureBuilder() {
    return FutureBuilder(
        future: menuData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData == false) {
            return Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("error");
          } else {
            print(snapshot.data);
            return Column(
              children: <Widget>[
                MenuCard(
                  title: '천원의 아침',
                  children: <Widget>[
                    MenuInfo(
                      menuTable: snapshot.data.result["f3b"],
                    ),
                  ],
                ),
              ],
            );
          }
        });
  }
}
