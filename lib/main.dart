import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/TopContainer.dart';
import 'widgets/mainPageData.dart';
import 'widgets/mainCategory.dart';
import 'widgets/mainIcon.dart';
import 'package:kmouin/screens/ErrorAndDev.dart';
import 'package:flutter_statusbar_text_color/flutter_statusbar_text_color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarTextColor.setTextColor(FlutterStatusbarTextColor.dark);
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
  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void scopeOut(){
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  Widget build(BuildContext context) {
    int _connect = 0;
    double _mainWidth = MediaQuery.of(context).size.width;
    double _mainHeight = MediaQuery.of(context).size.height;
    double _backgroundHeight = _mainHeight * (33.0 / 100);
    double _titleLeftBorder = _mainWidth * (8.0 / 100);
    double _sideBorder = _mainWidth * (6.0 / 100);
    bool _stat = false;

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
                height: _backgroundHeight,
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
                          margin: EdgeInsets.only(
                              top: _backgroundHeight * (23.2 / 100)),
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                  bottom: 10.0,
                                  left: _titleLeftBorder,
                                ),
                                child: Text(
                                  "안녕하세요!",
                                  style: const TextStyle(
                                    color: const Color(0xfff1f1f1),
                                    letterSpacing: -0.5,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "NotoSansKR",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 34.0,
                                  ),
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
                          margin: EdgeInsets.only(left: _titleLeftBorder),
                          child: Text(
                            "해대인에 오신걸 환영합니다",
                            style: const TextStyle(
                              color: const Color(0xffffffff),
                              letterSpacing: -0.5,
                              fontWeight: FontWeight.w300,
                              fontFamily: "NotoSansKR",
                              fontStyle: FontStyle.normal,
                              fontSize: 22.0,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        // Rectangle Copy 11
                        Container(
                          padding: EdgeInsets.only(left: 5.0),
                          margin: EdgeInsets.fromLTRB(
                              _sideBorder, _sideBorder, _sideBorder, _sideBorder),
                          width: _mainWidth * (86.4 / 100),
                          height: _mainHeight * (5.0 / 100),
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.all(Radius.circular(23.0)),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => subpage[_connect],
                                    ),
                                  );
                                },
                                icon: Icon(Icons.search),
                                color: Color(0xff307ac6),
                              ),
                              Flexible(
                                child: TextField(
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '키워드 검색',
                                    suffixIcon: IconButton(
                                      onPressed: () => _controller.clear(),
                                      icon: Icon(Icons.clear),
                                    ),
                                  ),
                                  cursorColor: Colors.blueAccent,
                                  controller: _controller,
                                  onSubmitted: (String value) async {
                                    await showDialog<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        for (int i = 0;
                                            i < keywords.length;
                                            i++) {
                                          if (value.toString() ==
                                              keywords[i].toString()) {
                                            _connect = i;
                                            return subpage[i];
//                                            Navigator.push(
//                                              context,
//                                              new MaterialPageRoute(
//                                                builder: (context) => subpage[i],
//                                              ),
//                                            );
                                          }
                                        }
                                        return CupertinoAlertDialog(
                                          title: const Text('죄송합니다'),
                                          content: Column(
                                            children: [
                                              Text('"$value"(이)라는 키워드가 없습니다. \n'),
                                              Text(
                                                "[키워드] \n 통근 / 통근버스 / 2층 / 3층 / 5층 \n 교직원 / 기숙사 / 생활관 \n 편의시설 / 대피시설",
                                              ),
                                            ],
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
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
      ),
    );
  }
}
