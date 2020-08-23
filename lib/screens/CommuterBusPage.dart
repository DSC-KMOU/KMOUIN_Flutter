import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/BusRoute.dart';
import 'package:flutter_statusbar_text_color/flutter_statusbar_text_color.dart';

class CoummuterBusPage extends StatefulWidget {
  CoummuterBusPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CoummuterBusPage> {
  String CommuterBusRoute = "구서동2동 풍년혼수마트(07:27) > 롯데캐슬 상가앞(02:28)" +
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

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarTextColor.setTextColor(FlutterStatusbarTextColor.dark);
    double fullWidth = MediaQuery.of(context).size.width;
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
                      color: Color(0xff842fb5),
                    ),
                    Text(
                      "버스 정보",
                      style: TextStyle(
                        color: Color(0xff842fb5),
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
                width: fullWidth * 0.947,
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
                              text: CommuterBusRoute,
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
                        padding: const EdgeInsets.only(top:10.0),
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
              SizedBox(height:18.0),
              CommuterCard(
                cardtitle: BusRoute(
                  title: "통근버스 1호차",
                  info: "서면/구서동",
                ),
                width: fullWidth * 0.947,
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
                              text: CommuterBusRoute,
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
                        padding: const EdgeInsets.only(top:10.0),
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
              SizedBox(height:18.0),
            ],
          ),
        ),
      ),
    );
  }
}

class CommuterCard extends StatelessWidget {
  final Widget cardtitle;
  final Widget cardcontent;
  final double width;

  const CommuterCard({Key key, @required this.cardtitle, this.cardcontent, @required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.only(
        left: 18.0,
        top: 19.0,
        right: 18.0,
        bottom: 22.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          cardtitle,
          Divider(
            color: Color(0xff842fb5),
            thickness: 1.0,
          ),
          cardcontent,
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          boxShadow: [
            BoxShadow(
                color: const Color(0x80cacaca),
                offset: Offset(0, -1),
                blurRadius: 16,
                spreadRadius: 2)
          ],
          color: const Color(0xffffffff)),
    );
  }
}
