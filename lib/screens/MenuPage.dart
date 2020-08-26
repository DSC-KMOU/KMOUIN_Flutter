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
    double _mainWidth = MediaQuery.of(context).size.width;
    double _mainHeight = MediaQuery.of(context).size.height;
    double _backgroundSize = _mainHeight * (47.7 / 100);
    double _topMargin = _backgroundSize * (28.9 / 100);
    double _titleMargin = _backgroundSize * (2.8 / 100);
    double _containerMargin = _mainHeight * (38.2 / 100);
    double _containerSize = _mainWidth * (42.7 / 100);
    double _containerTitle = _containerSize * (20.6 / 100);
    double _containerIcon = _mainWidth * (11.7 / 100);
    double _containerInner = _containerSize * (10.6 / 100);
    double _containerBetween = _mainWidth * (2.0 / 100);

    FlutterStatusbarTextColor.setTextColor(FlutterStatusbarTextColor.dark);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:
      PreferredSize(
        preferredSize: Size.fromHeight(44.0),
        child: AppBar(
          centerTitle: false,
          titleSpacing: -5,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Container(
            margin: EdgeInsets.only(left: 5.0),
            child: FlatButton(
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
                    color:  const Color(0xffffffff),
                  ),
                  Text(
                    "메인",
                    style: TextStyle(
                      color: Color(0xffffffff),
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
                height: _topMargin,
              ),
              Container(
                padding: EdgeInsets.only(left: _titleMargin * 3),
                child: Text(
                  '오늘은 몇 층에서\n드시겠어요?',
                  style: const TextStyle(
                    color: const Color(0xffffffff),
                    letterSpacing: -0.5,
                    fontWeight: FontWeight.w500,
                    fontFamily: "NotoSansKR",
                    fontStyle: FontStyle.normal,
                    fontSize: 32.0,
                  ),
                ),
              ),
              SizedBox(
                height: _titleMargin,
              ),
              Container(
                padding: EdgeInsets.only(left: _titleMargin * 3),
                child: Text(
                  '각 층마다 메뉴가 다르게 나와요',
                  style: const TextStyle(
                    color: const Color(0xffffffff),
                    letterSpacing: -0.5,
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
                height: _containerMargin,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(_containerBetween),
                    width: _containerSize,
                    height: _containerSize,
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
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: _containerTitle),
                              width: _containerIcon,
                              child: Image.asset(
                                'images/MenuPage/second_imoji.png',
                              ),
                            ),
                            SizedBox(
                              height: _containerInner,
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
                  Container(
                    margin: EdgeInsets.all(_containerBetween),
                    width: _containerSize,
                    height: _containerSize,
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
                            builder: (context) => ThirdFloor(),
                          ),
                        );
                      },
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: _containerTitle),
                              width: _containerIcon,
                              child: Image.asset(
                                'images/MenuPage/three_imoji.png',
                              ),
                            ),
                            SizedBox(
                              height: _containerInner,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(_containerBetween),
                    width: _containerSize,
                    height: _containerSize,
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
                            builder: (context) => FifthFloor(),
                          ),
                        );
                      },
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: _containerTitle),
                              width: _containerIcon,
                              child: Image.asset(
                                'images/MenuPage/five_imoji.png',
                              ),
                            ),
                            SizedBox(
                              height: _containerInner,
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
                  Container(
                    margin: EdgeInsets.all(_containerBetween),
                    width: _containerSize,
                    height: _containerSize,
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
                            builder: (context) => DormMenu(),
                          ),
                        );
                      },
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: _containerTitle),
                              width: _containerIcon,
                              child: Image.asset(
                                'images/MenuPage/dorm_imoji.png',
                              ),
                            ),
                            SizedBox(
                              height: _containerInner,
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
