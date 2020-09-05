import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_statusbar_text_color/flutter_statusbar_text_color.dart';
import 'package:kmouin/widgets/CalendarData.dart';
import 'package:kmouin/widgets/CalendarInfo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Dart:ui';

class CalList extends StatefulWidget {
  @override
  _CalListState createState() => _CalListState();
}

class _CalListState extends State<CalList> {
  Future<CalendarData> calendarData;

  Future<CalendarData> _fetch1() async {
    try {
      print("future 실행!");
      http.Response response = await http.get(
          'https://asia-northeast1-kmouin-62d7f.cloudfunctions.net/api/schedule');
      if (response.statusCode == 200) {
        print(response.body);
        return CalendarData.fromJson(json.decode(response.body));
      } else {
        throw Exception("Failed to load data");
      }
    } catch (err) {
      print("error!");
      return CalendarData.fromJson({
        "status": "error",
        "result": {
          "list": [
            {
              "date": {"year": "1900", "month": "1", "day": "1"},
              "calendar": "일정 정보 없음"
            }
          ],
        }
      });
    }
  }

  void initState() {
    super.initState();
    calendarData = _fetch1();
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarTextColor.setTextColor(null);
    double fullWidth = MediaQuery.of(context).size.width;
    double fullHeight = MediaQuery.of(context).size.height;
    ScreenUtil.init(context,
        width: fullWidth, height: fullHeight, allowFontScaling: false);

    Color _appbarFont = Color(0xff5b9fee);

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
          child: SingleChildScrollView(child: buildFutureBuilder(fullWidth))),
    );
  }

  FutureBuilder<CalendarData> buildFutureBuilder(double fullWidth) {
    return FutureBuilder(
        future: calendarData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData == false) {
            return Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CupertinoActivityIndicator(
                      radius: 20,
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Column(
              children: <Widget>[
                SizedBox(height: 50.0),
                Text(
                  "error",
                  style: TextStyle(
                    color: const Color(0xff131415),
                    fontWeight: FontWeight.w500,
                    fontFamily: "NotoSansKR",
                    fontStyle: FontStyle.normal,
                    fontSize: ScreenUtil().setSp(24),
                  ),
                ),
              ],
            );
          } else {
            print(snapshot.data);
            return Column(
              children: <Widget>[
                SizedBox(
                  height: 4,
                ),
                CalendarInfo(
                  calendarTable: snapshot.data.result["list"],
                ),
              ],
            );
          }
        });
  }
}
