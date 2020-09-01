import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/TopContainer.dart';
import 'widgets/mainPageData.dart';
import 'widgets/mainCategory.dart';
import 'widgets/mainIcon.dart';
import 'package:kmouin/screens/ErrorAndDev.dart';
import 'package:flutter_statusbar_text_color/flutter_statusbar_text_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarTextColor.setTextColor(FlutterStatusbarTextColor.dark);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '해대인',
      home: MyHomePage(title: 'Flutter KMOUIN'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void scopeOut() {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void pagePop(int i) {
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => subpage[i],
      ),
    );
  }

  Widget build(BuildContext context) {
    int _connect = 0;

    double _mainWidth = MediaQuery.of(context).size.width;
    double _mainHeight = MediaQuery.of(context).size.height;
    double _backgroundHeight = _mainHeight * (33.0 / 100);
    double _backgroundHeight2 = _mainHeight * (50.0 / 100);
    double _titleLeftBorder = _mainWidth * (8.0 / 100);
    double _sideBorder = _mainWidth * (6.0 / 100);
    double _logoSize = _mainWidth * (14.4 / 100);
    double _searchHeight = _mainHeight * (6.5 / 100);
    double _searchPadding = _searchHeight * (22.7/100);

    ScreenUtil.init(context,width: _mainWidth,height: _mainHeight ,allowFontScaling: false);

    return GestureDetector(
      onTap: () {
        scopeOut();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            TopContainer(
              child: Image.asset(
                'images/frontPage/background@3x.png',
                fit: BoxFit.fill,
                height: _backgroundHeight2,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                            top: _mainHeight * (8.0 / 100),
                          ),
                          child: Text(
                            "해양대 정보 창구",
                            style: TextStyle(
                              color: Color(0xffffffff),
                              letterSpacing: -0.5,
                              fontWeight: FontWeight.w300,
                              fontFamily: "NotoSansKR",
                              fontStyle: FontStyle.normal,
                              fontSize: ScreenUtil().setSp(24.0),
//                              fontSize: 24.0,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: _backgroundHeight * (5.0 / 100),
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                  bottom: _backgroundHeight * (2.1 / 100),
                                ),
                                child: Text(
                                  "해대인",
                                  style: TextStyle(
                                    color: Color(0xfff1f1f1),
                                    letterSpacing: -0.5,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "NotoSansKR",
                                    fontStyle: FontStyle.normal,
                                    fontSize: ScreenUtil().setSp(32.0),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                width: _logoSize,
                                margin: EdgeInsets.only(
                                  left: _mainWidth * (4.5 / 100),
                                ),
                                child: Image.asset(
                                  'images/frontPage/newLogo@3x.png',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5.0,),
                          margin: EdgeInsets.fromLTRB(
                            _sideBorder,
                            _sideBorder,
                            _sideBorder,
                            _sideBorder,
                          ),
                          width: _mainWidth * (86.4 / 100),
                          height: 48, //높이 조절해야함 _ 상대말고 고정!
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius:
                                BorderRadius.all(Radius.circular(_searchHeight)),
                            border: Border.all(
                                color: const Color(0xffffffff), width: 1),
                            boxShadow: [
                              BoxShadow(
                                  color: const Color(0x80cacaca),
                                  offset: Offset(0, -1),
                                  blurRadius: 16,
                                  spreadRadius: 2),
                            ],
                          ),
                          child: Row(
                            children: <Widget>[
                              IconButton(
//                                onPressed: (){
//                                  Navigator.push(
//                                    context,
//                                    MaterialPageRoute(
//                                      builder: (context) => subpage[_connect],
//                                    ),
//                                  );
//                                },
                                icon: Icon(Icons.search, color: Color(0xff307ac6),),
                                color: Color(0xff307ac6),
                              ),
                              Flexible(
                                child: Center(
                                  child: TextField(
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '키워드 검색',
                                      suffixIcon: IconButton(
                                        onPressed: () => _controller.clear(),
                                        icon: Center(child: Icon(Icons.clear)),
                                      ),
                                    ),
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "NotoSansKR",
                                      fontStyle: FontStyle.normal,
                                      fontSize: ScreenUtil().setSp(14.0),
                                    ),
                                    cursorColor: Colors.blueAccent,
                                    controller: _controller,
                                    onSubmitted: (String value) async {
                                      for (int i = 0; i < keywords.length; i++) {
                                        if (value.toString() ==
                                            keywords[i].toString()) {
                                          _connect = i;
                                          _controller.clear();
                                          return pagePop(i);
                                        }
                                      }
                                      await showDialog<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return CupertinoAlertDialog(
                                            title: Text('죄송합니다',
                                              style: TextStyle(fontSize: ScreenUtil().setSp(14)),
                                            ),
                                            content: Column(
                                              children: [
                                                Text(
                                                    '"$value"(이)라는 키워드가 없습니다. \n',
                                                  style: TextStyle(fontSize: ScreenUtil().setSp(14)),
                                                ),
                                                Text(
                                                  "[키워드] \n 통근 / 통근버스 \n 2층 (2) / 3층 (3) / 5층 (5) \n 교직원 / 기숙사 / 생활관 \n 지도 / 대피시설 / 대피 \n 개발 / 개발자 / 개발자 정보",
                                                  style: TextStyle(fontSize: ScreenUtil().setSp(14)),
                                                ),
                                              ],
                                            ),
                                            actions: <Widget>[
                                              FlatButton(
                                                onPressed: () {
                                                  _controller.clear();
                                                  Navigator.pop(context);
                                                },
                                                child: Text('OK',
                                                  style: TextStyle(fontSize: ScreenUtil().setSp(14)),),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ), //상단 타이틀 및 검색바 부분
                Flexible(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: CategoryCards(
                          logoContainer: IconContainer(
                            backImage: Image.asset(
                              'images/frontPage/ovalBus@3x.png',
                            ),
                            iconImage: Image.asset(
                              'images/frontPage/bus@3x.png',
                            ),
                          ),
                          containerTitle: '버스 정보',
                          containerDescription: '#셔틀 #190번 #통학',
                          order: 1,
                        ),
                      ),
                      Flexible(
                        child: CategoryCards(
                          logoContainer: IconContainer(
                            backImage: Image.asset(
                              'images/frontPage/ovalMeal@3x.png',
                            ),
                            iconImage: Image.asset(
                              'images/frontPage/meal@3x.png',
                            ),
                          ),
                          containerTitle: '식단 정보',
                          containerDescription: '#2층 #3층 #5층 #기숙사',
                          order: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: CategoryCards(
                          logoContainer: IconContainer(
                            backImage: Image.asset(
                              'images/frontPage/ovalFacil@3x.png',
                            ),
                            iconImage: Image.asset(
                              'images/frontPage/facility@3x.png',
                            ),
                          ),
                          containerTitle: '시설 정보',
                          containerDescription: '#열람실 #편의 #지도',
                          order: 3,
                        ),
                      ),
                      Flexible(
                        child: CategoryCards(
                          logoContainer: IconContainer(
                            backImage: Image.asset(
                              'images/frontPage/ovalSched@3x.png',
                            ),
                            iconImage: Image.asset(
                              'images/frontPage/sched@3x.png',
                            ),
                          ),
                          containerTitle: '학사 일정',
                          containerDescription: '#시험 #개학 #방학',
                          order: 4,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Center(
                    child: FlatButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      onPressed: () {
                        scopeOut();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ErrorAndDev(),
                          ),
                        );
                      },
                      child: Text("오류 제보 및 개발자",
                          style: TextStyle(
                              color: Color(0xff2c6ec4),
                              fontWeight: FontWeight.w500,
                              fontFamily: "NotoSansKR",
                              fontStyle: FontStyle.normal,
                              fontSize: ScreenUtil().setSp(16.0),),
                          textAlign: TextAlign.center),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
