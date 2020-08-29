import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kmouin/widgets/ErrorContainer.dart';
import 'package:flutter_statusbar_text_color/flutter_statusbar_text_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorAndDev extends StatefulWidget {
  @override
  _ErrorAndDevState createState() => _ErrorAndDevState();
}

class _ErrorAndDevState extends State<ErrorAndDev> {
  @override
  Widget build(BuildContext context) {
    double _mainWidth = MediaQuery.of(context).size.width;
    double _mainHeight = MediaQuery.of(context).size.height;
    FlutterStatusbarTextColor.setTextColor(FlutterStatusbarTextColor.dark);
    Color _appbarFont = Color(0xff5b9fee);

    ScreenUtil.init(context,width: _mainWidth,height: _mainHeight ,allowFontScaling: false);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(44.0),
        child: AppBar(
          centerTitle: false,
          titleSpacing: -6.0,
          backgroundColor: Colors.white,
          elevation: 1.0,
          automaticallyImplyLeading: false,
          title: Align(
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
                      "메인",
                      style: TextStyle(
                        color: _appbarFont,
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
      ),
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    child: FlatButton(
                      padding: EdgeInsets.all(0.0),
                      child: ErrorContainer(
                        imageName: 'error',
                        reportTitle: '오류제보',
                        reportDescription: '버그나 피드 부탁드립니다!',
                        url: 'https://docs.google.com/forms/d/e/1FAIpQLSdAxdRIV-3rwbN9P36nrP-VGgA0aPYSgVt0vEL8JYeY8TtIdA/viewform?usp=send_form',
                      ),
                    ),
                  ),
                  ErrorContainer(
                    imageName: 'survey',
                    reportTitle: '설문조사 (준비중)',
                    reportDescription: '앱의 발전을 위해 힘쓰겠습니다!',
                    //url: 'http://www.naver.com',
                  ),
                  ErrorContainer(
                    imageName: 'DevTeam',
                    reportTitle: '개발자 정보 (준비중)',
                    reportDescription: '사용해주셔서 감사합니다!',
                  ),
                  ErrorContainer(
                    imageName: 'survey',
                    reportTitle: '아치신문고',
                    reportDescription: '해양대 아치신문고로 연결됩니다',
                    url: 'http://www.kmou.ac.kr/kmou/na/ntt/selectNttList.do?mi=3911&bbsId=10873#sideContent',
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 55.0,),
                child: Text('< Copyright 2020. DSC_KMOU. All right reserved. >',
                    style: TextStyle(
                        color: Color(0xff828282),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: ScreenUtil().setSp(14.0)),
                    textAlign: TextAlign.center),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
