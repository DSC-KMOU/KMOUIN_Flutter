import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/EvacuationList.dart';
import 'dart:ui';
import 'package:flutter_statusbar_text_color/flutter_statusbar_text_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EvacuationFacility extends StatefulWidget {
  @override
  _EvacuationFacilityState createState() => _EvacuationFacilityState();
}

class _EvacuationFacilityState extends State<EvacuationFacility> {
  int buttonPushed = 1;
  double widLeft = 0;

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
    double _mapHeight = _width * (217/375);
    Color _appbarFont = Color(0xff000000);

    FlutterStatusbarTextColor.setTextColor(FlutterStatusbarTextColor.dark);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(44.0),
        child: AppBar(
          centerTitle: false,
          titleSpacing: -6.0,
          backgroundColor: Colors.white,
          elevation: 1.0,
          automaticallyImplyLeading: false,
          title: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: FlatButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(44.0)),
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    },);
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
                            color:  _appbarFont,
                          ),
                          Text(
                            "시설",
                            style: TextStyle(
                              //color: Colors.transparent,
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontFamily: "NotoSansKR",
                              fontStyle: FontStyle.normal,
                              fontSize: ScreenUtil().setSp(18),
                              wordSpacing: 0.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ),
              Center(
                child: Container(
                  child: Text(
                      "대피시설 및 지도",
                      style: TextStyle(
                          color:  _appbarFont,
                          fontWeight: FontWeight.w600,
                          fontFamily: "NotoSansKR",
                          fontStyle:  FontStyle.normal,
                          fontSize: ScreenUtil().setSp(18)
                      ),
                      textAlign: TextAlign.center,
                  ),
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
          Stack(
            children: <Widget>[
              new Image(
                image: AssetImage("images/map/campusmap.png"),
                fit: BoxFit.cover,
              ),
              Positioned(
                left: _width * (60 / 100),
                top: _mapHeight * (24.4 / 100),
                child: Container(
                  width: _width*(36/100),
                  child: _bildZone(buttonPushed, 1),
                ),
              ),

              //A지역 버튼
              Positioned(
                left: _width * (68 / 100),
                top: _mapHeight * (24.4 / 100),
                width: _width * (16 / 100),
                height: _mapHeight * (34/ 100),
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
                top: _mapHeight * (52.5 / 100),
                child: Container(
                  width: _width*(33/100),
                  child: _bildZone(buttonPushed, 2),
                ),
              ),

              //B지역 버튼
              Positioned(
                left: _width * (53 / 100),
                top: _mapHeight * (56 / 100),
                width: _width * (13 / 100),
                height: _mapHeight * (21/ 100),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      buttonPushed = 2;
                    });
                  },
                ),
              ),
              Positioned(
                left: _width * (58 / 100),
                top: _mapHeight * (64 / 100),
                width: _width * (13 / 100),
                height: _mapHeight * (21/ 100),
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
                top: _mapHeight * (17.5 / 100),
                child: Container(
                  width: _width*(29/100),
                  child: _bildZone(buttonPushed, 3),
                ),
              ),

              //C지역 버튼
              Positioned(
                left: _width * (47 / 100),
                top: _mapHeight * (20 / 100),
                width: _width * (13 / 100),
                height: _mapHeight * (30/ 100),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      buttonPushed = 3;
                    });
                  },
                ),
              ),

              Positioned(
                left: _width * (19 / 100),
                top: _mapHeight * (28.1 / 100),

                child: Container(
                  width: _width*(32/100),
                  child: _bildZone(buttonPushed, 4),
                ),
              ),

              //D지역 버튼
              Positioned(
                left: _width * (20 / 100),
                top: _mapHeight * (32 / 100),
                width: _width * (12 / 100),
                height: _mapHeight * (25/ 100),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      buttonPushed = 4;
                    });
                  },
                ),
              ),
              Positioned(
                left: _width * (31 / 100),
                top: _mapHeight * (40 / 100),
                width: _width * (12 / 100),
                height: _mapHeight * (25/ 100),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      buttonPushed = 4;
                    });
                  },
                ),
              ),

              Positioned(
                left: _width * (9 / 100),
                top: _mapHeight * (7.8 / 100),
                child: Container(
                  width: _width*(38/100),
                  child: _bildZone(buttonPushed, 5),
                ),
              ),
              //E지역 버튼
              Positioned(
                left: _width * (15 / 100),
                top: _mapHeight * (7.8 / 100),
                width: _width * (28 / 100),
                height: _mapHeight * (20/ 100),
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
            style: TextStyle(
                color:  const Color(0xff727272),
                fontWeight: FontWeight.w500,
                fontFamily: "NotoSansKR",
                fontStyle:  FontStyle.normal,
                fontSize: ScreenUtil().setSp(14)
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
    List<String> tempList = ['a', 'b', 'c', 'd', 'e'];
    if (num == loNum)
      return Image(
        image: AssetImage("images/map/" + tempList[loNum - 1] + "Zone@3x.png"),
        fit: BoxFit.fitWidth,
      );
    else
      return Image(
        image: AssetImage("images/map/" + tempList[loNum - 1] + "@3x.png"),
        fit: BoxFit.fitWidth,
      );
  }
}