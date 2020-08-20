import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Calendar> fetchPost() async{
  final response =
  await http.get('');
  if(response.statusCode == 200){
    return Calendar.fromJson(json.decode(response.body));
  } else{
    throw Exception('Failed to load post');
  }
}

class Calendar{
  List<dynamic> jsonList=[];

  Calendar({this.jsonList});

  factory Calendar.fromJson(List json){
    return Calendar(
        jsonList:json
    );
  }
  List setList(){
    return jsonList;
  }
}



void main() {
  //intl 패키지 사용을 위한 runApp 함수 호출
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Table Calendar Demo',
      debugShowCheckedModeBanner : false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Table Calendar Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  Map<DateTime, List> _events;
  Map<DateTime, List> _holidays;

  Map<DateTime,List> _calendar;

  Future<Calendar> calendar;
  List _selectedEvents;

  // 애니메이션 컨트롤러와 캘린더 컨트롤러 선언
  AnimationController _animationController;
  CalendarController _calendarController;

  Map<DateTime, List> input_events() {
    final _selectedDay = DateTime.now();
    calendar = fetchPost();
    dynamic calendarlist = calendar ?? Calendar();
    _calendar = {};
    _holidays = { // 휴일 저장
      DateTime(_selectedDay.year - 1, 1, 1): ['새해'],
      DateTime(_selectedDay.year - 1, 3, 1): ['삼일절'],
      DateTime(_selectedDay.year - 1, 5, 5): ['어린이날'],
      DateTime(_selectedDay.year - 1, 6, 6): ['현충일'],
      DateTime(_selectedDay.year - 1, 8, 15): ['광복절'],
      DateTime(_selectedDay.year - 1, 9, 3): ['개천절'],
      DateTime(_selectedDay.year - 1, 10, 9): ['한글날'],
      DateTime(_selectedDay.year - 1, 12, 25): ['크리스마스'],

      DateTime(_selectedDay.year, 1, 1): ['새해'],
      DateTime(_selectedDay.year, 3, 1): ['삼일절'],
      DateTime(_selectedDay.year, 5, 5): ['어린이날'],
      DateTime(_selectedDay.year, 6, 6): ['현충일'],
      DateTime(_selectedDay.year, 8, 15): ['광복절'],
      DateTime(_selectedDay.year, 9, 3): ['개천절'],
      DateTime(_selectedDay.year, 10, 9): ['한글날'],
      DateTime(_selectedDay.year, 12, 25): ['크리스마스'],

      DateTime(_selectedDay.year + 1, 1, 1): ['새해'],
      DateTime(_selectedDay.year + 1, 3, 1): ['삼일절'],
      DateTime(_selectedDay.year + 1, 5, 5): ['어린이날'],
      DateTime(_selectedDay.year + 1, 6, 6): ['현충일'],
      DateTime(_selectedDay.year + 1, 8, 15): ['광복절'],
      DateTime(_selectedDay.year + 1, 9, 3): ['개천절'],
      DateTime(_selectedDay.year + 1, 10, 9): ['한글날'],
      DateTime(_selectedDay.year + 1, 12, 25): ['크리스마스'],
    };


    Map<DateTime, List> events = { // 임시용, 서버 완성시 지우면 됨

      //1학기
      DateTime(_selectedDay.year, 3, 4): ["신입생 수강신청",],
      DateTime(_selectedDay.year, 3, 5): ["신입생 수강신청",],

      DateTime(_selectedDay.year, 3, 12): ["신입생 추가 수강신청",],
      DateTime(_selectedDay.year, 3, 13): ["신입생 추가 수강신청"],

      DateTime(_selectedDay.year, 3, 16): ["제 1학기 개강",
        "제 1학기 수강신청 변경"],

      DateTime(_selectedDay.year, 3, 17): ["제 1학기 수강신청 변경",],
      DateTime(_selectedDay.year, 3, 18): ["제 1학기 수강신청 변경",],
      DateTime(_selectedDay.year, 3, 19): ["제 1학기 수강신청 변경"],
      DateTime(_selectedDay.year, 3, 20): ["제 1학기 수강신청 변경",],

      DateTime(_selectedDay.year, 4, 17): ["수업일수 1/3선",],

      DateTime(_selectedDay.year, 5, 1): ["대학원 외국어시험",],

      DateTime(_selectedDay.year, 5, 6): ["수업일수 1/2선",
        "제 1학기 중간고사",
        "제 1학기 중간고사 성적처리 및 입력"],

      DateTime(_selectedDay.year, 5, 7): ["제1학기 중간고사",
        "제 1학기 중간고사 성적처리 및 입력"],
      DateTime(_selectedDay.year, 5, 8): ["제1학기 중간고사",
        "제 1학기 중간고사 성적처리 및 입력"],
      DateTime(_selectedDay.year, 5, 9): ["제1학기 중간고사",
        "제 1학기 중간고사 성적처리 및 입력"],
      DateTime(_selectedDay.year, 5, 10): ["제1학기 중간고사",
        "제 1학기 중간고사 성적처리 및 입력"],
      DateTime(_selectedDay.year, 5, 11): ["제1학기 중간고사",
        "제 1학기 중간고사 성적처리 및 입력"],
      DateTime(_selectedDay.year, 5, 12): ["제1학기 중간고사",
        "제 1학기 중간고사 성적처리 및 입력"],

      DateTime(_selectedDay.year, 5, 13): ["제1학기 중간고사 성적처리 및 입력",],
      DateTime(_selectedDay.year, 5, 14): ["제1학기 중간고사 성적처리 및 입력",],
      DateTime(_selectedDay.year, 5, 15): ["제1학기 중간고사 성적처리 및 입력",],
      DateTime(_selectedDay.year, 5, 16): ["제1학기 중간고사 성적처리 및 입력",],
      DateTime(_selectedDay.year, 5, 17): ["제1학기 중간고사 성적처리 및 입력",],
      DateTime(_selectedDay.year, 5, 18): ["제1학기 중간고사 성적처리 및 입력",],
      DateTime(_selectedDay.year, 5, 19): ["제1학기 중간고사 성적처리 및 입력",],

      DateTime(_selectedDay.year, 5, 20): ["제1학기 중간고사 성적열람",],
      DateTime(_selectedDay.year, 5, 21): ["제1학기 중간고사 성적열람",],
      DateTime(_selectedDay.year, 5, 22): ["제1학기 중간고사 성적열람",
        "수업일수 2/3선",
        "대학원 종합시험"],

      DateTime(_selectedDay.year, 5, 27): ["여름 계절학기 수강신청",],
      DateTime(_selectedDay.year, 5, 28): ["여름 계절학기 수강신청",],
      DateTime(_selectedDay.year, 5, 29): ["여름 계절학기 수강신청",],

      DateTime(_selectedDay.year, 6, 1): ["대학원 학위청구논문 심사 신청",],
      DateTime(_selectedDay.year, 6, 2): ["대학원 학위청구논문 심사 신청",],
      DateTime(_selectedDay.year, 6, 3): ["대학원 학위청구논문 심사 신청",],
      DateTime(_selectedDay.year, 6, 4): ["대학원 학위청구논문 심사 신청",],
      DateTime(_selectedDay.year, 6, 5): ["대학원 학위청구논문 심사 신청",],
      DateTime(_selectedDay.year, 6, 6): ["대학원 학위청구논문 심사 신청",],
      DateTime(_selectedDay.year, 6, 7): ["대학원 학위청구논문 심사 신청",],

      DateTime(_selectedDay.year, 6, 22): ["제1학기 기말고사 1․4학년",
        "제1학기 성적처리 및 입력"],
      DateTime(_selectedDay.year, 6, 23): ["제1학기 기말고사 1․4학년",
        "제1학기 성적처리 및 입력"],
      DateTime(_selectedDay.year, 6, 24): ["제1학기 기말고사 1․4학년",
        "제1학기 성적처리 및 입력"],
      DateTime(_selectedDay.year, 6, 25): ["제1학기 기말고사 1․4학년",
        "제1학기 성적처리 및 입력"],
      DateTime(_selectedDay.year, 6, 26): ["제1학기 기말고사 1․4학년",
        "제1학기 성적처리 및 입력"],

      DateTime(_selectedDay.year, 6, 27): ["제1학기 성적처리 및 입력"],
      DateTime(_selectedDay.year, 6, 28): ["제1학기 성적처리 및 입력",],

      DateTime(_selectedDay.year, 6, 29): ["제1학기 성적처리 및 입력",
        "제 1학기 기말고사 2.3학년"],
      DateTime(_selectedDay.year, 6, 30): ["제1학기 성적처리 및 입력",
        "제 1학기 기말고사 2.3학년"],
      DateTime(_selectedDay.year, 7, 1): ["제1학기 성적처리 및 입력",
        "제 1학기 기말고사 2.3학년"],
      DateTime(_selectedDay.year, 7, 2): ["제1학기 성적처리 및 입력",
        "제 1학기 기말고사 2.3학년"],
      DateTime(_selectedDay.year, 7, 3): ["제1학기 성적처리 및 입력",
        "제 1학기 기말고사 2.3학년"],

      DateTime(_selectedDay.year, 7, 4): ["제1학기 성적처리 및 입력",],
      DateTime(_selectedDay.year, 7, 5): ["제1학기 성적처리 및 입력",],

      DateTime(_selectedDay.year, 7, 6): ["제1학기 성적처리 및 입력",
        "여름방학 시작",
        "여름계절학기 수업",
      ],

      DateTime(_selectedDay.year, 7, 7): ["제1학기 성적처리 및 입력",
        "여름계절학기 수업",
      ],
      DateTime(_selectedDay.year, 7, 8): ["제1학기 성적처리 및 입력",
        "여름계절학기 수업",
      ],
      DateTime(_selectedDay.year, 7, 9): ["제1학기 성적처리 및 입력",
        "여름계절학기 수업",
      ],

      DateTime(_selectedDay.year, 7, 10): ["여름계절학기 수업",
        "제1학기 성적열람"],
      DateTime(_selectedDay.year, 7, 11): ["여름계절학기 수업",
        "제1학기 성적열람"],
      DateTime(_selectedDay.year, 7, 12): ["여름계절학기 수업",
        "제1학기 성적열람"],

      DateTime(_selectedDay.year, 7, 13): ["여름계절학기 수업",
        "제1학기 성적 확정 및 조회 - 성적이의신청 및 정정"],
      DateTime(_selectedDay.year, 7, 14): ["여름계절학기 수업",
        "제1학기 성적 확정 및 조회 - 성적이의신청 및 정정"],

      DateTime(_selectedDay.year, 7, 15): ["여름계절학기 수업",],
      DateTime(_selectedDay.year, 7, 16): ["여름계절학기 수업",],
      DateTime(_selectedDay.year, 7, 17): ["여름계절학기 수업",],
      DateTime(_selectedDay.year, 7, 18): ["여름계절학기 수업",],
      DateTime(_selectedDay.year, 7, 19): ["여름계절학기 수업",],
      DateTime(_selectedDay.year, 7, 20): ["여름계절학기 수업",
        "해사대학 3학년 제1학기 성적 입력·열람 및 정정"],
      DateTime(_selectedDay.year, 7, 21): ["여름계절학기 수업",
        "해사대학 3학년 제1학기 성적 입력·열람 및 정정"],
      DateTime(_selectedDay.year, 7, 22): ["여름계절학기 수업",
        "해사대학 3학년 제1학기 성적 입력·열람 및 정정"],
      DateTime(_selectedDay.year, 7, 23): ["여름계절학기 수업",
        "해사대학 3학년 제1학기 성적 입력·열람 및 정정"],
      DateTime(_selectedDay.year, 7, 24): ["여름계절학기 수업",
        "해사대학 3학년 제1학기 성적 입력·열람 및 정정"],

      DateTime(_selectedDay.year, 7, 25): ["해사대학 3학년 제1학기 성적 입력·열람 및 정정"],
      DateTime(_selectedDay.year, 7, 26): ["해사대학 3학년 제1학기 성적 입력·열람 및 정정"],
      DateTime(_selectedDay.year, 7, 27): ["해사대학 3학년 제1학기 성적 입력·열람 및 정정"],
      DateTime(_selectedDay.year, 7, 28): ["해사대학 3학년 제1학기 성적 입력·열람 및 정정"],
      DateTime(_selectedDay.year, 7, 29): ["해사대학 3학년 제1학기 성적 입력·열람 및 정정"],
      DateTime(_selectedDay.year, 7, 30): ["해사대학 3학년 제1학기 성적 입력·열람 및 정정"],
      DateTime(_selectedDay.year, 7, 31): ["해사대학 3학년 제1학기 성적 입력·열람 및 정정"],

      DateTime(_selectedDay.year, 8, 10): ["제2학기 수강신청",
        "제2학기 대학원 수강신청"],
      DateTime(_selectedDay.year, 8, 11): ["제2학기 수강신청",
        "제2학기 대학원 수강신청"],
      DateTime(_selectedDay.year, 8, 12): ["제2학기 수강신청",
        "제2학기 대학원 수강신청"],
      DateTime(_selectedDay.year, 8, 13): ["제2학기 수강신청",
        "제2학기 대학원 수강신청"],
      DateTime(_selectedDay.year, 8, 14): ["제2학기 수강신청",],

      DateTime(_selectedDay.year, 8, 24): ["2020학년도 제2학기 재학생 등록금 납입",],
      DateTime(_selectedDay.year, 8, 25): ["2020학년도 제2학기 재학생 등록금 납입",],
      DateTime(_selectedDay.year, 8, 26): ["2020학년도 제2학기 재학생 등록금 납입",
        "2019학년도 후기 학위수여식",
      ],

      //2학기
      DateTime(_selectedDay.year, 8, 31): ["제2학기 개강",
        "제2학기 수강신청 변경",
      ],
      DateTime(_selectedDay.year, 9, 1): ["제2학기 수강신청 변경",],
      DateTime(_selectedDay.year, 9, 2): ["제2학기 수강신청 변경",
        "제2학기 대학원 수강신청 변경",
      ],
      DateTime(_selectedDay.year, 9, 3): ["제2학기 수강신청 변경",
        "제2학기 대학원 수강신청 변경",
      ],
      DateTime(_selectedDay.year, 9, 4): ["제2학기 수강신청 변경",
        "제2학기 대학원 수강신청 변경",
        "대학원 외국어시험"],

      DateTime(_selectedDay.year, 9, 25): ["대학원 종합시험",],

      DateTime(_selectedDay.year, 10, 7): ["수업일수 1/3선",],

      DateTime(_selectedDay.year, 10, 19): ["대학원 학위청구논문 심사 신청",],
      DateTime(_selectedDay.year, 10, 20): ["대학원 학위청구논문 심사 신청",],
      DateTime(_selectedDay.year, 10, 21): ["대학원 학위청구논문 심사 신청",],
      DateTime(_selectedDay.year, 10, 22): ["대학원 학위청구논문 심사 신청",],
      DateTime(_selectedDay.year, 10, 23): ["대학원 학위청구논문 심사 신청",],
      DateTime(_selectedDay.year, 10, 24): ["대학원 학위청구논문 심사 신청",],
      DateTime(_selectedDay.year, 10, 25): ["대학원 학위청구논문 심사 신청",],
      DateTime(_selectedDay.year, 10, 26): ["대학원 학위청구논문 심사 신청",],

      DateTime(_selectedDay.year, 10, 27): ["대학원 학위청구논문 심사 신청",
        "수업일수 1/2선",
      ],

      DateTime(_selectedDay.year, 11, 4): ["개교기념식",],

      DateTime(_selectedDay.year, 11, 5): ["제75주년 개교기념일",],

      DateTime(_selectedDay.year, 11, 9): ["겨울계절학기 수강신청",],
      DateTime(_selectedDay.year, 11, 10): ["겨울계절학기 수강신청",],
      DateTime(_selectedDay.year, 11, 11): ["겨울계절학기 수강신청",],

      DateTime(_selectedDay.year, 11, 13): ["수업일수 2/3선",],

      DateTime(_selectedDay.year, 12, 14): ["제2학기 기말고사",
        "제2학기 성적처리 및 입력",
      ],
      DateTime(_selectedDay.year, 12, 15): ["제2학기 기말고사",
        "제2학기 성적처리 및 입력"],
      DateTime(_selectedDay.year, 12, 16): ["제2학기 기말고사",
        "제2학기 성적처리 및 입력"],
      DateTime(_selectedDay.year, 12, 17): ["제2학기 기말고사",
        "제2학기 성적처리 및 입력"],
      DateTime(_selectedDay.year, 12, 18): ["제2학기 기말고사",
        "제2학기 성적처리 및 입력"],

      DateTime(_selectedDay.year, 12, 19): ["제2학기 성적처리 및 입력",],
      DateTime(_selectedDay.year, 12, 20): ["제2학기 성적처리 및 입력",],
      DateTime(_selectedDay.year, 12, 21): ["제2학기 성적처리 및 입력",
        "겨울방학 시작",
        "겨울계절학기 수업"],
      DateTime(_selectedDay.year, 12, 22): ["제2학기 성적처리 및 입력",
        "겨울계절학기 수업"],
      DateTime(_selectedDay.year, 12, 23): ["제2학기 성적처리 및 입력",
        "겨울계절학기 수업"],
      DateTime(_selectedDay.year, 12, 24): ["제2학기 성적처리 및 입력",
        "겨울계절학기 수업",
        "제2학기 성적열람",
      ],

      DateTime(_selectedDay.year, 12, 25): ["겨울계절학기 수업",
        "제2학기 성적열람",
      ],
      DateTime(_selectedDay.year, 12, 26): ["겨울계절학기 수업",
        "제2학기 성적열람",
      ],
      DateTime(_selectedDay.year, 12, 27): ["겨울계절학기 수업",
        "제2학기 성적열람",
      ],
      DateTime(_selectedDay.year, 12, 28): ["겨울계절학기 수업",
        "제2학기 성적열람",
      ],

      DateTime(_selectedDay.year, 12, 29): ["겨울계절학기 수업",
        "제2학기 성적 확정 및 조회 - 성적이의신청 및 정정",
      ],
      DateTime(_selectedDay.year, 12, 30): ["겨울계절학기 수업",
        "제2학기 성적 확정 및 조회 - 성적이의신청 및 정정",
      ],
      DateTime(_selectedDay.year, 12, 31): ["겨울계절학기 수업",
        "제2학기 성적 확정 및 조회 - 성적이의신청 및 정정",
      ],
      DateTime(_selectedDay.year + 1, 1, 1): ["겨울계절학기 수업",
        "제2학기 성적 확정 및 조회 - 성적이의신청 및 정정",
      ],
      DateTime(_selectedDay.year + 1, 1, 2): ["겨울계절학기 수업",
        "제2학기 성적 확정 및 조회 - 성적이의신청 및 정정",
      ],
      DateTime(_selectedDay.year + 1, 1, 3): ["겨울계절학기 수업",
        "제2학기 성적 확정 및 조회 - 성적이의신청 및 정정",
      ],
      DateTime(_selectedDay.year + 1, 1, 4): ["겨울계절학기 수업",
        "제2학기 성적 확정 및 조회 - 성적이의신청 및 정정",
        "시무식"],

      DateTime(_selectedDay.year + 1, 1, 5): ["겨울계절학기 수업"],
      DateTime(_selectedDay.year + 1, 1, 6): ["겨울계절학기 수업"],
      DateTime(_selectedDay.year + 1, 1, 7): ["겨울계절학기 수업"],
      DateTime(_selectedDay.year + 1, 1, 8): ["겨울계절학기 수업"],
      DateTime(_selectedDay.year + 1, 1, 9): ["겨울계절학기 수업"],
      DateTime(_selectedDay.year + 1, 1, 10): ["겨울계절학기 수업"],

      DateTime(_selectedDay.year + 1, 1, 11): ["겨울계절학기 수업",
        "해사대학 3학년 제2학기 성적입력, 열람 및 정정",
      ],
      DateTime(_selectedDay.year + 1, 1, 12): ["겨울계절학기 수업",
        "해사대학 3학년 제2학기 성적입력, 열람 및 정정",
      ],

      DateTime(_selectedDay.year + 1, 1, 13): ["해사대학 3학년 제2학기 성적입력, 열람 및 정정",],
      DateTime(_selectedDay.year + 1, 1, 14): ["해사대학 3학년 제2학기 성적입력, 열람 및 정정",],
      DateTime(_selectedDay.year + 1, 1, 15): ["해사대학 3학년 제2학기 성적입력, 열람 및 정정",],

      DateTime(_selectedDay.year + 1, 1, 27): ["2020학년도 전기 해사대학 학위수여식",],

      DateTime(_selectedDay.year + 1, 2, 15): ["2021학년도 제1학기 수강신청",
        "2021학년도 제1학기 대학원 수강신청청",
      ],
      DateTime(_selectedDay.year + 1, 2, 16): ["2021학년도 제1학기 수강신청",
        "2021학년도 제1학기 대학원 수강신청청",
      ],
      DateTime(_selectedDay.year + 1, 2, 17): ["2021학년도 제1학기 수강신청",
        "2021학년도 제1학기 대학원 수강신청청",
      ],
      DateTime(_selectedDay.year + 1, 2, 17): ["2021학년도 제1학기 수강신청",
        "2021학년도 제1학기 대학원 수강신청청",
        "2020학년도 전기 학위수여식",
      ],

      DateTime(_selectedDay.year + 1, 2, 18): ["2021학년도 제1학기 수강신청",
        "2021학년도 제1학기 대학원 수강신청청",
      ],
      DateTime(_selectedDay.year + 1, 2, 19): ["2021학년도 제1학기 수강신청",
        "해사대학 신입생 오리엔테이션 및 승선생활관 적응교육",
      ],

      DateTime(_selectedDay.year + 1, 2, 20): ["해사대학 신입생 오리엔테이션 및 승선생활관 적응교육",],
      DateTime(_selectedDay.year + 1, 2, 21): ["해사대학 신입생 오리엔테이션 및 승선생활관 적응교육",],
      DateTime(_selectedDay.year + 1, 2, 22): ["해사대학 신입생 오리엔테이션 및 승선생활관 적응교육",
        "2021학년도 제1학기 재학생 등록금 납입"],
      DateTime(_selectedDay.year + 1, 2, 23): ["해사대학 신입생 오리엔테이션 및 승선생활관 적응교육",
        "2021학년도 제1학기 재학생 등록금 납입"],
      DateTime(_selectedDay.year + 1, 2, 24): ["해사대학 신입생 오리엔테이션 및 승선생활관 적응교육",
        "2021학년도 제1학기 재학생 등록금 납입"],
      DateTime(_selectedDay.year + 1, 2, 25): ["해사대학 신입생 오리엔테이션 및 승선생활관 적응교육",],

      DateTime(_selectedDay.year + 1, 2, 26): ["2021학년도 입학식",
        "신입생 오리엔테이션(해양과학기술대학,공과대학,국제대학)",
      ],
    };
    try {
      for (var i = 0; i < calendarlist.jsonList.length ?? 0; i++) {
        if (events[DateTime(calendarlist.jsonList[i]['date']['year'],
            calendarlist.jsonList[i]['date']['month'],
            calendarlist.jsonList[i]['date']['day'])] == null) {
          events[DateTime(calendarlist.jsonList[i]['date']['year'],
              calendarlist.jsonList[i]['date']['month'],
              calendarlist.jsonList[i]['date']['day'])] = [];
        }
        if (!events[DateTime(calendarlist.jsonList[i]['date']['year'],
            calendarlist.jsonList[i]['date']['month'],
            calendarlist.jsonList[i]['date']['day'])].contains(
            calendarlist.jsonList[i]['calendar'])) {
          events[DateTime(calendarlist.jsonList[i]['date']['year'],
              calendarlist.jsonList[i]['date']['month'],
              calendarlist.jsonList[i]['date']['day'])].add(
              calendarlist.jsonList[i]['calendar']);
        }
      }
      return events;
    } catch (e) {
      print('Errortype : ${e}');
      return events;
    }
  }
  /*
  Map<DateTime, List> MapAdd(Map<DateTime, List> first, Map<DateTime, List> second)
  {
  // Map second의 키값을 확인, first에 있는지 보고, 존재하면 합치고, 존재하지 않는다면 만든다.
    for(var i=second.begin() ;i<)
    {
      for( var j = 0 ; j<second[i].length; j++)
      {
         if(first[second[i]]==null){
          first[second[i]]=[];
         }
         first[second[i]].add(second[i][j]);
      }
    }
    return first;
  }
  */
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final _selectedDay = DateTime.now();
    _calendarController = CalendarController();
    _events = input_events();
    //_events = MapAdd(_events,_holidays);
    _events.addAll(_holidays);
    _selectedEvents = _events[_selectedDay] ?? []; //널값인지 아닌지를 확인할 것!
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(DateTime first, DateTime last,
      CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(DateTime first, DateTime last,
      CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              width: double.infinity,
              height: 109,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment(-0.024397895358418742, 0),
                    end: Alignment(0.9999999999999999, 0.9130023425609295),
                    colors: [const Color(0xff66c7f7), const Color(0xff5a9ced)]
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 40,
                  ),
                  Container(
                      width: double.infinity,
                      child: Stack(
                          children: <Widget>[
                            Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.navigate_before),
                                    color: Colors.white,
                                  ),
                                  Text('메인', style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: "NotoSansKR",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.0
                                  )),
                                ]
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 69,
                              child: Text(
                                '학사일정',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "NotoSansKR",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 20.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ]
                      )
                  )
                ],
              )
          ),
          _buildTableCalendar(),
          //_buildTableCalendarWithBuilders(),
          const SizedBox(height: 13.3),
          //_buildButtons(),

          Expanded(child: _buildEventList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTableCalendar() {
    return TableCalendar(
        locale: 'ko_KR',
        calendarController: _calendarController,
        events: _events,
        holidays: _holidays,
        startingDayOfWeek: StartingDayOfWeek.sunday,
        calendarStyle: CalendarStyle(
          outsideDaysVisible: false,
          weekdayStyle: TextStyle().copyWith(color: Colors.blue[800]), // 날짜(평일)
          holidayStyle: TextStyle().copyWith(color: Colors.red[800]), //
        ),
        headerStyle: HeaderStyle(
          centerHeaderTitle: true,
          formatButtonVisible: false,
        ),
        onDaySelected: _onDaySelected,
        onVisibleDaysChanged: _onVisibleDaysChanged,
        onCalendarCreated: _onCalendarCreated,

        builders: CalendarBuilders(
          //선택한 날짜를 나타내는 옵션
          selectedDayBuilder: (context, date, _) {
            return FadeTransition(
              opacity: Tween(begin: 0.0, end: 1.0).animate(
                  _animationController),
              child: Container(
                margin: const EdgeInsets.all(4.0),
                padding: const EdgeInsets.only(top: 5.0, left: 6.0),
                color: Colors.deepOrange[300],
                width: 100,
                height: 100,
                child: Text('${date.day}', style: TextStyle().copyWith(
                    fontSize: 16.0),),
              ),
            );
          },
          //현재 날짜를 나타내는 옵션
          todayDayBuilder: (context, date, _) {
            return Container(
                margin: const EdgeInsets.all(4.0),
                padding: const EdgeInsets.only(top: 5.0, left: 6.0),
                color: Colors.amber[400],
                width: 100,
                height: 100,
                child: Text('${date.day}',
                  style: TextStyle().copyWith(fontSize: 16.0),
                )
            );
          },

          markersBuilder: (context, date, events, holidays) {
            final children = <Widget>[];

            if (events.isNotEmpty) {
              children.add(
                  Positioned(
                    bottom: 1,
                    child: Row(
                        children:<Widget>[
                          _buildEventsMarker(date, events,holidays),
                        ]
                    ),
                  ));
            }

            if (holidays.isNotEmpty) {
              children.add(
                Positioned(
                  right: 1,
                  top: 0.5,
                  child: _buildHolidaysMarker(),
                ),
              );
            }

            return children;
          },
        )
    );
  }


  Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(
      locale: 'ko_KR',
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekdayStyle: TextStyle().copyWith(color: Colors.blue[800]), // 날짜(평일)
        holidayStyle: TextStyle().copyWith(color: Colors.red[800]), //
      ),

      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.green[600]),
      ),

      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
      ),

      builders: CalendarBuilders(

        //선택한 날짜를 나타내는 옵션
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(
                _animationController),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 5.0, left: 6.0),
              color: Colors.deepOrange[300],
              width: 100,
              height: 100,
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(fontSize: 16.0),
              ),
            ),
          );
        },

        //현재 날짜를 나타내는 옵션
        todayDayBuilder: (context, date, _) {
          return Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 5.0, left: 6.0),
              color: Colors.amber[400],
              width: 100,
              height: 100,
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(fontSize: 16.0),
              )
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (events.isNotEmpty) {
            children.add(
              Positioned(
                right : 1,
                bottom: 1,
                child: _buildEventsMarker(date, events,holidays),
              ),
            );
          }

          if (holidays.isNotEmpty) {
            children.add(
              Positioned(
                right: -2,
                top: -2,
                child: _buildHolidaysMarker(),
              ),
            );
          }

          return children;
        },
      ),
      onDaySelected: (date, events) {
        _onDaySelected(date, events);
        _animationController.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  Widget _buildEventsMarker(DateTime date, List events, List holidays) {
    return Row(
        children:<Widget>[
          events.length-holidays.length>=1?_buildAnimationContainer_events(date,events):Text(''),
          events.length-holidays.length>=2?_buildAnimationContainer_events(date,events):Text(''),
          events.length-holidays.length>=3?_buildAnimationContainer_events(date,events):Text(''),
          events.length-holidays.length>=4?_buildAnimationContainer_events(date,events):Text(''),
          events.length-holidays.length>=5?_buildAnimationContainer_events(date,events):Text(''),
        ]
    );
  }

  Widget _buildAnimationContainer_events(DateTime date,List events){
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        //선택했는지(isSelected(date)) , 오늘인지(isToday(date))에 따라 색이 변하는 옵션
        // 삼항연산자를 사용했다.
        color: _calendarController.isSelected(date) ? Colors.brown[500]
            : _calendarController.isToday(date) ? Colors.brown[300]
            : Colors.blue[400],
        borderRadius: BorderRadius.circular(12.0),
      ),
      width: 9.0,
      height: 9.0,
      /*
        child: Center(
          child: Text(
            '${events.length}',
            style: TextStyle().copyWith(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
        )*/
    );
  }

  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.check,
      size: 20.0,
      color: Colors.blueGrey[900],
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) =>
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Container(
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(15)
                    ),
                    boxShadow: [BoxShadow(
                        color: const Color(0x80cacaca),
                        offset: Offset(0, -1),
                        blurRadius: 16,
                        spreadRadius: 2
                    )
                    ],
                    color: Colors.white
                ),
                child: Row(
                    children: <Widget>[
                      SizedBox(width: 15),
                      Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: const Color(0xff5b9fee),
                            borderRadius: BorderRadius.circular(12.0),
                          )
                      ),
                      SizedBox(width: 15),
                      Container(
                        child: Text(event.toString(), style: const TextStyle(
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w500,
                            fontFamily: "NotoSansKR",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0
                        )),
                      ),
                    ]
                )
            ),
          ))
          .toList(),
    );
  }
}
