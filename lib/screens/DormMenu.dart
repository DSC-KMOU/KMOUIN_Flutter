import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_statusbar_text_color/flutter_statusbar_text_color.dart';
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
          "https://asia-northeast1-kmouin-62d7f.cloudfunctions.net/api/menu/dorm");
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
          "dormb": ["식단 정보 없음"],
          "dorml": ["식단 정보 없음"],
          "dormd": ["식단 정보 없음"],
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
    double fullWidth = MediaQuery.of(context).size.width;
    double fullHeight = MediaQuery.of(context).size.height;
    ScreenUtil.init(context, width: fullWidth, height: fullHeight, allowFontScaling: false);
    Color _appbarFont = Color(0xffeb577c);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(44.0),
        child: AppBar(
          centerTitle: false,
          titleSpacing: -6.0,
          backgroundColor: Colors.white,
          elevation: 1.0,
          automaticallyImplyLeading: false,
          title: FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(44.0)),
            onPressed: () {
              setState(
                () {
                  Navigator.pop(context);
                },
              );
            },
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            child: Align(
              alignment: Alignment.centerLeft,
              widthFactor: 1.1,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    CupertinoIcons.back,
                    color: _appbarFont,
                  ),
                  Text(
                    "식단 정보",
                    style: TextStyle(
                      color: _appbarFont,
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0,
                      wordSpacing: 0.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
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
                        style: TextStyle(
                          color: const Color(0xffeb577c),
                          fontWeight: FontWeight.w500,
                          fontFamily: "NotoSansKR",
                          fontStyle: FontStyle.normal,
                          fontSize: ScreenUtil().setSp(32),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '오늘의 메뉴는 뭘까요?',
                        style: TextStyle(
                          color: const Color(0xfff05c53),
                          fontWeight: FontWeight.w300,
                          fontFamily: "NotoSansKR",
                          fontStyle: FontStyle.normal,
                          fontSize: ScreenUtil().setSp(20),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      buildFutureBuilder(fullWidth),
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

  FutureBuilder<MenuData> buildFutureBuilder(double fullWidth) {
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
                    child: CupertinoActivityIndicator(
                      radius: 20,
                    ),
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
                  width: fullWidth * 0.92,
                  dividerWidth: fullWidth * 0.86,
                  children: <Widget>[
                    MenuInfo(
                      menuTable: snapshot.data.result["dormb"],
                    ),
                  ],
                ),
                SizedBox(
                  height: 34,
                ),
                MenuCard(
                  title: '점심',
                  width: fullWidth * 0.92,
                  dividerWidth: fullWidth * 0.86,
                  children: <Widget>[
                    MenuInfo(
                      menuTable: snapshot.data.result["dorml"],
                    ),
                  ],
                ),
                SizedBox(
                  height: 34,
                ),
                MenuCard(
                  title: '저녁',
                  width: fullWidth * 0.92,
                  dividerWidth: fullWidth * 0.86,
                  children: <Widget>[
                    MenuInfo(
                      menuTable: snapshot.data.result["dormd"],
                    ),
                  ],
                ),
              ],
            );
          }
        });
  }
}
