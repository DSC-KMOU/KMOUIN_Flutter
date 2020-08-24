import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/EvacuationList.dart';
import 'dart:ui';
import 'package:flutter_statusbar_text_color/flutter_statusbar_text_color.dart';

class EvacuationFacility extends StatefulWidget {
  @override
  _EvacuationFacilityState createState() => _EvacuationFacilityState();
}

class _EvacuationFacilityState extends State<EvacuationFacility> {
  int buttonPushed = 1;

  @override
  Widget build(BuildContext context) {
    //화면 크기 체크
    //디바이스 너비
    double _width = MediaQuery
        .of(context)
        .size
        .width;
    //디바이스 높이
    double _height = MediaQuery
        .of(context)
        .size
        .height;
    //상태바 높이
    double _naviTop = MediaQuery
        .of(context)
        .padding
        .top;
    //네비게이션바 높이
    double _bottom = MediaQuery
        .of(context)
        .padding
        .bottom;
    double _screenHeight = _height - _naviTop;

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
                      color: const Color(0xff000000),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: _screenHeight * (6.8 / 100),
          ),
          Center(
            child: Container(
              child: Text(
                  "대피시설 및 지도",
                  //buttonPushed.toString(),
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w500,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0
                  ),
                  textAlign: TextAlign.center
              ),
            ),
          ),
          SizedBox(
            height: _screenHeight * (0.6 / 100),
          ),
          Stack(
            children: <Widget>[
              new Image(
                image: AssetImage("images/map/campusmap.png"),
                fit: BoxFit.cover,
              ),
              Positioned(
                left: _width * (61 / 100),
                top: _screenHeight * (7.8 / 100),
                child: Container(
                  //child: Image(image: _a),
                  child: _bildZone(buttonPushed, 1),
                ),
              ),
              //A지역 버튼
              Positioned(
                left: _width * (70 / 100),
                top: _screenHeight * (12 / 100),
                width: 50,
                height: 50,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      buttonPushed = 1;
                    });
                  },
                ),
              ),
              Positioned(
                left: _width * (47.5 / 100),
                top: _screenHeight * (16 / 100),
                child: Container(
                  //child: Image(image: _a),
                  child: _bildZone(buttonPushed, 2),
                ),
              ),
              //B지역 버튼
              Positioned(
                left: _width * (55 / 100),
                top: _screenHeight * (17 / 100),
                width: 50,
                height: 50,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      buttonPushed = 2;
                    });
                  },
                ),
              ),
              Positioned(
                left: _width * (40 / 100),
                top: _screenHeight * (6 / 100),
                child: Container(
                  child: _bildZone(buttonPushed, 3),
                ),
              ),
              //C지역 버튼
              Positioned(
                left: _width * (48 / 100),
                top: _screenHeight * (8 / 100),
                width: 50,
                height: 50,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      buttonPushed = 3;
                    });
                  },
                ),
              ),
              Positioned(
                left: _width * (20 / 100),
                top: _screenHeight * (9 / 100),

                child: Container(
                  child: _bildZone(buttonPushed, 4),
                ),
              ),
              //D지역 버튼
              Positioned(
                left: _width * (28 / 100),
                top: _screenHeight * (12 / 100),
                width: 50,
                height: 50,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      buttonPushed = 4;
                    });
                  },
                ),
              ),
              Positioned(
                left: _width * (11 / 100),
                top: _screenHeight * (3 / 100),
                child: Container(
                  child: _bildZone(buttonPushed, 5),
                ),
              ),
              //E지역 버튼
              Positioned(
                left: _width * (29 / 100),
                top: _screenHeight * (3 / 100),
                width: 50,
                height: 50,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      buttonPushed = 5;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: _screenHeight * (1.3 / 100),
          ),
          Text(
            "<한국해양대학교 지도>",
            style: const TextStyle(
                color:  const Color(0xff727272),
                fontWeight: FontWeight.w500,
                fontFamily: "NotoSansKR",
                fontStyle:  FontStyle.normal,
                fontSize: 14.0
            ), //textAlign: TextAlign.center
          ),
          EvacuationList(
            num: buttonPushed,
            screenHeight: _screenHeight,
            width: _width,
          )
        ],
      ),
    );
  }

  Widget _bildZone(num, loNum) {
    var temp = 'a';
    List<String> tempList = ['a', 'b', 'c', 'd', 'e'];
    switch (num) {
      case 1:
        temp = 'a';
        break;
      case 2:
        temp = 'b';
        break;
      case 3:
        temp = 'c';
        break;
      case 4:
        temp = 'd';
        break;
      case 5:
        temp = 'e';
        break;
    }
    if (num == loNum)
      return Image(
        image: AssetImage("images/map/" + temp + "Zone.png"),
      );
    else
      return Image(
        image: AssetImage("images/map/" + tempList[loNum - 1] + ".png"),
      );
  }
}