import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/TopContainer.dart';
import 'CommuterBusPage.dart';
import '../widgets/BusCard.dart';
import '../widgets/BusInfo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_statusbar_text_color/flutter_statusbar_text_color.dart';

class BusPage extends StatefulWidget {
  BusPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class BusData {
  final String status;
  final String cur;
  final Map<dynamic, dynamic> result;

  BusData({Key key, this.status, this.cur, this.result});

  factory BusData.fromJson(Map<String, dynamic> json) {
    return BusData(
      status: json['status'],
      cur: json['cur'],
      result: json['result'],
    );
  }
}

class _MyHomePageState extends State<BusPage> {
  Future<BusData> busData;

  Future<BusData> _fetch1() async {
    try {
      print("future 실행!");
      http.Response response = await http.get(
          "https://asia-northeast1-kmouin-62d7f.cloudfunctions.net/api/bus");
      if (response.statusCode == 200) {
        // final busInfo = json.decode(response.body);
        return BusData.fromJson(json.decode(response.body));
      } else {
        throw Exception("Failed to load data");
      }
    } catch (err) {
      print("error!");
      return BusData.fromJson({
        "status": "error",
        "cur": "error",
        "result": {
          "bus190": {
            "week": [
              {"min": "", "content": ""},
              {"min": "", "content": ""},
              {"min": "", "content": ""}
            ],
            "saturday": [
              {"min": "", "content": ""},
              {"min": "", "content": ""},
              {"min": "", "content": ""}
            ],
            "weekend": [
              {"min": "", "content": ""},
              {"min": "", "content": ""},
              {"min": "", "content": ""}
            ]
          },
          "shuttle": {
            "week": [
              {"min": "", "content": ""},
              {"min": "", "content": ""},
              {"min": "", "content": ""}
            ],
            "vacation": [
              {"min": "", "content": ""},
              {"min": "", "content": ""},
              {"min": "", "content": ""}
            ],
            "exam": [
              {"min": "", "content": ""},
              {"min": "", "content": ""},
              {"min": "", "content": ""}
            ]
          }
        }
      });
    }
  }

  void initState() {
    super.initState();
    busData = _fetch1();
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarTextColor.setTextColor(FlutterStatusbarTextColor.dark);
    double fullWidth = MediaQuery.of(context).size.width;
    double fullHeight = MediaQuery.of(context).size.height;
    ScreenUtil.init(context,width: fullWidth,height:fullHeight,allowFontScaling: false);
    Color _appbarFont = Color(0xffffffff);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(44.0),
        child: AppBar(
          centerTitle: false,
          titleSpacing: -6.0,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: Alignment.centerLeft,
            child: FlatButton(
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
                widthFactor: 1.5,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      CupertinoIcons.back,
                      color: _appbarFont,
                    ),
                    Text(
                      "메인",
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                right: 10.0,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                onPressed: () async {
                  // await _fetch1();
                  setState(() {
                    // 수정 필요 !!
                    busData = _fetch1();
                  });
                },
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(),
          TopContainer(
            child: Image.asset('images/BusPage/TopContainer.png'),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Text(
                    "버스 정보",
                    style: TextStyle(
                      color: const Color(0xffffffff),
                      letterSpacing: -0.5,
                      fontWeight: FontWeight.w500,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: ScreenUtil().setSp(32),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    "실시간 위치를 알 수 있어요",
                    style: TextStyle(
                      color: const Color(0xffffffff),
                      letterSpacing: -0.5,
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: ScreenUtil().setSp(20),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  buildFutureBuilder(fullWidth),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  FutureBuilder<BusData> buildFutureBuilder(double fullWidth) {
    return FutureBuilder(
        future: busData,
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
                Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 10.0),
                            Text(
                              snapshot.data.cur,
                              style: TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w300,
                                fontFamily: "NotoSansKR",
                                fontStyle: FontStyle.normal,
                                fontSize: ScreenUtil().setSp(18),
                              ),
                            ),
                            SizedBox(height: 33.0),
                            BusCard(
                                title: '셔틀 버스',
                                width: fullWidth * 0.947,
                                children: <Widget>[
                                  BusInfo(
                                    width: fullWidth * 0.27,
                                    title: "평일",
                                    timeTable: snapshot.data.result["shuttle"]
                                        ["week"],
                                  ),
                                  SizedBox(height: 14.0),
                                  BusInfo(
                                    width: fullWidth * 0.27,
                                    title: "방학 / 주말",
                                    timeTable: snapshot.data.result["shuttle"]
                                        ["vacation"],
                                  ),
                                  SizedBox(height: 14.0),
                                  BusInfo(
                                    width: fullWidth * 0.27,
                                    title: "시험기간",
                                    timeTable: snapshot.data.result["shuttle"]
                                        ["exam"],
                                  ),
                                ]),
                            SizedBox(height: 30.0),
                            BusCard(
                                title: '190번 버스',
                                width: fullWidth * 0.947,
                                children: <Widget>[
                                  BusInfo(
                                    width: fullWidth * 0.27,
                                    title: "평일",
                                    timeTable: snapshot.data.result["bus190"]
                                        ["week"],
                                  ),
                                  SizedBox(height: 14.0),
                                  BusInfo(
                                    width: fullWidth * 0.27,
                                    title: "토요일",
                                    timeTable: snapshot.data.result["bus190"]
                                        ["saturday"],
                                  ),
                                  SizedBox(height: 14.0),
                                  BusInfo(
                                    width: fullWidth * 0.27,
                                    title: "일요일 / 공휴일",
                                    timeTable: snapshot.data.result["bus190"]
                                        ["weekend"],
                                  ),
                                ]),
                            SizedBox(height: 39.0),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CoummuterBusPage()));
                              },
                              child: Container(
                                width: fullWidth * 0.947,
                                height: 107,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "통근 버스 정보",
                                      style: TextStyle(
                                        color: const Color(0xff131415),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "NotoSansKR",
                                        fontStyle: FontStyle.normal,
                                        letterSpacing: -1.0,
                                        fontSize: ScreenUtil().setSp(24),
                                      ),
                                    ),
                                    SizedBox(width: fullWidth * 0.058),
                                    SizedBox(
                                      width: fullWidth * 0.165,
                                      height: 44,
                                      child: Image.asset(
                                          "images/BusPage/commuterbus.png"),
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
                                  border: Border.all(
                                    color: const Color(0xff842fb5),
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: const Color(0x80cacaca),
                                        offset: Offset(0, -1),
                                        blurRadius: 16,
                                        spreadRadius: 2)
                                  ],
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              "학교 홈페이지 버스 시간표를 기준으로 만들었습니다.",
                              style: TextStyle(
                                color: const Color(0xff666666),
                                fontWeight: FontWeight.w500,
                                fontFamily: "NotoSansKR",
                                fontStyle: FontStyle.normal,
                                fontSize: ScreenUtil().setSp(14),
                                letterSpacing: -0.2,
                              ),
                            ),
                            SizedBox(height: 20.0),
                          ],
                        ),
                      ]),
                ),
              ],
            );
          }
        });
  }
}
