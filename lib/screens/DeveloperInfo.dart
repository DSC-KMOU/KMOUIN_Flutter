import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';


class DeveloperPage extends StatefulWidget {
  DeveloperPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DeveloperPage> with TickerProviderStateMixin {
  bool key = false;
  double begin, end;
  bool ismoved = false;
  List<String> teamname = ['Main', 'Bus', 'Meal', 'Facil', 'Sched'];
  Map<String, Map<String, List<Map<String, String>>>> _nameList = {
    'Design': {
      'tag': [
        {'teamName': 'UI/UX 디자인총괄'}
      ],
      'head': [
        {'_class': '영어영문학과', 'name': '조성우'}
      ],
      'body': []
    },
    'Main': {
      'tag': [
        {'teamName': '메인페이지 개발'}
      ],
      'head': [
        {'_class': 'IT융합과', 'name': '김민욱'}
      ],
      'body': [
        {'_class': '해양생명과학', 'name': '강은솔'},
        {'_class': '전파공학', 'name': '강호연'},
        {'_class': '국제통상', 'name': '윤예진'},
        {'_class': '조선해양시스템', 'name': '전현경'}
      ]
    },
    'Bus': {
      'tag': [
        {'teamName': '버스페이지 개발'}
      ],
      'head': [
        {'_class': '전자통신과', 'name': '한채연'}
      ],
      'body': [
        {'_class': '기관공학', 'name': '강정인'},
        {'_class': '데이터정보', 'name': '김정민'},
        {'_class': '해양공학', 'name': '남궁재원'},
        {'_class': '데이터정보', 'name': '채희주'}
      ]
    },
    'Meal': {
      'tag': [
        {'teamName': '식단페이지 개발'}
      ],
      'head': [
        {'_class': 'IT융합과', 'name': '박선호'}
      ],
      'body': [
        {'_class': '해양생명과학', 'name': '오희강'},
        {'_class': '기계', 'name': '온창범'},
        {'_class': '해양공학', 'name': '이정우'}
      ]
    },
    'Facil': {
      'tag': [
        {'teamName': '시설페이지 개발'}
      ],
      'head': [
        {'_class': 'IT융합과', 'name': '김호은'}
      ],
      'body': [
        {'_class': '제어계측', 'name': '정수민'}
      ]
    },
    'Sched': {
      'tag': [
        {'teamName': '학사페이지 개발'}
      ],
      'head': [
        {'_class': 'IT융합과', 'name': '정교준'}
      ],
      'body': [
        {'_class': '해양공학', 'name': '손경미'},
        {'_class': '조선해양시스템', 'name': '이유정'}
      ]
    }
  };
  Map<String, Map<String, List<Map<String, String>>>> _nameList2 = {
    'Error': {
      'tag': [
        {'teamName': '오류페이지 개발'}
      ],
      'head': [
        {'_class': 'IT융합과', 'name': '김민욱'},
        {'_class': 'IT융합과', 'name': '정교준'}
      ]
    },
    'Server': {
      'tag': [
        {'teamName': '서버 개발'}
      ],
      'head': [
        {'_class': '전자통신과', 'name': '한채연'},
        {'_class': 'IT융합과', 'name': '정교준'},
        {'_class': 'IT융합과', 'name': '박선호'}
      ]
    },
  };
  Map<String, Map<String, List<Map<String, String>>>> _nameList3 = {
    'Thanks': {
      'tag': [
        {'teamName': 'Special Thanks'}
      ],
      'body': [
        {'_class': 'IT융합과', 'name': '한상욱'},
        {'_class': '컴퓨터공학과', 'name': '신영진'},
        {'_class': '제어계측공학과', 'name': '구경태'}
      ]
    }
  };
  AnimationController _animationController,
      _animationController2,
      _animationController3,
      _animationController4,
      _animationController5,
      _animationController6,
      _animationController7,
      _animationController8,
      _animationController9,
      _animationController10,
      _animationController11;
  Animation<double> _animation,
      _animation2,
      _animation3,
      _animation4,
      _animation5,
      _animation6,
      _animation7,
      _animation8,
      _animation9,
      _animation10,
      _animation11;

  Map<String, AnimationController> _animationControllerList = {};

  Map<String, Animation<double>> _animationList = {};

  void input_animationController() {
    List list = [
      'Design',
      'Main',
      'Bus',
      'Meal',
      'Facil',
      'Sched',
      'Error',
      'Server',
      'Thanks'
    ];
    for (int i = 0; i < list.length; i++) {
      AnimationController _animationController;
      Animation<double> _animation;

      _animationController = AnimationController(
          vsync: this, duration: Duration(milliseconds: 500));
      _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

      _animationControllerList[list[i]] = _animationController;
      _animationList[list[i]] = _animation;
    }
  }

  void AnimationListenerStart() {
    //Design Main Bus Meal Facil Sched Error Server Thanks
    //디자인팀 출력
    _animationControllerList['Design']
        .addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) _animationController.forward();
    });
    //스택1 걷힘(forward)
    _animationController.addStatusListener((AnimationStatus status) {
      //스택 1 & 2 가림
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
        _animationController2.forward();
      }
      if (status == AnimationStatus.dismissed) {}
    });
    //메인팀 출력
    _animationControllerList['Main']
        .addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) _animationController2.reverse();
      if (status == AnimationStatus.dismissed) {}
    });
    //스택 2 걷힘
    _animationController2.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _animationControllerList['Main'].forward();
      }
      //스택 2 & 3 가림
      if (status == AnimationStatus.dismissed) {
        _animationController3.forward();
        _animationController2.forward();
      }
    });

    //버스팀 출력
    _animationControllerList['Bus'].addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) _animationController3.reverse();
      if (status == AnimationStatus.dismissed) {}
    });
    //스택 3 걷힘
    _animationController3.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _animationControllerList['Bus'].forward();
      }
      //스택 2 & 3 가림
      if (status == AnimationStatus.dismissed) {
        _animationController4.forward();
        _animationController3.forward();
      }
    });
    _animationControllerList['Meal']
        .addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) _animationController4.reverse();
      if (status == AnimationStatus.dismissed) {}
    });

    _animationController4.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _animationControllerList['Meal'].forward();
      }
      if (status == AnimationStatus.dismissed) {
        _animationController5.forward();
        _animationController4.forward();
      }
    });

    _animationControllerList['Facil']
        .addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) _animationController5.reverse();
      if (status == AnimationStatus.dismissed) {}
    });

    _animationController5.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _animationControllerList['Facil'].forward();
      }
      if (status == AnimationStatus.dismissed) {
        _animationController6.forward();
        _animationController5.forward();
      }
    });

    _animationControllerList['Sched']
        .addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) _animationController6.reverse();
      if (status == AnimationStatus.dismissed) {}
    });

    _animationController6.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _animationControllerList['Sched'].forward();
      }
      if (status == AnimationStatus.dismissed) {
        _animationController7.forward();
        _animationController6.forward();
      }
    });

    _animationControllerList['Error']
        .addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) _animationController7.reverse();
      if (status == AnimationStatus.dismissed) {}
    });

    _animationController7.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _animationControllerList['Error'].forward();
      }
      if (status == AnimationStatus.dismissed) {
        _animationController8.forward();
        _animationController7.forward();
      }
    });

    _animationControllerList['Server']
        .addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) _animationController8.reverse();
      if (status == AnimationStatus.dismissed) {}
    });

    _animationController8.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _animationControllerList['Server'].forward();
      }
      if (status == AnimationStatus.dismissed) {
        _animationController9.forward();
        _animationController8.forward();
      }
    });

    _animationControllerList['Thanks']
        .addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) _animationController9.reverse();
      if (status == AnimationStatus.dismissed) {}
    });

    _animationController9.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _animationControllerList['Thanks'].forward();
      }
      if (status == AnimationStatus.dismissed) {
        _animationController9.forward();
        _animationController11.forward();
      }
    });

    _animationController10.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) _animationController11.reverse();
      if (status == AnimationStatus.dismissed) {}
    });

    _animationController11.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _animationController10.forward();
      }
    });
  }

  @override
  initState() {
    super.initState();
    input_animationController();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _animation = Tween(begin: 1.0, end: 0.0).animate(_animationController);
    _animationController2 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _animation2 = Tween(begin: 0.0, end: 1.0).animate(_animationController2);
    _animationController3 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _animation3 = Tween(begin: 0.0, end: 1.0).animate(_animationController3);
    _animationController4 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _animation4 = Tween(begin: 0.0, end: 1.0).animate(_animationController4);
    _animationController5 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _animation5 = Tween(begin: 0.0, end: 1.0).animate(_animationController5);
    _animationController6 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _animation6 = Tween(begin: 0.0, end: 1.0).animate(_animationController6);
    _animationController7 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _animation7 = Tween(begin: 0.0, end: 1.0).animate(_animationController7);
    _animationController8 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _animation8 = Tween(begin: 0.0, end: 1.0).animate(_animationController8);
    _animationController9 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _animation9 = Tween(begin: 0.0, end: 1.0).animate(_animationController9);
    _animationController10 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _animation10 = Tween(begin: 0.0, end: 1.0).animate(_animationController10);
    _animationController11 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _animation11 = Tween(begin: 0.0, end: 1.0).animate(_animationController11);
    _animationControllerList['Design'].forward();
  }

  Color _appbarFont = Colors.white;
  Color _backgroundColor = const Color(0xff2a67c2);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        allowFontScaling: false);
    AnimationListenerStart();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(44.0),
        child: AppBar(
          centerTitle: false,
          titleSpacing: -6.0,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(44.0)),
                  onPressed: () {
                    setState(
                      () {
                        Navigator.pop(context);
                      },
                    );
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
                          color: _appbarFont,
                        ),
                        Text(
                          "메인",
                          style: TextStyle(
                            color: _appbarFont,
                            fontWeight: FontWeight.w300,
                            fontFamily: "NotoSansKR",
                            fontStyle: FontStyle.normal,
                            fontSize: ScreenUtil().setSp(16.0),
                            wordSpacing: 0.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: EndingCredit(_nameList, _nameList2, _nameList3),
    );
  }

  Widget EndingCredit(
      Map<String, Map<String, List<Map<String, String>>>> nameList,
      Map<String, Map<String, List<Map<String, String>>>> nameList2,
      Map<String, Map<String, List<Map<String, String>>>> nameList3) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color:_backgroundColor,
                ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    //color:Colors.black,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.30,
                    alignment: Alignment.topCenter,
                  ),
                  MainBodyStack(nameList, nameList2, nameList3),
                  Container(
                      alignment: Alignment.bottomCenter,
                      //color:Colors.black,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.20,
                      child: Column(children: <Widget>[
                        Expanded(child: Text('')),
                        Container(
                          width: MediaQuery.of(context).size.height * 0.15,
                          height: MediaQuery.of(context).size.height * 0.18,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Image.asset(
                            'images/frontPage/newLogo@3x.png',
                          ),
                        ),
                        SizedBox(height: 12),
                      ]))
                ]),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      //color:Colors.black,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.30,
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                          color:_backgroundColor,
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: Text('개발자정보',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "NotoSansKR",
                                  fontStyle: FontStyle.normal,
                                  fontSize: ScreenUtil().setSp(32.0))))),
                ]),
          ),
        ],
      ),
    );
  }

  Widget MainBodyStack(
      Map<String, Map<String, List<Map<String, String>>>> nameList,
      Map<String, Map<String, List<Map<String, String>>>> nameList2,
      Map<String, Map<String, List<Map<String, String>>>> nameList3) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Stack(children: <Widget>[
        // nameList : Design, Main, Bus, Meal, Facil (팀장 + 팀원) -> MainBody(nameList[teamname]) 함수 사용
        // nameList2 : Error, Server (팀장만) -> MainBody_Role(nameList2[teamname]) 함수 사용
        // nameList3 : Thanks (팀원만) -> MainBody_Special(nameList3[teamname]) 함수 사용
        //
        MainBody(nameList['Design'], _animationControllerList['Design'],
            _animationList['Design']),
        HideContainer(_animationController, _animation),
        MainBody(nameList['Main'], _animationControllerList['Main'],
            _animationList['Main']),
        HideContainer(_animationController2, _animation2),
        MainBody(nameList['Bus'], _animationControllerList['Bus'],
            _animationList['Bus']),
        HideContainer(_animationController3, _animation3),
        MainBody(nameList['Meal'], _animationControllerList['Meal'],
            _animationList['Meal']),
        HideContainer(_animationController4, _animation4),
        MainBody(nameList['Facil'], _animationControllerList['Facil'],
            _animationList['Facil']),
        HideContainer(_animationController5, _animation5),
        MainBody(nameList['Sched'], _animationControllerList['Sched'],
            _animationList['Sched']),
        HideContainer(_animationController6, _animation6),
        MainBody_Role(nameList2['Error'], _animationControllerList['Error'],
            _animationList['Error']),
        HideContainer(_animationController7, _animation7),
        MainBody_Role(nameList2['Server'], _animationControllerList['Server'],
            _animationList['Server']),
        HideContainer(_animationController8, _animation8),
        MainBody_Special(nameList3['Thanks'],
            _animationControllerList['Thanks'], _animationList['Thanks']),
        HideContainer(_animationController9, _animation9),
        HideContainer_Thanks(_animationController10, _animation10),
        HideContainer(_animationController11, _animation11),
        //
      ]),
    );
  }

  // 팀끼리 모으는 함수
  Widget MainBody(Map<String, List<Map<String, String>>> nameList,
      AnimationController animationController, Animation<double> animation) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, build) {
          return Container(
            width: MediaQuery.of(context).size.width * animation.value,
            height: MediaQuery.of(context).size.height * 0.5 * animation.value,
            child: Column(
              children: <Widget>[
                HeadLine(nameList),
                BodyLine(nameList),
              ],
            ),
          );
        });
  }

  // 역할별로 모으는 함수
  Widget MainBody_Role(Map<String, List<Map<String, String>>> nameList,
      AnimationController animationController, Animation<double> animation) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, build) {
          return Container(
              width: MediaQuery.of(context).size.width * animation.value,
              height:
                  MediaQuery.of(context).size.height * 0.5 * animation.value,
              child: HeadLine2(nameList));
        });
  }

  Widget MainBody_Special(Map<String, List<Map<String, String>>> nameList,
      AnimationController animationController, Animation<double> animation) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, build) {
          return Container(
            width: MediaQuery.of(context).size.width * animation.value,
            height: MediaQuery.of(context).size.height * 0.5 * animation.value,
            child: HeadLine3(nameList),
          );
        });
  }

  Widget HideContainer(
      AnimationController animationController, Animation<double> animation) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, build) {
          return Column(
            children: <Widget>[
              Expanded(child: Text('')),
              Container(
                width: MediaQuery.of(context).size.width,
                height:
                    MediaQuery.of(context).size.height * 0.5 * animation.value,
                decoration: BoxDecoration(
                    color:_backgroundColor),
              ),
            ],
          );
        });
  }

  Widget HideContainer_Thanks(
      AnimationController animationController, Animation<double> animation) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, build) {
          return Column(
            children: <Widget>[
              Expanded(child: Text('')),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height *
                      0.5 *
                      animation.value,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color:_backgroundColor
                  ),
                  child: Text('Thank You!!',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontFamily: "NotoSansKR",
                          fontStyle: FontStyle.normal,
                          fontSize: ScreenUtil().setSp(32.0)),
                      textAlign: TextAlign.center)),
            ],
          );
        });
  }

  Widget HeadLine(Map<String, List<Map<String, String>>> nameList) {
    return Row(children: <Widget>[
      team_className(nameList['tag'][0]['teamName']),
      Expanded(child: Text('')),
      team_headCont(nameList['head'][0]['name'], nameList['head'][0]['_class'])
    ]);
  }

  Widget HeadLine2(Map<String, List<Map<String, String>>> nameList) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Row(children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              team_className(nameList['tag'][0]['teamName']),
            ],
          ),
        ),
        Expanded(child: Text('')),
        Container(
          child: Column(
            children: <Widget>[
              nameList['head'].length >= 1
                  ? team_headCont(nameList['head'][0]['name'],
                      nameList['head'][0]['_class'])
                  : Text(''),
              SizedBox(height: 3),
              nameList['head'].length >= 2
                  ? team_headCont(nameList['head'][1]['name'],
                      nameList['head'][1]['_class'])
                  : Text(''),
              SizedBox(height: 3),
              nameList['head'].length >= 3
                  ? team_headCont(nameList['head'][2]['name'],
                      nameList['head'][2]['_class'])
                  : Text(''),
              SizedBox(height: 3),
              nameList['head'].length >= 4
                  ? team_headCont(nameList['head'][3]['name'],
                      nameList['head'][3]['_class'])
                  : Text(''),
              SizedBox(height: 3),
              nameList['head'].length >= 5
                  ? team_headCont(nameList['head'][4]['name'],
                      nameList['head'][4]['_class'])
                  : Text(''),
            ],
          ),
        )
      ]),
    );
  }

  Widget HeadLine3(Map<String, List<Map<String, String>>> nameList) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Row(children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              team_className(nameList['tag'][0]['teamName']),
            ],
          ),
        ),
        Expanded(child: Text('')),
        Container(
          child: Column(
            children: <Widget>[
              nameList['body'].length >= 1
                  ? team_bodyCont(nameList['body'][0]['name'],
                      nameList['body'][0]['_class'])
                  : Text(''),
              SizedBox(height: 3),
              nameList['body'].length >= 2
                  ? team_bodyCont(nameList['body'][1]['name'],
                      nameList['body'][1]['_class'])
                  : Text(''),
              SizedBox(height: 3),
              nameList['body'].length >= 3
                  ? team_bodyCont(nameList['body'][2]['name'],
                      nameList['body'][2]['_class'])
                  : Text(''),
              SizedBox(height: 3),
              nameList['body'].length >= 4
                  ? team_bodyCont(nameList['body'][3]['name'],
                      nameList['body'][3]['_class'])
                  : Text(''),
              SizedBox(height: 3),
              nameList['body'].length >= 5
                  ? team_bodyCont(nameList['body'][4]['name'],
                      nameList['body'][4]['_class'])
                  : Text(''),
            ],
          ),
        )
      ]),
    );
  }

  Widget BodyLine(Map<String, List<Map<String, String>>> nameList) {
    return Row(
      children: <Widget>[
        Expanded(child: Text('')),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5 - 50,
          child: Row(
            children: <Widget>[
              Expanded(child: Text('')),
              Column(
                children: <Widget>[
                  nameList['body'].length >= 1
                      ? AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, builder) {
                            return Container(
                              width: MediaQuery.of(context).size.width / 2 - 1,
                              height: 39,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 16),
                                  Container(
                                    margin:EdgeInsets.only(right:9),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(child: Text('')),
                                        Text(
                                          "팀원",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "NotoSansKR",
                                              fontStyle: FontStyle.normal,
                                              fontSize: ScreenUtil().setSp(14.0)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          })
                      : Text(''),
                  SizedBox(height: 3),
                  nameList['body'].length >= 1
                      ? team_bodyCont(nameList['body'][0]['name'],
                          nameList['body'][0]['_class'])
                      : Text(''),
                  SizedBox(height: 3),
                  nameList['body'].length >= 2
                      ? team_bodyCont(nameList['body'][1]['name'],
                          nameList['body'][1]['_class'])
                      : Text(''),
                  SizedBox(height: 3),
                  nameList['body'].length >= 3
                      ? team_bodyCont(nameList['body'][2]['name'],
                          nameList['body'][2]['_class'])
                      : Text(''),
                  SizedBox(height: 3),
                  nameList['body'].length >= 4
                      ? team_bodyCont(nameList['body'][3]['name'],
                          nameList['body'][3]['_class'])
                      : Text(''),
                  SizedBox(height: 3),
                  nameList['body'].length >= 5
                      ? team_bodyCont(nameList['body'][4]['name'],
                          nameList['body'][4]['_class'])
                      : Text(''),
                  SizedBox(height: 3),
                  nameList['body'].length >= 6
                      ? team_bodyCont(nameList['body'][5]['name'],
                          nameList['body'][5]['_class'])
                      : Text(''),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  //팀명 목록
  Widget team_className(String name) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 50,
      width: (MediaQuery.of(context).size.width / 2 - 1),
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: EdgeInsets.only(left: 10.5),
        child: Text(name,
            style: TextStyle(
                color: const Color(0xff317dc7),
                fontWeight: FontWeight.w700,
                fontFamily: "NotoSansKR",
                fontStyle: FontStyle.normal,
                fontSize: ScreenUtil().setSp(22.0)),
            textAlign: TextAlign.center),
      ),
    );
  }

  //팀장 목록
  Widget team_headCont(String name, String _class) {
    return Container(
      margin: EdgeInsets.only(right: 9),
      height: 50,
      width: MediaQuery.of(context).size.width / 2 - 10,
      child: Column(
        children: <Widget>[
          Container(
            height:15,
            width:MediaQuery.of(context).size.width / 2 - 10,
            child: Row(children: <Widget>[
              Expanded(child: Text('')),
              Text(
                _class,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontFamily: "NotoSansKR",
                    fontStyle: FontStyle.normal,
                    fontSize: ScreenUtil().setSp(12.0)),
              ),
            ]),
          ),
          //Expanded(child:Text('')),
          Container(
            height:35,
            width:MediaQuery.of(context).size.width / 2 - 10,
            child: Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child: Text('')),
                  Column(
                    children: <Widget>[
                      Expanded(child: Text('')),
                      Container(
                        child: Text("팀장",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: "NotoSansKR",
                                fontStyle: FontStyle.normal,
                                fontSize: ScreenUtil().setSp(15.0)),
                            textAlign: TextAlign.center),
                      ),
                    ],
                  ),
                  SizedBox(width: 8),
                  Column(
                    children: <Widget>[
                      Expanded(child: Text('')),
                      Container(
                        child: Text(name,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontFamily: "NotoSansKR",
                                //fontStyle:  FontStyle.normal,
                                fontSize: ScreenUtil().setSp(20.0)),
                            textAlign: TextAlign.center),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //팀원 목록
  Widget team_bodyCont(String name, String _class) {
    return Container(
        margin: EdgeInsets.only(right: 9),
        height: 50,
        width: MediaQuery.of(context).size.width / 2 - 10,
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: Text('')),
              Text(
                _class,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontFamily: "NotoSansKR",
                    fontStyle: FontStyle.normal,
                    fontSize: ScreenUtil().setSp(12.0)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: Text('')),
              FittedBox(
                fit: BoxFit.contain,
                child: Text(
                name,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: "NotoSansKR",
                    fontStyle: FontStyle.normal,
                    fontSize: ScreenUtil().setSp(16.0)),
                textAlign: TextAlign.center,
                ),
              )
            ],
          )
        ]));
  }
}
