import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "../widgets/MenuCard.dart";
import "../widgets/MenuInfo.dart";
import "../widgets/MenuData.dart";
import "package:http/http.dart" as http;
import "dart:convert";
import "Dart:ui";
import "../widgets/MenulistCard.dart";
import "../widgets/MenulistInfo.dart";

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
          "https://asia-northeast1-kmouin-62d7f.cloudfunctions.net/api/menu/smeal");
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
          "f3m": {
            "yc": [
              {"menu": "메뉴 정보 없음", "price": ""},
            ],
            "rc": [
              {"menu": "메뉴 정보 없음", "price": ""},
            ],
            "bc": [
              {"menu": "메뉴 정보 없음", "price": ""},
            ],
            "dc": [
              {"menu": "메뉴 정보 없음", "price": ""},
            ],
          },
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
    double fullWidth = MediaQuery.of(context).size.width;

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(children: <Widget>[
            //점 3개 + "3층학식"
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 24,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(),
                SizedBox(height: 42.0),
                Text(
                  "3층 학식",
                  style: TextStyle(
                    color: const Color(0xffeb577c),
                    fontWeight: FontWeight.w500,
                    fontFamily: "NotoSansKR",
                    fontStyle: FontStyle.normal,
                    fontSize: 32,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "오늘은 이걸 먹어볼까?",
                  style: TextStyle(
                    color: Color(0xfff05c53),
                    fontWeight: FontWeight.w300,
                    fontFamily: "NotoSansKR",
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 28.0),
                buildFutureBuilder(fullWidth),
              ],
            ),
          ]
              //"오늘은 이걸 먹어볼까?" + 나머지내용

              ),
        ),
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
            return Column(
              children: <Widget>[
                SizedBox(height: 50.0),
                Text(
                  "error",
                  style: TextStyle(
                    color: const Color(0xff131415),
                    fontWeight: FontWeight.w500,
                    fontFamily: "NotoSansKR",
                    fontStyle: FontStyle.normal,
                    fontSize: 24,
                  ),
                ),
              ],
            );
          } else {
            print(snapshot.data);
            return Column(
              children: <Widget>[
                MenuCard(
                  title: "천원의 아침",
                  width: fullWidth * 0.92,
                  dividerWidth: fullWidth * 0.86,
                  children: <Widget>[
                    MenuInfo(
                      menuTable: snapshot.data.result["f3b"],
                    ),
                  ],
                ),
                SizedBox(height: 50.0),
                MenuListCard(
                  fullWidth: fullWidth,
                  title: "양식 코너",
                  children: <Widget>[
                    MenuListInfo(
                      menuTable: snapshot.data.result["f3m"]["yc"],
                    ),
                  ],
                ),
                MenuListCard(
                  fullWidth: fullWidth,
                  title: "라면 코너",
                  children: <Widget>[
                    MenuListInfo(
                      menuTable: snapshot.data.result["f3m"]["rc"],
                    ),
                  ],
                ),
                MenuListCard(
                  fullWidth: fullWidth,
                  title: "분식 코너",
                  children: <Widget>[
                    MenuListInfo(
                      menuTable: snapshot.data.result["f3m"]["bc"],
                    ),
                  ],
                ),
                MenuListCard(
                  fullWidth: fullWidth,
                  title: "덮밥 코너",
                  children: <Widget>[
                    MenuListInfo(
                      menuTable: snapshot.data.result["f3m"]["dc"],
                    ),
                  ],
                ),
              ],
            );
          }
        });
  }
}
