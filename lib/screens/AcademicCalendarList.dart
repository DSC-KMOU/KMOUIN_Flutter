import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kmouin/widgets/MenuCard.dart';
import 'package:kmouin/widgets/MenuInfo.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_statusbar_text_color/flutter_statusbar_text_color.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Calendar> fetchPost() async {
  try {
    final response = await http.get(
        'https://asia-northeast1-kmouin-62d7f.cloudfunctions.net/api/schedule');
    if (response.statusCode == 200) {
      return Calendar.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  } catch (e) {
    print('\nfetchERROR :: Errortype : ${e}\n');
  }
}

class Calendar {
  String status;
  List<dynamic> jsonList = [];

  Calendar({this.status, this.jsonList});

  factory Calendar.fromJson(Map<String, dynamic> json) {
    return Calendar(
      status: json['status'],
      jsonList: json['result']['list'],
    );
  }

  List setList() {
    return jsonList;
  }
}

class CalList extends StatefulWidget {
  CalList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CalList> with TickerProviderStateMixin {
  Map<DateTime, List> _events;
  Map<DateTime, List> _holidays;

  Map<DateTime, List> _calendar;

  Future<Calendar> calendar;
  List _selectedEvents;
  bool key = true;

  // 애니메이션 컨트롤러와 캘린더 컨트롤러 선언
  AnimationController _animationController;
  CalendarController _calendarController;

  Map<DateTime, List> input_events() {
    final _selectedDay = DateTime.now();
    calendar = fetchPost();
    _calendar = {};
    _holidays = {
      // 휴일 저장
      DateTime(_selectedDay.year - 1, 1, 1): ['새해'],
      DateTime(_selectedDay.year - 1, 3, 1): ['삼일절'],
      DateTime(_selectedDay.year - 1, 5, 5): ['어린이날'],
      DateTime(_selectedDay.year - 1, 6, 6): ['현충일'],
      DateTime(_selectedDay.year - 1, 8, 15): ['광복절'],
      DateTime(_selectedDay.year - 1, 10, 3): ['개천절'],
      DateTime(_selectedDay.year - 1, 10, 9): ['한글날'],
      DateTime(_selectedDay.year - 1, 12, 25): ['크리스마스'],

      DateTime(_selectedDay.year, 1, 1): ['새해'],
      DateTime(_selectedDay.year, 1, 24): ['설 연휴'],
      DateTime(_selectedDay.year, 1, 25): ['설 연휴'],
      DateTime(_selectedDay.year, 1, 26): ['설 연휴'],
      DateTime(_selectedDay.year, 3, 1): ['삼일절'],
      DateTime(_selectedDay.year, 5, 5): ['어린이날'],
      DateTime(_selectedDay.year, 6, 6): ['현충일'],
      DateTime(_selectedDay.year, 8, 15): ['광복절'],
      DateTime(_selectedDay.year, 9, 30): ['추석 연휴'],
      DateTime(_selectedDay.year, 10, 1): ['추석 연휴'],
      DateTime(_selectedDay.year, 10, 2): ['추석 연휴'],
      DateTime(_selectedDay.year, 10, 3): ['개천절'],
      DateTime(_selectedDay.year, 10, 9): ['한글날'],
      DateTime(_selectedDay.year, 12, 25): ['크리스마스'],

      DateTime(_selectedDay.year + 1, 1, 1): ['새해'],
      DateTime(_selectedDay.year + 1, 2, 11): ['설 연휴'],
      DateTime(_selectedDay.year + 1, 2, 12): ['설 연휴'],
      DateTime(_selectedDay.year + 1, 2, 13): ['설 연휴'],
      DateTime(_selectedDay.year + 1, 3, 1): ['삼일절'],
      DateTime(_selectedDay.year + 1, 5, 5): ['어린이날'],
      DateTime(_selectedDay.year + 1, 5, 19): ['부처님 오신 날'],
      DateTime(_selectedDay.year + 1, 6, 6): ['현충일'],
      DateTime(_selectedDay.year + 1, 8, 15): ['광복절'],
      DateTime(_selectedDay.year + 1, 9, 20): ['추석 연휴'],
      DateTime(_selectedDay.year + 1, 9, 21): ['추석 연휴'],
      DateTime(_selectedDay.year + 1, 9, 22): ['추석 연휴'],
      DateTime(_selectedDay.year + 1, 10, 3): ['개천절'],
      DateTime(_selectedDay.year + 1, 10, 9): ['한글날'],
      DateTime(_selectedDay.year + 1, 12, 25): ['크리스마스'],
    };

    Map<DateTime, List> events = {
      // 임시용, 서버 완성시 지우면 됨
    };
    events.addAll(_holidays);
    return events;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final _selectedDay = DateTime.now();
    _calendarController = CalendarController();
    _events = input_events();
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

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  Color _appbarFont = Color(0xff5b9fee);

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;
    double fullHeight = MediaQuery.of(context).size.height;
    ScreenUtil.init(context,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        allowFontScaling: false);
    FlutterStatusbarTextColor.setTextColor(null);
    return Scaffold(
      //extendBodyBehindAppBar: true,
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
                            fontSize: 16.0,
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
                    "학사 일정",
                    style: TextStyle(
                      color: _appbarFont,
                      fontWeight: FontWeight.w600,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //SizedBox(height:20),
            FutureBuilder<Calendar>(
                future: calendar,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (key) {
                      setData(snapshot.data.jsonList);
                    }
                  } else if (snapshot.hasError) {
                    print(
                        '\n\nERRORMESSAGE :: snapshot Error :  ${snapshot.error}\n\n');
                  }
                  return SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(left:5.0, right: 5.0),
                      child: Column(
                        children: [
                          Divider(thickness: 1.0, color: Colors.blue,),
                          new calList(acaList: snapshot.data.jsonList, index: 1,),
                          Divider(thickness: 1.0, color: Colors.blue,),
                          new calList(acaList: snapshot.data.jsonList, index: 2,),
                          Divider(thickness: 1.0, color: Colors.blue,),
                          new calList(acaList: snapshot.data.jsonList, index: 3,),
                          Divider(thickness: 1.0, color: Colors.blue,),
                          new calList(acaList: snapshot.data.jsonList, index: 4,),
                          Divider(thickness: 1.0, color: Colors.blue,),
                          new calList(acaList: snapshot.data.jsonList, index: 5,),
                          Divider(thickness: 1.0, color: Colors.blue,),
                          new calList(acaList: snapshot.data.jsonList, index: 6,),
                          Divider(thickness: 1.0, color: Colors.blue,),
                          new calList(acaList: snapshot.data.jsonList, index: 7,),
                          Divider(thickness: 1.0, color: Colors.blue,),
                          new calList(acaList: snapshot.data.jsonList, index: 8,),
                          Divider(thickness: 1.0, color: Colors.blue,),
                          new calList(acaList: snapshot.data.jsonList, index: 9,),
                          Divider(thickness: 1.0, color: Colors.blue,),
                          new calList(acaList: snapshot.data.jsonList, index: 10,),
                          Divider(thickness: 1.0, color: Colors.blue,),
                          new calList(acaList: snapshot.data.jsonList, index: 11,),
                          Divider(thickness: 1.0, color: Colors.blue,),
                          new calList(acaList: snapshot.data.jsonList, index: 12,),
                          Divider(thickness: 1.0, color: Colors.blue,),
                          new calList(acaList: snapshot.data.jsonList, index: 7,),
                          Divider(thickness: 1.0, color: Colors.blue,),
                          new calList(acaList: snapshot.data.jsonList, index: 8,),
                          Divider(thickness: 1.0, color: Colors.blue,),
                          new calList(acaList: snapshot.data.jsonList, index: 9,),
                          Divider(thickness: 1.0, color: Colors.blue,),
                          new calList(acaList: snapshot.data.jsonList, index: 10,),
                          Divider(thickness: 1.0, color: Colors.blue,),
                          new calList(acaList: snapshot.data.jsonList, index: 11,),
                          Divider(thickness: 1.0, color: Colors.blue,),
                          new calList(acaList: snapshot.data.jsonList, index: 12,),
                          Divider(thickness: 1.0, color: Colors.blue,),
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  void setData(List jsonList) {
    try {
      for (var i = 0; i < jsonList.length; i++) {
        if (_events[DateTime(jsonList[i]['date']['year'],
                jsonList[i]['date']['month'], jsonList[i]['date']['day'])] ==
            null) {
          _events[DateTime(jsonList[i]['date']['year'],
              jsonList[i]['date']['month'], jsonList[i]['date']['day'])] = [];
        }
        {
          _events[DateTime(jsonList[i]['date']['year'],
                  jsonList[i]['date']['month'], jsonList[i]['date']['day'])]
              .add(jsonList[i]['calendar']);
        }
      }
      key = false;
    } catch (e) {
      print('\nErrortype : ${e}\n');
    }
  }


}

class calList extends StatelessWidget {

  calList({@required this.index, @required this.acaList});

  final index;
  final acaList;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${acaList[index]["date"]["year"]}년\t${acaList[index]["date"]["month"]}월\t${acaList[index]["date"]["day"]}일',
          style: TextStyle(
            color: const Color(0xff131415),
            fontWeight: FontWeight.w300,
            fontFamily: "NotoSansKR",
            fontStyle: FontStyle.normal,
            fontSize: ScreenUtil().setSp(16),
          ),
        ),
        Text(
//          '${snapshot.data.jsonList[index]["calendar"]}',
          '${acaList[index]["calendar"]}',
          style: TextStyle(
            color: const Color(0xff131415),
            fontWeight: FontWeight.w300,
            fontFamily: "NotoSansKR",
            fontStyle: FontStyle.normal,
            fontSize: ScreenUtil().setSp(16),
          ),
        ),
      ],
    );
  }
}
