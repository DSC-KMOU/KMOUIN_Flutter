import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kmouin/screens/DormMenu.dart';
import 'package:kmouin/screens/FifthFloor.dart';
import 'package:kmouin/screens/ThirdFloor.dart';
import '../widgets/TopContainer.dart';
import '../screens/SecondFloor.dart';
import 'dart:ui';
import 'package:flutter_statusbar_text_color/flutter_statusbar_text_color.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarTextColor.setTextColor(FlutterStatusbarTextColor.dark);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(47.0),
        child: AppBar(
          centerTitle: false,
          titleSpacing: -5,
          backgroundColor: Colors.white.withOpacity(0.0),
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
                      CupertinoIcons.back,
                      color: Colors.white,
                    ),
                    Text(
                      " 메인",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 18.0,
                        wordSpacing: -5.0,
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
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          //배경
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: TopContainer(
              child: Image.asset(
                'images/MenuPage/bg_image.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 112,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(34, 0, 0, 0),
                child: Text(
                  '오늘은 몇 층에서\n드시겠어요?',
                  style: const TextStyle(
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 32.0),
                ),
              ),
              SizedBox(
                height: 11,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(34, 0, 0, 0),
                child: Text(
                  '각 층마다 메뉴가 다르게 나와요',
                  style: const TextStyle(
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w300,
                    fontFamily: "NotoSansKR",
                    fontStyle: FontStyle.normal,
                    fontSize: 22.0,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 310,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0x80cacaca),
                            offset: Offset(0, -1),
                            blurRadius: 16,
                            spreadRadius: 2),
                      ],
                      color: const Color(0xffffffff),
                    ),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SecondFloor(),
                          ),
                        );
                      },
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 49,
                              height: 66,
                              padding: EdgeInsets.only(
                                left: 7,
                                right: 7,
                              ),
                              child: Image.asset(
                                'images/MenuPage/second_imoji.png',
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              '2층 학식',
                              style: const TextStyle(
                                  color: const Color(0xff131415),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "NotoSansKR",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 26.0),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '오늘은 무슨 메뉴일까?',
                              style: const TextStyle(
                                  color: const Color(0xff5f605f),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "NotoSansKR",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.0),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
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
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ThirdFloor(),
                          ),
                        );
                      },
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 66,
                              width: 49,
                              child: Image.asset(
                                'images/MenuPage/three_imoji.png',
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              '3층 학식',
                              style: const TextStyle(
                                  color: const Color(0xff131415),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "NotoSansKR",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 26.0),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '천원의 아침만 바뀌어요!',
                              style: const TextStyle(
                                color: const Color(0xff5f605f),
                                fontWeight: FontWeight.w500,
                                fontFamily: "NotoSansKR",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
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
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FifthFloor(),
                          ),
                        );
                      },
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 66,
                              width: 49,
                              child: Image.asset(
                                'images/MenuPage/five_imoji.png',
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              '5층 학식',
                              style: const TextStyle(
                                  color: const Color(0xff131415),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "NotoSansKR",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 26.0),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '교직원 식당입니다!',
                              style: const TextStyle(
                                  color: const Color(0xff5f605f),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "NotoSansKR",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.0),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
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
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DormMenu(),
                          ),
                        );
                      },
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 66,
                              width: 49,
                              child: Image.asset(
                                'images/MenuPage/dorm_imoji.png',
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              '기숙사식',
                              style: const TextStyle(
                                  color: const Color(0xff131415),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "NotoSansKR",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 26.0),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '기숙사생들을 위한 식단!',
                              style: const TextStyle(
                                  color: const Color(0xff5f605f),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "NotoSansKR",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.0),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
