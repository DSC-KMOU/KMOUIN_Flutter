import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Dart:ui';

class DormMenu extends StatefulWidget {
  @override
  _DormMenuState createState() => _DormMenuState();
}

class _DormMenuState extends State<DormMenu> {
  @override
  Widget build(BuildContext context) {
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
                  SizedBox(
                    width: 20,
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
                              color:  const Color(0xffeb577c),
                              fontWeight: FontWeight.w500,
                              fontFamily: "NotoSansKR",
                              fontStyle:  FontStyle.normal,
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
                      //아침
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
                            Text("아침",
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
                      //점심
                      Container(
                        padding: EdgeInsets.all(16),
                        width: 355,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
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
                          borderRadius: BorderRadius.all(Radius.circular(18)),
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
}
