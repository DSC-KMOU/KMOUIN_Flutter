import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/FacilityLibButton.dart';
import 'dart:ui';
import 'package:flutter_statusbar_text_color/flutter_statusbar_text_color.dart';

class FacilityPage extends StatefulWidget {
  @override
  _FacilityPageState createState() => _FacilityPageState();
}

class _FacilityPageState extends State<FacilityPage> {
  //열람실 학생수 변수
  int _stdRoomNum_1 = 1;
  int _stdRoomNum_2 = 2;
  int _stdRoomNum_3 = 3;
  int _stdRoomNum_4 = 4;

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarTextColor.setTextColor(FlutterStatusbarTextColor.dark);
    //화면 크기 체크
    //디바이스 너비
    double _width = MediaQuery.of(context).size.width;
    //디바이스 높이
    double _height = MediaQuery.of(context).size.height;
    //상태바 높이
    double _naviTop = MediaQuery.of(context).padding.top;
    //네비게이션바 높이
    double _bottom = MediaQuery.of(context).padding.bottom;
    double _screenHeight = _height;


    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: -15,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: <Widget>[
            SizedBox(
              width: _width * (3.7 /100),
            ),
            Container(
              width: 100,
              child: FlatButton(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.navigate_before,
                      color: const Color(0xffffffff),
                    ),
                    Text(
                      "메인",
                      style: const TextStyle(
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Container(
            height: _screenHeight * (60.1/100),
            width: _width,
            child: Image.asset('images/FacilityPage/greenback.png',
              fit: BoxFit.fill,),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: _screenHeight * (11.9/100),
              ),
              Center(
                child: Container(
                  child: Text(
                    "오늘은 어디서 공부하지?",
                    style: const TextStyle(
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                        fontFamily: "NotoSansKR",
                        fontStyle:  FontStyle.normal,
                        fontSize: 30.0
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: _screenHeight * (1.8/100),
              ),
              Center(
                child: Container(
                  child: Text(
                    "다른 시설도 확인해봐요",
                    //_ht.toString(),
                    style: const TextStyle(
                        color:  const Color(0xffffffff),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle:  FontStyle.normal,
                        fontSize: 22.0
                    ),
                  ),
                ),
              ),

              Column(
                children: <Widget>[
                  SizedBox(
                    height: _screenHeight * (3.57/100),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          setState(() {
                            _stdRoomNum_1 = _stdRoomNum_1 + 1;
                          });
                        },
                        child: LibButton(
                          num: 1,
                          stdRoomNum: _stdRoomNum_1,
                          screenWidth: _width,
                          screenHeight: _screenHeight,
                        ),
                      ),
                      SizedBox(
                        width: _width * (4/100),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            _stdRoomNum_2 = _stdRoomNum_2 + 1;
                          });
                        },
                        child: LibButton(
                          num: 2,
                          stdRoomNum: _stdRoomNum_2,
                          screenWidth: _width,
                          screenHeight: _screenHeight,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: _screenHeight * (1.84/100),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          setState(() {
                            _stdRoomNum_3 = _stdRoomNum_3 + 1;
                          });
                        },
                        child: LibButton(
                          num: 3,
                          stdRoomNum: _stdRoomNum_3,
                          screenWidth: _width,
                          screenHeight: _screenHeight,
                        ),
                      ),
                      SizedBox(
                        width: _width * (4/100),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            _stdRoomNum_4 = _stdRoomNum_4 + 1;
                          });
                        },
                        child: LibButton(
                          num: 4,
                          stdRoomNum: _stdRoomNum_4,
                          screenWidth: _width,
                          screenHeight: _screenHeight,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: _screenHeight * (5.5/100),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        //onTap: ,
                        child: Container(
                          width: _width * (42.7/100),
                          height: _width * (42.7/100),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20)
                              ),
                              boxShadow: [BoxShadow(
                                  color: const Color(0x80cacaca),
                                  offset: Offset(0,-1),
                                  blurRadius: 16,
                                  spreadRadius: 2
                              )] ,
                              color: Colors.white
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: _screenHeight * (9.7/100),
                                child: Image.asset('images/FacilityPage/coffee.png'),
                              ),
                              Text(
                                  "편의 시설",
                                  style: const TextStyle(
                                      color:  const Color(0xff131415),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "NotoSansKR",
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 24.0
                                  ),
                                  textAlign: TextAlign.center
                              ),
                              Text(
                                  "편의점, 카페 등 복지시설",
                                  style: const TextStyle(
                                      color:  const Color(0xff5f605f),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "NotoSansKR",
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 12.0
                                  ),
                                  textAlign: TextAlign.center
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: _width * (4/100),
                      ),
                      InkWell(
                        //onTap: ,
                        child: Container(
                          width: _width * (42.7/100),
                          height: _width * (42.7/100),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20)
                              ),
                              boxShadow: [BoxShadow(
                                  color: const Color(0x80cacaca),
                                  offset: Offset(0,-1),
                                  blurRadius: 16,
                                  spreadRadius: 2
                              )] ,
                              color: Colors.white
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: _screenHeight * (9.7/100),
                                child: Image.asset('images/FacilityPage/sos.png'),
                              ),
                              Text(
                                  "대피 시설",
                                  style: const TextStyle(
                                      color:  const Color(0xff131415),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "NotoSansKR",
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 24.0
                                  ),
                                  textAlign: TextAlign.center
                              ),
                              Text(
                                  "대피로",
                                  style: const TextStyle(
                                      color:  const Color(0xff5f605f),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "NotoSansKR",
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 12.0
                                  ),
                                  textAlign: TextAlign.center
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}