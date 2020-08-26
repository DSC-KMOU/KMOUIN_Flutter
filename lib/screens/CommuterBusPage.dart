import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/CommuterCard.dart';
import '../widgets/BusRoute.dart';
import 'package:flutter_statusbar_text_color/flutter_statusbar_text_color.dart';

class CoummuterBusPage extends StatefulWidget {
  CoummuterBusPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CoummuterBusPage> {
  // ignore: non_constant_identifier_names
  String CommuterBusRoute1 = "구서동2동 풍년혼수마트(07:27) > 롯데캐슬 상가앞(02:28)" +
      "\n" +
      "장전동 기아자동차(07:31) > 장전동 놀이터(07:34)" +
      "\n" +
      "온천장 홈플러스(07:42) > 롯데백화점 정류장(07:44)" +
      "\n" +
      "삼성프라자(온천점)(07:46) > 교대역(07:49)" +
      "\n" +
      "연산동.연제초교(07:51) > 양정역(07:55)" +
      "\n" +
      "부전역(07:59) > 서면역(08:02)" +
      "\n" +
      "범일역 5번출구(08:06) > 부산진역 7번출구(08:11)" +
      "\n" +
      "부산역 3번출구(08:15) > ";

  // ignore: non_constant_identifier_names
  String CommuterBusRoute2 = "서면역(07:58) > 범일역 5번출구(08:03)" +
      "\n" +
      "부산진역 7번출구(08:08) > 부산역 3번출구(08:13)" +
      "\n";
  String CommuterBusRoute3 = "연산9동 안락뜨란채(07:40) > 망미동주공아파트(07:46)" +
      "\n" +
      "수영국민은행(07:51) > 수영역10번출구(07:56)" +
      "\n" +
      "한서병원(07:58) > KBS방송국(08:05)" +
      "\n" +
      "남천역버스정류장(08:07) > 경성대부경대역에서좌회전" +
      "\n" +
      "봄봄카페(08:12) > 더맛한우(08:15)" "\n" +
      "대연자이아파트후문(08:16) > 부산항대교" +
      "\n" +
      "한라아파트(08:29) > 동삼동농협(08:32)" +
      "\n" +
      "학교도착(08:45)";

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarTextColor.setTextColor(FlutterStatusbarTextColor.dark);
    double fullWidth = MediaQuery.of(context).size.width;
    Color _appbarFont = Color(0xff842fb5);

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
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  CupertinoIcons.back,
                  color: _appbarFont,
                ),
                Text(
                  "버스 정보",
                  style: TextStyle(
                    color: _appbarFont,
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
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(),
              SizedBox(height: 16.0),
              Text(
                "통근 버스 정보",
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: "NotoSansKR",
                  color: Color(0xff842fb5),
                  letterSpacing: -1.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20.0),
              CommuterCard(
                cardtitle: BusRoute(
                  title: "통근버스 1호차",
                  info: "서면/구서동",
                ),
                width: fullWidth * 0.93,
                cardcontent: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "출근 노선",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xff842fb5),
                          letterSpacing: -1.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "교직원 이용/",
                          style: TextStyle(
                            color: Color(0xff787878),
                            fontSize: 12,
                            letterSpacing: -1.0,
                            fontWeight: FontWeight.w500,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '학생은 영도대교 승차\n',
                              style: TextStyle(
                                color: Color(0xff842fb5),
                                letterSpacing: -1.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: CommuterBusRoute1,
                              style: TextStyle(
                                fontSize: 13.0,
                                fontFamily: 'NotoSansKR',
                                height: 1.5,
                                color: Color(0xff787878),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: '영도대교 대궁한정식 앞(08:25)',
                              style: TextStyle(
                                fontSize: 13.0,
                                fontFamily: 'NotoSansKR',
                                height: 1.5,
                                color: Color(0xff842fb5),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "학교도착(08:45)",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontFamily: 'NotoSansKR',
                          height: 1.5,
                          color: Color(0xff787878),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "퇴근 노선",
                        style: TextStyle(
                          fontSize: 18.0,
                          height: 1.5,
                          letterSpacing: -1.0,
                          color: Color(0xff842fb5),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "정원 여유시",
                          style: TextStyle(
                            color: Color(0xff787878),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' 학생 이용 가능 ',
                              style: TextStyle(
                                color: Color(0xff842fb5),
                                fontSize: 12,
                                letterSpacing: -1.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: '( 정원 45명 )',
                              style: TextStyle(
                                color: Color(0xff787878),
                                fontSize: 12,
                                letterSpacing: -1.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "학교출발(18:10) > 중앙역 > 부산역 > 서면 > 시청\n동래 > 부산대",
                          style: TextStyle(
                            fontSize: 13.0,
                            fontFamily: 'NotoSansKR',
                            height: 1.5,
                            color: Color(0xff787878),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 18.0),
              CommuterCard(
                cardtitle: BusRoute(
                  title: "통근버스 2호차",
                  info: "남포동/문현동",
                ),
                width: fullWidth * 0.93,
                cardcontent: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "출근 노선",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xff842fb5),
                          letterSpacing: -1.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "교직원 이용/",
                          style: TextStyle(
                            color: Color(0xff787878),
                            fontSize: 12,
                            letterSpacing: -1.0,
                            fontWeight: FontWeight.w500,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '학생은 영도대교 승차\n',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Color(0xff842fb5),
                                letterSpacing: -1.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: CommuterBusRoute2,
                              style: TextStyle(
                                fontSize: 13.0,
                                fontFamily: 'NotoSansKR',
                                height: 1.5,
                                color: Color(0xff787878),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: '영도대교 대궁한정식 앞(08:25)',
                              style: TextStyle(
                                fontSize: 13.0,
                                fontFamily: 'NotoSansKR',
                                height: 1.5,
                                color: Color(0xff842fb5),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: " > 관사(08:35)",
                              style: TextStyle(
                                fontSize: 13.0,
                                fontFamily: 'NotoSansKR',
                                height: 1.5,
                                color: Color(0xff787878),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "학교도착(08:45)",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontFamily: 'NotoSansKR',
                          height: 1.5,
                          color: Color(0xff787878),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "퇴근 노선",
                        style: TextStyle(
                          fontSize: 18.0,
                          height: 1.5,
                          letterSpacing: -1.0,
                          color: Color(0xff842fb5),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "정원 여유시",
                          style: TextStyle(
                            color: Color(0xff787878),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' 학생 이용 가능 ',
                              style: TextStyle(
                                color: Color(0xff842fb5),
                                fontSize: 12,
                                letterSpacing: -1.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: '( 정원 45명 )',
                              style: TextStyle(
                                color: Color(0xff787878),
                                fontSize: 12,
                                letterSpacing: -1.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "학교출발(18:10) > 중리관사앞 > 영도소방서 >  롯데백화\n점 > 부산역 > 부산진역 > 문현동 > 대연동",
                          style: TextStyle(
                            fontSize: 13.0,
                            fontFamily: 'NotoSansKR',
                            height: 1.5,
                            color: Color(0xff787878),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 18.0),
              CommuterCard(
                cardtitle: BusRoute(
                  title: "통근버스 3호차",
                  info: "경성대/수영",
                ),
                width: fullWidth * 0.93,
                cardcontent: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "출근 노선",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xff842fb5),
                          letterSpacing: -1.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "교직원 이용/",
                          style: TextStyle(
                            color: Color(0xff787878),
                            fontSize: 12,
                            letterSpacing: -1.0,
                            fontWeight: FontWeight.w500,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '학생은 영도대교 승차\n',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Color(0xff842fb5),
                                letterSpacing: -1.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: CommuterBusRoute3,
                              style: TextStyle(
                                fontSize: 13.0,
                                fontFamily: 'NotoSansKR',
                                height: 1.5,
                                color: Color(0xff787878),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "퇴근 노선",
                        style: TextStyle(
                          fontSize: 18.0,
                          height: 1.5,
                          letterSpacing: -1.0,
                          color: Color(0xff842fb5),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "정원 여유시",
                          style: TextStyle(
                            color: Color(0xff787878),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' 학생 이용 가능 ',
                              style: TextStyle(
                                color: Color(0xff842fb5),
                                fontSize: 12,
                                letterSpacing: -1.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: '( 정원 45명 )',
                              style: TextStyle(
                                color: Color(0xff787878),
                                fontSize: 12,
                                letterSpacing: -1.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "학교출발(18:10) > 영도구청 > 부산항대교 >  경성대 > 남\n천역 > 수영로타리 > 망미동주공아파트",
                          style: TextStyle(
                            fontSize: 13.0,
                            fontFamily: 'NotoSansKR',
                            height: 1.5,
                            color: Color(0xff787878),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 18.0),
              CommuterCard(
                cardtitle: Row(
                  children: <Widget>[
                    Text(
                      "학교버스 셔틀",
                      style: const TextStyle(
                        color: Color(0xff131415),
                        letterSpacing: -1.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 22.0,
                      ),
                    ),
                  ],
                ),
                width: fullWidth * 0.93,
                cardcontent: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "학교 ↔ 남포동간 1회 운행",
                        style: TextStyle(
                          color: Color(0xff842fb5),
                          fontSize: 16.0,
                          fontFamily: "NotoSansKR",
                          letterSpacing: -1.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  "학교출발(09:00 > 영도대교 대궁한정식 앞(09:25)\n학교도착(09:50)",
                              style: TextStyle(
                                fontSize: 13.0,
                                fontFamily: 'NotoSansKR',
                                height: 1.5,
                                color: Color(0xff787878),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        "학교 ↔ 대연동간 1회 운행",
                        style: TextStyle(
                          color: Color(0xff842fb5),
                          fontSize: 16.0,
                          fontFamily: "NotoSansKR",
                          letterSpacing: -1.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  "학교출발(08:50) > 경성대부경대역 3번출구 눈사랑안경점 앞(09:20) > 학교도착(09:55)",
                              style: TextStyle(
                                fontSize: 13.0,
                                fontFamily: 'NotoSansKR',
                                height: 1.5,
                                color: Color(0xff787878),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                "학교 홈페이지 기준으로 만들었습니다.",
                style: const TextStyle(
                  color: const Color(0xff666666),
                  fontWeight: FontWeight.w500,
                  fontFamily: "NotoSansKR",
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0,
                  letterSpacing: -0.2,
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
