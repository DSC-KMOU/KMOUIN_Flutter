import 'package:flutter/material.dart';
import 'Dart:ui';

class SecondFloor extends StatefulWidget {
  @override
  _SecondFloorState createState() => _SecondFloorState();
}

class _SecondFloorState extends State<SecondFloor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Opacity(
              opacity: 0.5,
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0x80d1d1d1),
                        offset: Offset(0, 1),
                        blurRadius: 0,
                        spreadRadius: 0),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 14,
                    ),
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
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 17,
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
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                        SizedBox(
                        height: 68,
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
                      //점심
                      Container(
                        padding: EdgeInsets.all(16),
                        width: 355,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(18)),
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
                            Text("점심",
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
                            height: 34,
                          ),
                          //저녁
                          Container(
                            padding: EdgeInsets.all(16),
                            width: 355,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(18)),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x80cacaca),
                                  offset: Offset(0, -1),
                                  blurRadius: 16,
                                  spreadRadius: 2,
                                ),
                              ],
                              color: const Color(0xffffffff),
                            ),
                            child: Column(
                              children: <Widget>[
                                Text("저녁",
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
                            height: 34,
                          ),
                          //일품식
                          Container(
                            padding: EdgeInsets.all(16),
                            width: 355,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x80cacaca),
                                  offset: Offset(0, -1),
                                  blurRadius: 16,
                                  spreadRadius: 2,
                                ),
                              ],
                              color: const Color(0xffffffff),
                            ),
                            child: Column(
                              children: <Widget>[
                                Text("일품식",
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
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}