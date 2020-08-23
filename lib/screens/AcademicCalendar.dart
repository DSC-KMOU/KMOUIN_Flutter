import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
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

class CalPage extends StatefulWidget {
  CalPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CalPage> with TickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarTextColor.setTextColor(FlutterStatusbarTextColor.dark);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(47.0),
        child: AppBar(
          centerTitle: false,
          titleSpacing: -5,
          backgroundColor: Colors.white.withOpacity(0.0),
          elevation: 0,
          automaticallyImplyLeading: false,
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
                      color: Color(0xff5b9fee),
                    ),
                    Text(
                      " 메인",
                      style: TextStyle(
                        color: Color(0xff5b9fee),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 18.0,
                        wordSpacing: -5.0,
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
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              //margin: EdgeInsets.only(top: 20.0),
              alignment: Alignment.center,
              width: double.infinity,
              height: 74,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: const Color(0x80d1d1d1),
                    offset: Offset(0, 1),
                    blurRadius: 0,
                    spreadRadius: 0)
              ], color: const Color(0xb3ffffff)),
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Text(
                  "학사일정",
                  style: const TextStyle(
                      color: const Color(0xff5b9fee),
                      fontWeight: FontWeight.w500,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              )),
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
                return _buildTableCalendar();
              }),
          //const SizedBox(height: 13.3),
          Expanded(
            child: _buildEventList(),
          ),
        ],
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

  Widget _buildTableCalendar() {
    return TableCalendar(
        //locale: 'ko_KR',
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
              opacity:
                  Tween(begin: 0.0, end: 1.0).animate(_animationController),
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
                ));
          },

          markersBuilder: (context, date, events, holidays) {
            final children = <Widget>[];

            if (events.isNotEmpty) {
              children.add(Positioned(
                bottom: 1,
                child: Row(children: <Widget>[
                  _buildEventsMarker(date, events, holidays),
                ]),
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
        ));
  }

  Widget _buildEventsMarker(DateTime date, List events, List holidays) {
    return Row(children: <Widget>[
      events.length >= 1
          ? holidays.length == 0 || holidays.length != 1
              ? _buildAnimationContainer_events(date, events)
              : Text('')
          : Text(''),
      events.length >= 2
          ? holidays.length == 0 || holidays.length != 2
              ? _buildAnimationContainer_events(date, events)
              : Text('')
          : Text(''),
      events.length >= 3
          ? holidays.length == 0 || holidays.length != 3
              ? _buildAnimationContainer_events(date, events)
              : Text('')
          : Text(''),
      events.length >= 4
          ? holidays.length == 0 || holidays.length != 4
              ? _buildAnimationContainer_events(date, events)
              : Text('')
          : Text(''),
      events.length >= 5
          ? holidays.length == 0 || holidays.length != 5
              ? _buildAnimationContainer_events(date, events)
              : Text('')
          : Text(''),
    ]);
  }

  Widget _buildAnimationContainer_events(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        //선택했는지(isSelected(date)) , 오늘인지(isToday(date))에 따라 색이 변하는 옵션
        // 삼항연산자를 사용했다.
        color: _calendarController.isSelected(date)
            ? Colors.brown[500]
            : _calendarController.isToday(date)
                ? Colors.brown[300]
                : Colors.blue[400],
        borderRadius: BorderRadius.circular(12.0),
      ),
      width: 9.0,
      height: 9.0,
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
          .map((event) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0x80cacaca),
                              offset: Offset(0, -1),
                              blurRadius: 16,
                              spreadRadius: 2)
                        ],
                        color: Colors.white),
                    child: Row(children: <Widget>[
                      SizedBox(width: 15),
                      Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: const Color(0xff5b9fee),
                            borderRadius: BorderRadius.circular(12.0),
                          )),
                      SizedBox(width: 15),
                      Container(
                          child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(event.toString(),
                            style: const TextStyle(
                                color: const Color(0xff000000),
                                fontWeight: FontWeight.w500,
                                fontFamily: "NotoSansKR",
                                fontStyle: FontStyle.normal)),
                      )
                          /*
=======
>>>>>>> upstream/master
                        child: Text(event.toString(),
                            style: const TextStyle(
                                color: const Color(0xff000000),
                                fontWeight: FontWeight.w500,
                                fontFamily: "NotoSansKR",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0)),
<<<<<<< HEAD
                        */
                          ),
                    ])),
              ))
          .toList(),
    );
  }
}
