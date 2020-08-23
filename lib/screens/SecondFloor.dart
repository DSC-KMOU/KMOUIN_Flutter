import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:kmouin/widgets/MenuCard.dart';
import 'package:kmouin/widgets/MenuInfo.dart';
import 'package:kmouin/widgets/MenuData.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Dart:ui';
import 'package:flutter_statusbar_text_color/flutter_statusbar_text_color.dart';

class SecondFloor extends StatefulWidget {
  @override
  _SecondFloorState createState() => _SecondFloorState();
}

class _SecondFloorState extends State<SecondFloor> {
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(47.0),
        child: AppBar(
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
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                //점 2개 + '2층학식'
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 116,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 56,
                            ),
                            Text(
                              '2층 학식',
                              style: const TextStyle(
                                  color: const Color(0xffeb577c),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "NotoSansKR",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 32.0),
                              textAlign: TextAlign.center,
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 48,
                                ),
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color(0xffe85686),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 27,
                                ),
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color(0xffef5b55),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 74,
                            ),
                            SizedBox(
                              width: 111,
                            ),
                            SizedBox(
                              width: 84,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                //'오늘의 메뉴는 뭘까요?' + 점심저녁일품식
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 167,
                      ),
                      Text(
                        '오늘의 메뉴는 뭘까요?',
                        style: const TextStyle(
                            color: const Color(0xfff05c53),
                            fontWeight: FontWeight.w300,
                            fontFamily: "NotoSansKR",
                            fontStyle: FontStyle.normal,
                            fontSize: 20.0),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      buildFutureBuilder(),
                      SizedBox(
                        height: 30,
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
                  title: '점심',
                  children: <Widget>[
                    MenuInfo(
                      menuTable: snapshot.data.result["f2l"],
                    ),
                  ],
                ),
                SizedBox(
                  height: 34,
                ),
                MenuCard(
                  title: '저녁',
                  children: <Widget>[
                    MenuInfo(
                      menuTable: snapshot.data.result["f2d"],
                    ),
                  ],
                ),
                SizedBox(
                  height: 34,
                ),
                MenuCard(
                  title: '일품식',
                  children: <Widget>[
                    MenuInfo(
                      menuTable: snapshot.data.result["f2s"],
                    ),
                  ],
                ),
              ],
            );
          }
        });
  }
}
