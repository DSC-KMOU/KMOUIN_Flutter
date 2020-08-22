import 'package:flutter/material.dart';
import 'package:kmouin/widgets/MenuCard.dart';
import 'package:kmouin/widgets/MenuInfo.dart';
import 'package:kmouin/widgets/MenuData.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Dart:ui';

class DormMenu extends StatefulWidget {
  @override
  _DormMenuState createState() => _DormMenuState();
}

class _DormMenuState extends State<DormMenu> {
  Future<MenuData> menuData;

  Future<MenuData> _fetch1() async {
    try {
      print("future 실행!");
      http.Response response = await http.get(
          "https://asia-northeast1-kmouin-62d7f.cloudfunctions.net/api/dormmenu");
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
          "db": ["식단 정보 없음"],
          "dl": ["식단 정보 없음"],
          "dd": ["식단 정보 없음"],
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
        backgroundColor: Colors.white.withOpacity(0.8),
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
                    Icons.arrow_back_ios,
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
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 115,
                      ),
                      Text(
                        "기숙사식",
                        style: const TextStyle(
                          color: const Color(0xffeb577c),
                          fontWeight: FontWeight.w500,
                          fontFamily: "NotoSansKR",
                          fontStyle: FontStyle.normal,
                          fontSize: 32.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 4,
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
                        height: 28,
                      ),
                      buildFutureBuilder(),
                      SizedBox(
                        height: 70,
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
                  title: '아침',
                  children: <Widget>[
                    MenuInfo(
                      menuTable: snapshot.data.result["db"],
                    ),
                  ],
                ),
                SizedBox(
                  height: 34,
                ),
                MenuCard(
                  title: '점심',
                  children: <Widget>[
                    MenuInfo(
                      menuTable: snapshot.data.result["dl"],
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
                      menuTable: snapshot.data.result["dd"],
                    ),
                  ],
                ),
              ],
            );
          }
        });
  }
}
