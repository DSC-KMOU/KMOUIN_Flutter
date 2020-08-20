import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kmouin/screens/DormMenu.dart';
import 'package:kmouin/screens/FifthFloor.dart';
import 'package:kmouin/screens/ThirdFloor.dart';
import '../widgets/TopContainer.dart';
import '../screens/SecondFloor.dart';
import 'dart:ui';

class FacilityPage extends StatefulWidget {
  @override
  _FacilityPageState createState() => _FacilityPageState();
}

class _FacilityPageState extends State<FacilityPage> {
  //열람실 학생수 변수
  int _yulStd_1 = 1;
  int _yulStd_2 = 2;
  int _yulStd_3 = 3;
  int _yulStd_4 = 4;

  @override
  Widget build(BuildContext context) {
    //화면 크기 체크
    //디바이스 너비
    double _widht = MediaQuery.of(context).size.width;
    //디바이스 높이
    double _height = MediaQuery.of(context).size.height;
    //상태바 높이
    double _top = MediaQuery.of(context).padding.top;
    //네비게이션바 높이
    double _bottom = MediaQuery.of(context).padding.bottom;
    double _ht = _height;


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
              width: _widht * (3.7 /100),
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
            height: _ht * (60.1/100),
            width: _widht,
            child: Image.asset('images/FacilityPage/greenback.png',
              fit: BoxFit.fill,),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: _ht * (11.9/100),
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
                height: _ht * (1.8/100),
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
                    height: _ht * (3.57/100),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          setState(() {
                            _yulStd_1 = _yulStd_1 + 1;
                          });
                        },
                        child: Container(
                          width: _widht * (42.7/100),
                          height: _ht * (13.54/100),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(20)
                            ),
                            border: Border.all(
                                color: const Color(0xff5d9023),
                                width: 1),
                            boxShadow: [BoxShadow(
                                color: const
                                Color(0x80cacaca),
                                offset:
                                Offset(0,-1),
                                blurRadius: 16,
                                spreadRadius: 2)],
                            color: const Color(0xffffffff),
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                      "열람실 1",
                                      style: const TextStyle(
                                          color:  const Color(0xff000000),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "NotoSansKR",
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 22.0
                                      )
                                  ),
                                  SizedBox(
                                    width: _widht * (1.1/100),
                                  ),
                                  Container(
                                    height: _ht * (6.52/100),
                                    width: _widht * (10.6/100),
                                    child: Image.asset('images/FacilityPage/book.png'),
                                  )
                                ],
                              ),
                              RichText(
                                  text: TextSpan(
                                      children: [
                                        TextSpan(
                                            style: const TextStyle(
                                                color:  const Color(0xff5d9023),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "NotoSansKR",
                                                fontStyle:  FontStyle.normal,
                                                fontSize: 16.0
                                            ),
                                            text: _yulStd_1.toString()),
                                        TextSpan(
                                            style: const TextStyle(
                                                color:  const Color(0xff5f605f),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "NotoSansKR",
                                                fontStyle:  FontStyle.normal,
                                                fontSize: 16.0
                                            ),
                                            text: "/150석")
                                      ]
                                  )
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: _widht * (4/100),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            _yulStd_2 = _yulStd_2 + 1;
                          });
                        },
                        child: Container(
                          width: _widht * (42.7/100),
                          height: _ht * (13.54/100),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(20)
                            ),
                            border: Border.all(
                                color: const Color(0xff5d9023),
                                width: 1),
                            boxShadow: [BoxShadow(
                                color: const
                                Color(0x80cacaca),
                                offset:
                                Offset(0,-1),
                                blurRadius: 16,
                                spreadRadius: 2)],
                            color: const Color(0xffffffff),
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                      "열람실 2",
                                      style: const TextStyle(
                                          color:  const Color(0xff000000),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "NotoSansKR",
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 22.0
                                      )
                                  ),
                                  SizedBox(
                                    width: _widht * (1.1/100),
                                  ),
                                  Container(
                                    height: _ht * (6.52/100),
                                    width: _widht * (10.6/100),
                                    child: Image.asset('images/FacilityPage/book.png'),
                                  )
                                ],
                              ),
                              RichText(
                                  text: TextSpan(
                                      children: [
                                        TextSpan(
                                            style: const TextStyle(
                                                color:  const Color(0xff5d9023),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "NotoSansKR",
                                                fontStyle:  FontStyle.normal,
                                                fontSize: 16.0
                                            ),
                                            text: _yulStd_2.toString()),
                                        TextSpan(
                                            style: const TextStyle(
                                                color:  const Color(0xff5f605f),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "NotoSansKR",
                                                fontStyle:  FontStyle.normal,
                                                fontSize: 16.0
                                            ),
                                            text: "/150석")
                                      ]
                                  )
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: _ht * (1.84/100),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          setState(() {
                            _yulStd_3 = _yulStd_3 + 1;
                          });
                        },
                        child: Container(
                          width: _widht * (42.7/100),
                          height: _ht * (13.54/100),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(20)
                            ),
                            border: Border.all(
                                color: const Color(0xff5d9023),
                                width: 1),
                            boxShadow: [BoxShadow(
                                color: const
                                Color(0x80cacaca),
                                offset:
                                Offset(0,-1),
                                blurRadius: 16,
                                spreadRadius: 2)],
                            color: const Color(0xffffffff),
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                      "열람실 3",
                                      style: const TextStyle(
                                          color:  const Color(0xff000000),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "NotoSansKR",
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 22.0
                                      )
                                  ),
                                  SizedBox(
                                    width: _widht * (1.1/100),
                                  ),
                                  Container(
                                    height: _ht * (6.52/100),
                                    width: _widht * (10.6/100),
                                    child: Image.asset('images/FacilityPage/book.png'),
                                  )
                                ],
                              ),
                              RichText(
                                  text: TextSpan(
                                      children: [
                                        TextSpan(
                                            style: const TextStyle(
                                                color:  const Color(0xff5d9023),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "NotoSansKR",
                                                fontStyle:  FontStyle.normal,
                                                fontSize: 16.0
                                            ),
                                            text: _yulStd_3.toString()),
                                        TextSpan(
                                            style: const TextStyle(
                                                color:  const Color(0xff5f605f),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "NotoSansKR",
                                                fontStyle:  FontStyle.normal,
                                                fontSize: 16.0
                                            ),
                                            text: "/150석")
                                      ]
                                  )
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: _widht * (4/100),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            _yulStd_4 = _yulStd_4 + 1;
                          });
                        },
                        child: Container(
                          width: _widht * (42.7/100),
                          height: _ht * (13.54/100),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(20)
                            ),
                            border: Border.all(
                                color: const Color(0xff5d9023),
                                width: 1),
                            boxShadow: [BoxShadow(
                                color: const
                                Color(0x80cacaca),
                                offset:
                                Offset(0,-1),
                                blurRadius: 16,
                                spreadRadius: 2)],
                            color: const Color(0xffffffff),
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                      "열람실 4",
                                      style: const TextStyle(
                                          color:  const Color(0xff000000),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "NotoSansKR",
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 22.0
                                      )
                                  ),
                                  SizedBox(
                                    width: _widht * (1.1/100),
                                  ),
                                  Container(
                                    height: _ht * (6.52/100),
                                    width: _widht * (10.6/100),
                                    child: Image.asset('images/FacilityPage/book.png'),
                                  )
                                ],
                              ),
                              RichText(
                                  text: TextSpan(
                                      children: [
                                        TextSpan(
                                            style: const TextStyle(
                                                color:  const Color(0xff5d9023),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "NotoSansKR",
                                                fontStyle:  FontStyle.normal,
                                                fontSize: 16.0
                                            ),
                                            text: _yulStd_4.toString()),
                                        TextSpan(
                                            style: const TextStyle(
                                                color:  const Color(0xff5f605f),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "NotoSansKR",
                                                fontStyle:  FontStyle.normal,
                                                fontSize: 16.0
                                            ),
                                            text: "/150석")
                                      ]
                                  )
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: _ht * (5.5/100),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        //onTap: ,
                        child: Container(
                          width: _widht * (42.7/100),
                          height: _widht * (42.7/100),
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
                                height: _ht * (9.7/100),
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
                        width: _widht * (4/100),
                      ),
                      InkWell(
                        //onTap: ,
                        child: Container(
                          width: _widht * (42.7/100),
                          height: _widht * (42.7/100),
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
                                height: _ht * (9.7/100),
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