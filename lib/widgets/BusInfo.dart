import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusInfo extends StatelessWidget {
  final List<dynamic> timeTable;
  final double width;
  final String title;

  const BusInfo(
      {Key key,
      @required this.timeTable,
      @required this.width,
      @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;
    double fullHeight = MediaQuery.of(context).size.height;
    ScreenUtil.init(context,
        width: fullWidth, height: fullHeight, allowFontScaling: false);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: const Color(0xff000000),
            fontWeight: FontWeight.w600,
            fontFamily: "NotoSansKR",
            fontStyle: FontStyle.normal,
            fontSize: ScreenUtil().setSp(16),
          ),
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Container(
                  width: width,
                  height: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            timeTable[0]["min"],
                            style: TextStyle(
                              color: const Color(0xff131415),
                              fontWeight: FontWeight.w500,
                              fontFamily: "NotoSansKR",
                              fontStyle: FontStyle.normal,
                              fontSize: ScreenUtil().setSp(16),
                              letterSpacing: -0.28,
                            ),
                          ),
                          Spacer(),
                          Text(
                            timeTable[0]["content"],
                            style: TextStyle(
                              color: const Color(0xff666666),
                              fontWeight: FontWeight.w500,
                              fontFamily: "NotoSansKR",
                              fontStyle: FontStyle.normal,
                              fontSize: ScreenUtil().setSp(12),
                              height: 1.7,
                              letterSpacing: -0.25,
                            ),
                          )
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: <Widget>[
                          Text(
                            "다음차",
                            style: TextStyle(
                              color: const Color(0xff131415),
                              fontWeight: FontWeight.w500,
                              fontFamily: "NotoSansKR",
                              fontStyle: FontStyle.normal,
                              fontSize: ScreenUtil().setSp(14),
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            width: fullWidth * 0.053,
                            height: 20,
                            child: Image.asset("images/BusPage/bus_min1.jpg"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  padding: EdgeInsets.only(
                    left: width * 0.07,
                    right: width * 0.07,
                    top: 4.0,
                    bottom: 4.0,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border:
                          Border.all(color: const Color(0xff842fb5), width: 2),
                      color: const Color(0xffffffff))),
            ),
            SizedBox(width: fullWidth * 0.03),
            SafeArea(
              child: Container(
                  width: width,
                  height: 80,
                  padding: EdgeInsets.only(
                    left: width * 0.07,
                    right: width * 0.07,
                    top: 4.0,
                    bottom: 4.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            timeTable[1]["min"],
                            style: TextStyle(
                              color: const Color(0xff131415),
                              fontWeight: FontWeight.w500,
                              fontFamily: "NotoSansKR",
                              fontStyle: FontStyle.normal,
                              fontSize: ScreenUtil().setSp(16),
                              letterSpacing: -0.28,
                            ),
                          ),
                          Spacer(),
                          Text(
                            timeTable[1]["content"],
                            style: TextStyle(
                              color: const Color(0xff666666),
                              fontWeight: FontWeight.w500,
                              fontFamily: "NotoSansKR",
                              fontStyle: FontStyle.normal,
                              height: 1.7,
                              fontSize: ScreenUtil().setSp(12),
                              letterSpacing: -0.25,
                            ),
                          )
                        ],
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "다다음차",
                            style: TextStyle(
                              color: const Color(0xff131415),
                              fontWeight: FontWeight.w500,
                              fontFamily: "NotoSansKR",
                              fontStyle: FontStyle.normal,
                              fontSize: ScreenUtil().setSp(14),
                            ),
                          ),
                          SizedBox(
                            width: fullWidth * 0.053,
                            height: 20,
                            child: Image.asset("images/BusPage/bus_min2.jpg"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border:
                          Border.all(color: const Color(0xff737373), width: 1),
                      color: const Color(0xffffffff))),
            ),
            SizedBox(width: fullWidth * 0.03),
            SafeArea(
              child: Container(
                width: width,
                height: 80,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          timeTable[2]["min"],
                          style: TextStyle(
                            color: const Color(0xff131415),
                            fontWeight: FontWeight.w500,
                            fontFamily: "NotoSansKR",
                            fontStyle: FontStyle.normal,
                            fontSize: ScreenUtil().setSp(16),
                            letterSpacing: -0.28,
                          ),
                        ),
                        Spacer(),
                        Text(
                          timeTable[2]["content"],
                          style: TextStyle(
                            color: const Color(0xff666666),
                            fontWeight: FontWeight.w500,
                            fontFamily: "NotoSansKR",
                            fontStyle: FontStyle.normal,
                            fontSize: ScreenUtil().setSp(12),
                            height: 1.7,
                            letterSpacing: -0.25,
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: <Widget>[
                        Text(
                          "다다",
                          style: TextStyle(
                            color: const Color(0xff131415),
                            fontWeight: FontWeight.w500,
                            fontFamily: "NotoSansKR",
                            fontStyle: FontStyle.normal,
                            fontSize: ScreenUtil().setSp(10),
                          ),
                        ),
                        Text(
                          "다음차",
                          style: TextStyle(
                            color: const Color(0xff131415),
                            fontWeight: FontWeight.w500,
                            fontFamily: "NotoSansKR",
                            fontStyle: FontStyle.normal,
                            fontSize: ScreenUtil().setSp(14),
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                          width: fullWidth * 0.053,
                          height: 20,
                          child: Image.asset("images/BusPage/bus_min2.jpg"),
                        ),
                      ],
                    ),
                  ],
                ),
                padding: EdgeInsets.only(
                  left: width * 0.07,
                  right: width * 0.07,
                  top: 4.0,
                  bottom: 4.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: const Color(0xff737373),
                    width: 1,
                  ),
                  color: const Color(0xffffffff),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
