import 'package:flutter/material.dart';
import 'package:kmouin/widgets/MenuCard.dart';
import 'package:kmouin/widgets/MenuInfo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Dart:ui';

class FifthFloor extends StatefulWidget {
  @override
  _FifthFloorState createState() => _FifthFloorState();
}

class MenuData {
  final String status;
  final Map<dynamic, dynamic> result;

  MenuData({this.status, this.result});

  factory MenuData.fromJson(Map<String, dynamic> json) {
    return MenuData(
      status: json['status'],
      result: json['result'],
    );
  }
}

class _FifthFloorState extends State<FifthFloor> {
  Future<MenuData> menuData;

  Future<MenuData> _fetch1() async {
    try {
      print("future 실행!");
      http.Response response =
          await http.get("http://192.168.1.64:3000/api/menu");
      if (response.statusCode == 200) {
        // final busInfo = json.decode(response.body);
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white.withOpacity(0.7),
        elevation: 0,
        automaticallyImplyLeading: false,
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
                    Icons.navigate_before,
                    color: Color(0xffeb577c),
                  ),
                  Text(
                    "학식정보",
                    style: TextStyle(
                      color: const Color(0xffeb577c),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0,
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
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 94,
                        ),
                        //점1
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 9,
                              height: 9,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xffff746f),
                              ),
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            SizedBox(
                              width: 111,
                            ),
                            SizedBox(
                              width: 27,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        //점2
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 79,
                            ),
                            SizedBox(
                              width: 111,
                            ),
                            SizedBox(
                              width: 75,
                            ),
                            Container(
                              width: 4,
                              height: 4,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xffff746f),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text("5층 학식",
                            style: const TextStyle(
                                color: const Color(0xffeb577c),
                                fontWeight: FontWeight.w500,
                                fontFamily: "NotoSansKR",
                                fontStyle: FontStyle.normal,
                                fontSize: 32.0),
                            textAlign: TextAlign.center),
                        SizedBox(
                          height: 9,
                        ),
                        //점3
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 100,
                            ),
                            SizedBox(
                              width: 111,
                            ),
                            SizedBox(
                              width: 91,
                            ),
                            Container(
                              width: 9,
                              height: 9,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xffff746f),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        //점4
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 9,
                              height: 9,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xffff746f),
                              ),
                            ),
                            SizedBox(
                              width: 87,
                            ),
                            SizedBox(
                              width: 111,
                            ),
                            SizedBox(
                              width: 96,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        //점5
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 38,
                            ),
                            SizedBox(
                              width: 111,
                            ),
                            SizedBox(
                              width: 29,
                            ),
                            Container(
                              width: 9,
                              height: 9,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xffff746f),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                //'교직원 식당입니다' + 점심일품식
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 167,
                      ),
                      Text(
                        '교직원 식당입니다!',
                        style: const TextStyle(
                            color: const Color(0xfff05c53),
                            fontWeight: FontWeight.w300,
                            fontFamily: "NotoSansKR",
                            fontStyle: FontStyle.normal,
                            fontSize: 20.0),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 28,
                      ),
//                      //점심
//                      Container(
//                        padding: EdgeInsets.all(16),
//                        width: 355,
//                        decoration: BoxDecoration(
//                          borderRadius: BorderRadius.all(Radius.circular(18)),
//                          boxShadow: [
//                            BoxShadow(
//                              color: const Color(0x80cacaca),
//                              offset: Offset(0, -1),
//                              blurRadius: 16,
//                              spreadRadius: 2,
//                            )
//                          ],
//                          color: const Color(0xffffffff),
//                        ),
//                        child: Column(
//                          children: <Widget>[
//                            Text("점심",
//                                style: const TextStyle(
//                                    color: const Color(0xff131415),
//                                    fontWeight: FontWeight.w500,
//                                    fontFamily: "NotoSansKR",
//                                    fontStyle: FontStyle.normal,
//                                    fontSize: 24.0),
//                                textAlign: TextAlign.center),
//                            SizedBox(
//                              height: 7,
//                            ),
//                            Container(
//                              width: 319,
//                              height: 1,
//                              decoration: BoxDecoration(
//                                color: const Color(0xffc53786),
//                              ),
//                            ),
//                            SizedBox(
//                              height: 15,
//                            ),
//                            Text("쌀밥 / 잡곡밥",
//                                style: const TextStyle(
//                                    color: const Color(0xff131415),
//                                    fontWeight: FontWeight.w300,
//                                    fontFamily: "NotoSansKR",
//                                    fontStyle: FontStyle.normal,
//                                    fontSize: 16.0),
//                                textAlign: TextAlign.center),
//                            SizedBox(
//                              height: 12,
//                            ),
//                            Text("닭개장",
//                                style: const TextStyle(
//                                    color: const Color(0xff131415),
//                                    fontWeight: FontWeight.w300,
//                                    fontFamily: "NotoSansKR",
//                                    fontStyle: FontStyle.normal,
//                                    fontSize: 16.0),
//                                textAlign: TextAlign.center),
//                            SizedBox(
//                              height: 12,
//                            ),
//                            Text("고추장 불고기",
//                                style: const TextStyle(
//                                    color: const Color(0xff131415),
//                                    fontWeight: FontWeight.w300,
//                                    fontFamily: "NotoSansKR",
//                                    fontStyle: FontStyle.normal,
//                                    fontSize: 16.0),
//                                textAlign: TextAlign.center),
//                            SizedBox(
//                              height: 12,
//                            ),
//                            Text("연두부 / 양념장",
//                                style: const TextStyle(
//                                    color: const Color(0xff131415),
//                                    fontWeight: FontWeight.w300,
//                                    fontFamily: "NotoSansKR",
//                                    fontStyle: FontStyle.normal,
//                                    fontSize: 16.0),
//                                textAlign: TextAlign.center),
//                            SizedBox(
//                              height: 12,
//                            ),
//                            Text("깻순나물무침",
//                                style: const TextStyle(
//                                    color: const Color(0xff131415),
//                                    fontWeight: FontWeight.w300,
//                                    fontFamily: "NotoSansKR",
//                                    fontStyle: FontStyle.normal,
//                                    fontSize: 16.0),
//                                textAlign: TextAlign.center),
//                            SizedBox(
//                              height: 12,
//                            ),
//                            Text("배추김치",
//                                style: const TextStyle(
//                                    color: const Color(0xff131415),
//                                    fontWeight: FontWeight.w300,
//                                    fontFamily: "NotoSansKR",
//                                    fontStyle: FontStyle.normal,
//                                    fontSize: 16.0),
//                                textAlign: TextAlign.center),
//                            SizedBox(
//                              height: 12,
//                            ),
//                            Text("요구르트",
//                                style: const TextStyle(
//                                    color: const Color(0xff131415),
//                                    fontWeight: FontWeight.w300,
//                                    fontFamily: "NotoSansKR",
//                                    fontStyle: FontStyle.normal,
//                                    fontSize: 16.0),
//                                textAlign: TextAlign.center),
//                            SizedBox(
//                              height: 12,
//                            ),
//                            Text("알배추쌈",
//                                style: const TextStyle(
//                                    color: const Color(0xff131415),
//                                    fontWeight: FontWeight.w300,
//                                    fontFamily: "NotoSansKR",
//                                    fontStyle: FontStyle.normal,
//                                    fontSize: 16.0),
//                                textAlign: TextAlign.center),
//                          ],
//                        ),
//                      ),
//                      SizedBox(
//                        height: 35,
//                      ),
//                      //일품식
//                      Container(
//                        padding: EdgeInsets.all(16),
//                        width: 355,
//                        decoration: BoxDecoration(
//                          borderRadius: BorderRadius.all(Radius.circular(18)),
//                          boxShadow: [
//                            BoxShadow(
//                              color: const Color(0x80cacaca),
//                              offset: Offset(0, -1),
//                              blurRadius: 16,
//                              spreadRadius: 2,
//                            ),
//                          ],
//                          color: const Color(0xffffffff),
//                        ),
//                        child: Column(
//                          children: <Widget>[
//                            Text("일품식",
//                                style: const TextStyle(
//                                    color: const Color(0xff131415),
//                                    fontWeight: FontWeight.w500,
//                                    fontFamily: "NotoSansKR",
//                                    fontStyle: FontStyle.normal,
//                                    fontSize: 24.0),
//                                textAlign: TextAlign.center),
//                            SizedBox(
//                              height: 7,
//                            ),
//                            Container(
//                              width: 319,
//                              height: 1,
//                              decoration: BoxDecoration(
//                                color: const Color(0xffc53786),
//                              ),
//                            ),
//                            SizedBox(
//                              height: 17,
//                            ),
//                            Text("갈치조림",
//                                style: const TextStyle(
//                                    color: const Color(0xff131415),
//                                    fontWeight: FontWeight.w300,
//                                    fontFamily: "NotoSansKR",
//                                    fontStyle: FontStyle.normal,
//                                    fontSize: 16.0),
//                                textAlign: TextAlign.center),
//                          ],
//                        ),
//                      ),
//                      SizedBox(
//                        height: 83,
//                      ),
                      buildFutureBuilder(),
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
            return MenuCard(
              title: '점심',
              children: <Widget>[
                //MenuInfo(
                  //menuTable: snapshot.data.result["f5l"],
                  //length:
                      //snapshot.data.result["f5l"].toString().split(',').length,
                //),
              ],
            );
          }
        });
  }
}
