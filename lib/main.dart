import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/TopContainer.dart';
import 'widgets/mainPageData.dart';
import 'widgets/mainCategory.dart';
import 'widgets/mainIcon.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          TopContainer(
            child: Image.asset(
              'images/frontPage/background@3x.png',
              fit: BoxFit.fill,
              height: 285.0,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 66.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(34.0, 0.0, 0.0, 10.0),
                              child: Text(
                                "안녕하세요!",
                                style: const TextStyle(
                                    color: const Color(0xfff1f1f1),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "NotoSansKR",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 34.0),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              height: 45.0,
                              width: 45.0,
                              margin: EdgeInsets.only(
                                left: 15.0,
                              ),
                              child: Image.asset(
                                'images/frontPage/copy2@3x.png',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 34.0),
                        child: Text(
                          "해대인에 오신걸 환영합니다",
                          style: const TextStyle(
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w300,
                              fontFamily: "NotoSansKR",
                              fontStyle: FontStyle.normal,
                              fontSize: 22.0),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      // Rectangle Copy 11
                      Container(
                        padding: EdgeInsets.all(10.0),
                        margin: EdgeInsets.fromLTRB(26.0, 26.0, 25.0, 45.0),
                        width: 324,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.all(Radius.circular(23)),
                          border: Border.all(
                              color: const Color(0xffffffff), width: 2),
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0x80cacaca),
                                offset: Offset(0, -1),
                                blurRadius: 16,
                                spreadRadius: 2),
                          ],
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.search,
                            color: Color(0xff307ac6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ), //상단 타이틀 및 검색바 부분
              Flexible(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: CategoryCards(
                        logoContainer: IconContainer(
                          startingColor: color1,
                          endingColor: color2,
                          iconImage: Image.asset('images/frontPage/bus@3x.png'),
                        ),
                        containerTitle: '버스 정보',
                        containerDescription: '버스 언제 출발하지..',
                        order: 1,
                      ),
                    ),
                    Flexible(
                      child: CategoryCards(
                        logoContainer: IconContainer(
                          startingColor: color3,
                          endingColor: color4,
                          iconImage:
                              Image.asset('images/frontPage/meal@3x.png'),
                        ),
                        containerTitle: '식단 정보',
                        containerDescription: '오늘 뭐 먹지..',
                        order: 2,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: CategoryCards(
                        logoContainer: IconContainer(
                          startingColor: color5,
                          endingColor: color6,
                          iconImage:
                              Image.asset('images/frontPage/facility@3x.png'),
                        ),
                        containerTitle: '시설 정보',
                        containerDescription: '도서관에 자리가 있나..',
                        order: 3,
                      ),
                    ),
                    Flexible(
                      child: CategoryCards(
                        logoContainer: IconContainer(
                          startingColor: color7,
                          endingColor: color8,
                          iconImage:
                              Image.asset('images/frontPage/sched@3x.png'),
                        ),
                        containerTitle: '학사 일정',
                        containerDescription: '학기 언제 끝나..',
                        order: 4,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Center(
                  child: Container(
                    //margin: EdgeInsets.only(top:44.0),
                    child: Text("오류 제보 및 개발자",
                        style: const TextStyle(
                            color: const Color(0xff2c6ec4),
                            fontWeight: FontWeight.w500,
                            fontFamily: "NotoSansKR",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        textAlign: TextAlign.center),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
