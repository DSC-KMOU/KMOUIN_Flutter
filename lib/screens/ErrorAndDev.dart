import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kmouin/widgets/ErrorContainer.dart';
import 'package:flutter_statusbar_text_color/flutter_statusbar_text_color.dart';

class ErrorAndDev extends StatefulWidget {
  @override
  _ErrorAndDevState createState() => _ErrorAndDevState();
}

class _ErrorAndDevState extends State<ErrorAndDev> {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarTextColor.setTextColor(FlutterStatusbarTextColor.dark);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: -3,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 1.0,
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
                    color: Color(0xff2c6ec4),
                  ),
                  Text(
                    " 메인",
                    style: TextStyle(
                      color: Color(0xff2c6ec4),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 18.0,
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
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: 26.0,
                ),
                child: FlatButton(
                  padding: EdgeInsets.all(0.0),
                  child: ErrorContainer(
                    imageName: 'error',
                    reportTitle: '오류제보',
                    reportDescription: '버그나 피드 부탁드립니다!',
                    url: 'http://kmou.ac.kr',
                  ),
                ),
              ),
              ErrorContainer(
                imageName: 'survey',
                reportTitle: '설문조사',
                reportDescription: '앱의 발전을 위해 힘쓰겠습니다!',
                url: 'http://www.naver.com',
              ),
              ErrorContainer(
                imageName: 'DevTeam',
                reportTitle: '개발자 정보',
                reportDescription: '사용해주셔서 감사합니다!',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
